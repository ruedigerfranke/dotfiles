# Helpers for using the Dev Container CLI with Colima SSH agent forwarding.

_devcontainer_ssh_socket="/run/host-services/ssh-auth.sock"
_devcontainer_ssh_target="/tmp/ssh-agent.sock"

# Parse an optional leading `-w <path>` workspace flag from the given args.
# Sets _devcontainer_workspace (default ".") and _devcontainer_shift (number of
# args consumed, 0 or 2). Returns non-zero when `-w` is given without a value so
# callers can abort before shifting.
_devcontainer_parse_workspace() {
  _devcontainer_workspace="."
  _devcontainer_shift=0

  if [[ "$1" == "-w" ]]; then
    if [[ -z "$2" ]]; then
      echo "-w requires a workspace path" >&2
      return 1
    fi
    _devcontainer_workspace="$2"
    _devcontainer_shift=2
  fi
}

devcheck() {
  if ! command -v colima >/dev/null 2>&1; then
    echo "colima not found" >&2
    return 1
  fi

  if ! command -v devcontainer >/dev/null 2>&1; then
    echo "devcontainer CLI not found" >&2
    return 1
  fi

  if ! colima status >/dev/null 2>&1; then
    echo "Colima is not running. Start it with:" >&2
    echo "  colima start --ssh-agent" >&2
    return 1
  fi

  if ! colima ssh -- test -S "$_devcontainer_ssh_socket" >/dev/null 2>&1; then
    echo "Colima SSH agent socket not available. Restart Colima with:" >&2
    echo "  colima stop" >&2
    echo "  colima start --ssh-agent" >&2
    return 1
  fi
}

devup() {
  _devcontainer_parse_workspace "$@" || return 1
  shift $_devcontainer_shift
  local workspace="$_devcontainer_workspace"

  devcheck || return $?

  devcontainer up \
    --workspace-folder "$workspace" \
    --mount "type=bind,source=$_devcontainer_ssh_socket,target=$_devcontainer_ssh_target" \
    --remote-env SSH_AUTH_SOCK=$_devcontainer_ssh_target
}

devexec() {
  _devcontainer_parse_workspace "$@" || return 1
  shift $_devcontainer_shift
  local workspace="$_devcontainer_workspace"

  if [[ $# -eq 0 ]]; then
    echo "Usage: devexec [-w <workspace>] <command> [args...]" >&2
    echo "Example: devexec git fetch" >&2
    echo "         devexec -w ~/projects/foo git fetch" >&2
    return 1
  fi

  devcheck || return $?

  devcontainer exec \
    --workspace-folder "$workspace" \
    --remote-env SSH_AUTH_SOCK=$_devcontainer_ssh_target \
    "$@"
}

devsshkeys() {
  _devcontainer_parse_workspace "$@" || return 1
  local workspace="$_devcontainer_workspace"

  devexec -w "$workspace" ssh-add -l
}

_devcontainer_compose() {
  local compose_command="$1"
  shift

  _devcontainer_parse_workspace "$@" || return 1
  shift $_devcontainer_shift
  local workspace="$_devcontainer_workspace"

  (
    cd "$workspace" || return 1

    local repo_root
    repo_root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

    local devcontainer_dir="${repo_root}/.devcontainer"
    local base_compose_file=""

    for candidate in \
      "${devcontainer_dir}/compose.yaml" \
      "${devcontainer_dir}/compose.yml" \
      "${repo_root}/docker-compose.yaml" \
      "${repo_root}/docker-compose.yml" \
      "${devcontainer_dir}/docker-compose.yaml" \
      "${devcontainer_dir}/docker-compose.yml"; do
      if [[ -f "$candidate" ]]; then
        base_compose_file="$candidate"
        break
      fi
    done

    if [[ -z "$base_compose_file" ]]; then
      echo "No .devcontainer/compose.yaml or .devcontainer/compose.yml found." >&2
      return 1
    fi

    local compose_args=(-f "$base_compose_file")

    for override_file in \
      "${devcontainer_dir}/compose.override.yaml" \
      "${devcontainer_dir}/compose.override.yml" \
      "${devcontainer_dir}/compose.overrides.yaml" \
      "${devcontainer_dir}/compose.overrides.yml" \
      "${devcontainer_dir}/compose-override.yaml" \
      "${devcontainer_dir}/compose-override.yml" \
      "${devcontainer_dir}/compose-overrides.yaml" \
      "${devcontainer_dir}/compose-overrides.yml" \
      "${devcontainer_dir}/docker-compose.override.yaml" \
      "${devcontainer_dir}/docker-compose.override.yml" \
      "${devcontainer_dir}/docker-compose-overrides.yaml" \
      "${devcontainer_dir}/docker-compose-overrides.yml"; do
      if [[ -f "$override_file" && "$override_file" != "$base_compose_file" ]]; then
        compose_args+=(-f "$override_file")
      fi
    done

    if [[ "$base_compose_file" == "${repo_root}/docker-compose.yaml" || "$base_compose_file" == "${repo_root}/docker-compose.yml" ]]; then
      for override_file in \
        "${devcontainer_dir}/docker-compose.yaml" \
        "${devcontainer_dir}/docker-compose.yml"; do
        if [[ -f "$override_file" ]]; then
          compose_args+=(-f "$override_file")
        fi
      done
    fi

    cd "$repo_root" || return 1
    docker compose "${compose_args[@]}" "$compose_command" "$@"
  )
}

devstop() {
  _devcontainer_compose stop "$@"
}

devdown() {
  _devcontainer_compose down "$@"
}
