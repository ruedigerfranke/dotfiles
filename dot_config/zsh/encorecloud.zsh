# Kürzel für den geteilten encorecloud-Compose-Stack.
#
# Alle Apps unter solutions/apps/* teilen sich das Compose-Projekt `encorecloud`
# (`name: encore cloud` in jeder .devcontainer/compose.yaml). Daraus folgen zwei
# unterschiedliche Zugriffswege, die sich nicht ersetzen können:
#
#   ec   -> adressiert das LAUFENDE Projekt über -p. Braucht keine Dateien und
#           funktioniert aus jedem Verzeichnis. Kann: ps, exec, logs, restart,
#           stop, start, down, top, kill, images.
#   ecf  -> arbeitet mit den COMPOSE-DATEIEN. Nötig für alles, was die
#           Konfiguration lesen muss: pull, up, build, config.
#
# ecf hardcodet bewusst kein `-f .devcontainer/compose.yaml`, sondern nutzt
# _devcontainer_compose aus devcontainer.zsh — das findet den Repo-Root und den
# passenden Override, dessen Name nicht einheitlich ist (compose-override.yaml
# vs. compose-overrides.yaml bei admins/experiences).

ec() { docker compose -p encorecloud "$@"; }

echelp() {
  /bin/cat <<'EOF'
Encorecloud-Compose-Helfer:

  ec <befehl> [args...]       Laufendes Projekt ansprechen
                              z.B. ec ps, ec restart orders
  ecf <befehl> [args...]      Mit den Compose-Dateien arbeiten
                              z.B. ecf pull, ecf up -d orders
  ecsh <service> [befehl...]  Shell oder Befehl in einem Service ausführen
                              z.B. ecsh admins, ecsh orders bin/rails c
  ecl [service...]            Logs folgen (ECL_TAIL setzt die Zeilenanzahl)
                              z.B. ecl orders, ECL_TAIL=500 ecl orders
  ecpull <service>...         Image ziehen und Service neu erzeugen
                              z.B. ecpull experiences experiences_sidekiq

Hinweis: ec funktioniert aus jedem Verzeichnis. ecf und ecpull müssen aus
einem passenden DevContainer-Workspace aufgerufen werden.
EOF
}

ecf() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: ecf <compose-befehl> [args...]" >&2
    echo "   z.B. ecf pull --policy always experiences" >&2
    return 1
  fi

  if ! typeset -f _devcontainer_compose >/dev/null; then
    echo "ecf: _devcontainer_compose fehlt — ist ~/.config/zsh/devcontainer.zsh geladen?" >&2
    return 1
  fi

  _devcontainer_compose "$@"
}

# Shell (oder beliebiger Befehl) in einem Service. Default ist bash.
#   ecsh admins            ecsh orders bin/rails c
ecsh() {
  local svc=${1:?"Service fehlt — z.B. ecsh admins"}
  shift
  ec exec "$svc" "${@:-bash}"
}

# Logs folgen. Mehr Rückblick über ECL_TAIL=500 ecl orders
ecl() { ec logs -f --tail "${ECL_TAIL:-100}" "$@"; }

# Frisches Image ziehen und den Service damit neu erzeugen.
# `pull` allein ändert nichts am laufenden Container — erst `up -d` setzt das
# neue Image ein, `restart` reicht nicht.
#
# Nicht auf die App anwenden, deren DevContainer gerade offen ist: dafür devup
# bzw. `devcontainer up --workspace-folder . --remove-existing-container`.
ecpull() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: ecpull <service>...   z.B. ecpull experiences experiences_sidekiq" >&2
    return 1
  fi

  ecf pull --policy always "$@" && ecf up -d --force-recreate --no-deps "$@"
}

# Service-Namen aus dem laufenden Projekt vervollständigen.
_ec_services() {
  local -a svc
  svc=(${(f)"$(docker compose -p encorecloud ps --services 2>/dev/null)"})
  compadd -a svc
}

if (( $+functions[compdef] )); then
  compdef _ec_services ecsh ecl ecpull
fi
