# Dynamic Ghostty window titles for Herdr.
#
# Format:
#   <workspace>: <tab> - <pane title or cwd>

_herdr_title_format() {
  jq -r --arg home "$HOME" '
    def abbr_path:
      if . == $home then "~"
      elif startswith($home + "/") then "~/" + .[($home | length + 1):]
      else .
      end;

    .result.snapshot as $s
    | ($s.focused_workspace_id // "") as $workspace_id
    | ($s.focused_tab_id // "") as $tab_id
    | ($s.focused_pane_id // "") as $pane_id
    | ($s.workspaces[]? | select(.workspace_id == $workspace_id)) as $workspace
    | ($s.tabs[]? | select(.tab_id == $tab_id)) as $tab
    | ($s.panes[]? | select(.pane_id == $pane_id)) as $pane
    | ($workspace.label // $workspace.workspace_id // "herdr") as $workspace_label
    | ($tab.label // ($tab.number | tostring) // $tab.tab_id // "tab") as $tab_label
    | (
        $pane.label
        // $pane.terminal_title_stripped
        // $pane.terminal_title
        // (($pane.foreground_cwd // $pane.cwd // "") | abbr_path)
      ) as $pane_label
    | "\($workspace_label): \($tab_label) - \($pane_label)"
  '
}

_herdr_title_update() {
  [[ -n "$HERDR_ENV" ]] || return 0
  [[ -z "$HERDR_TITLE_DISABLE" ]] || return 0
  command -v herdr >/dev/null 2>&1 || return 0
  command -v jq >/dev/null 2>&1 || return 0

  local title
  title="$(herdr api snapshot 2>/dev/null | _herdr_title_format 2>/dev/null)" || return 0
  [[ -n "$title" ]] || return 0
  [[ "$title" == "$_HERDR_TITLE_LAST" ]] && return 0

  _HERDR_TITLE_LAST="$title"
  herdr terminal title set "$title" >/dev/null 2>&1
}

_herdr_title_socket_path() {
  if [[ -n "$HERDR_SOCKET_PATH" ]]; then
    print -r -- "$HERDR_SOCKET_PATH"
  elif [[ -n "$HERDR_SESSION" ]]; then
    print -r -- "$HOME/.config/herdr/sessions/$HERDR_SESSION/herdr.sock"
  else
    print -r -- "$HOME/.config/herdr/herdr.sock"
  fi
}

_herdr_title_watch() {
  local socket subscribe

  subscribe='{"id":"herdr-title-watch","method":"events.subscribe","params":{"subscriptions":[{"type":"workspace.focused"},{"type":"workspace.renamed"},{"type":"workspace.updated"},{"type":"tab.focused"},{"type":"tab.renamed"},{"type":"tab.moved"},{"type":"pane.focused"},{"type":"pane.updated"},{"type":"pane.moved"},{"type":"pane.closed"},{"type":"layout.updated"}]}}'

  while true; do
    _herdr_title_update
    socket="$(_herdr_title_socket_path)"

    if [[ -S "$socket" ]] && command -v perl >/dev/null 2>&1; then
      HERDR_TITLE_SOCKET="$socket" HERDR_TITLE_SUBSCRIBE="$subscribe" perl -MIO::Socket::UNIX -e '
        my $sock = IO::Socket::UNIX->new(Type => SOCK_STREAM, Peer => $ENV{"HERDR_TITLE_SOCKET"})
          or exit 1;
        print $sock $ENV{"HERDR_TITLE_SUBSCRIBE"}, "\n";
        while (defined(my $line = <$sock>)) {
          print $line;
        }
      ' 2>/dev/null | while IFS= read -r _herdr_title_event; do
        _herdr_title_update
      done
    else
      sleep 2
    fi

    sleep 1
  done
}

_herdr_title_start() {
  [[ -n "$HERDR_ENV" ]] || return 0
  [[ -z "$HERDR_TITLE_DISABLE" ]] || return 0
  command -v herdr >/dev/null 2>&1 || return 0
  command -v jq >/dev/null 2>&1 || return 0

  local key pidfile pid
  key="$(_herdr_title_socket_path)"
  key="${key//[^A-Za-z0-9_.-]/_}"
  pidfile="${TMPDIR:-/tmp}/herdr-title-${key}.pid"

  if [[ -f "$pidfile" ]]; then
    pid="$(<"$pidfile")"
    if [[ -n "$pid" ]] && kill -0 "$pid" >/dev/null 2>&1; then
      return 0
    fi
  fi

  (_herdr_title_watch >/dev/null 2>&1 & print -r -- $! > "$pidfile")
}

if [[ -n "$HERDR_ENV" && -z "$HERDR_TITLE_DISABLE" ]]; then
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd _herdr_title_update
  add-zsh-hook chpwd _herdr_title_update
  _herdr_title_start
fi
