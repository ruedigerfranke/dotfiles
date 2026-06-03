# Helpers for using the Dev Container CLI with Colima SSH agent forwarding.

_devcontainer_ssh_socket="/run/host-services/ssh-auth.sock"
_devcontainer_ssh_target="/tmp/ssh-agent.sock"

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
  local workspace="${1:-.}"

  devcheck || return $?

  devcontainer up \
    --workspace-folder "$workspace" \
    --mount "type=bind,source=$_devcontainer_ssh_socket,target=$_devcontainer_ssh_target" \
    --remote-env SSH_AUTH_SOCK=$_devcontainer_ssh_target
}

devexec() {
  local workspace="."

  if [[ $# -gt 0 ]]; then
    workspace="$1"
    shift
  fi

  if [[ $# -eq 0 ]]; then
    echo "Usage: devexec <workspace> <command> [args...]" >&2
    echo "Example: devexec . git fetch" >&2
    return 1
  fi

  devcheck || return $?

  devcontainer exec \
    --workspace-folder "$workspace" \
    --remote-env SSH_AUTH_SOCK=$_devcontainer_ssh_target \
    "$@"
}

devsshkeys() {
  local workspace="${1:-.}"

  devexec "$workspace" ssh-add -l
}

_devcontainer_compose() {
  local workspace="."
  local compose_command="$1"
  shift

  if [[ $# -gt 0 ]]; then
    workspace="$1"
    shift
  fi

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
