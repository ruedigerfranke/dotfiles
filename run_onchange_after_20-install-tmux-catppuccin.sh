#!/bin/sh
set -eu

plugin_root="${HOME}/.config/tmux/plugins"
plugin_dir="${plugin_root}/catppuccin/tmux"

mkdir -p "${plugin_root}/catppuccin"

if [ -d "${plugin_dir}/.git" ]; then
  printf '%s already installed\n' "${plugin_dir}"
  exit 0
fi

if [ -e "${plugin_dir}" ]; then
  printf '%s exists but is not a git checkout; skipping\n' "${plugin_dir}" >&2
  exit 0
fi

git clone https://github.com/catppuccin/tmux.git "${plugin_dir}"
