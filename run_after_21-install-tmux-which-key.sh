#!/bin/sh
set -eu

plugin_root="${HOME}/.config/tmux/plugins"
plugin_dir="${plugin_root}/tmux-which-key"

mkdir -p "${plugin_root}"

if [ -d "${plugin_dir}/.git" ]; then
  printf '%s already installed\n' "${plugin_dir}"
  git -C "${plugin_dir}" submodule update --init --recursive
  exit 0
fi

if [ -e "${plugin_dir}" ]; then
  printf '%s exists but is not a git checkout; skipping\n' "${plugin_dir}" >&2
  exit 0
fi

git clone --recursive https://github.com/alexwforsythe/tmux-which-key.git "${plugin_dir}"
