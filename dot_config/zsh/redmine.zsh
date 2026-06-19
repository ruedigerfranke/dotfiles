# Redmine CLI via 1Password
#
# redmine-cli >=0.11 liest Credentials nur noch aus ~/.config/redmine-cli/config.toml
# (keine Env-Vars REDMINE_URL/REDMINE_API_KEY mehr). Damit der API-Key nicht im
# Klartext auf der Platte liegt, rendern wir die config ephemer aus einem
# op://-Template (config.toml.tpl), führen den Befehl aus und shredden sie danach.
#
# Template anlegen: ~/.config/redmine-cli/config.toml.tpl
#   url     = "https://resources.bonn.taktsoft.com/redmine"
#   api_key = "op://Taktsoft/RedmineCLI/password"
redmine() {
  local cfg="${HOME}/.config/redmine-cli/config.toml"
  local tpl="${cfg}.tpl"
  op inject -f -i "$tpl" -o "$cfg" >/dev/null 2>&1 \
    || { print -u2 "redmine: op inject fehlgeschlagen — 1Password entsperrt?"; return 1; }
  redmine-cli "$@"
  local rc=$?
  shred -u "$cfg" 2>/dev/null || rm -f "$cfg"
  return $rc
}
