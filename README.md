# Dotfiles

My dotfiles managed by [chezmoi](https://www.chezmoi.io/).

## Source

The active chezmoi source directory uses the default location:

```sh
~/.local/share/chezmoi
```

Work from there when changing tracked dotfiles:

```sh
cd ~/.local/share/chezmoi
```

## Daily Usage

Preview changes before applying them:

```sh
chezmoi diff
```

Apply the source state to the home directory:

```sh
chezmoi apply
```

Show all files and directories currently managed by chezmoi:

```sh
chezmoi managed
```

Check the local setup:

```sh
chezmoi doctor
```

## Editing Files

Edit files in the source directory, then apply them:

```sh
cd ~/.local/share/chezmoi
$EDITOR dot_zshrc
chezmoi diff
chezmoi apply
```

Alternatively, use chezmoi's edit command for a target file:

```sh
chezmoi edit ~/.zshrc
chezmoi apply
```

## Adding Files

Add an existing local dotfile to the source state:

```sh
chezmoi add ~/.config/example/config.toml
```

Review the generated source path and commit it:

```sh
git status
git diff --cached
git commit -m "Add example config"
```

Generated state, caches, plugin downloads, and logs should not be added. For example, Neovim's config lives under `~/.config/nvim`, but runtime state usually lives under `~/.local/share/nvim`, `~/.local/state/nvim`, and `~/.cache/nvim`.

## Secrets

Secrets belong in 1Password, not in Git. Templates can read them with chezmoi's
1Password integration:

```sh
chezmoi execute-template '{{ onepasswordRead "op://Personal/Context7/context7_api_key" }}'
```

The Zed Context7 API key is referenced from `dot_config/zed/settings.json.tmpl`
and resolved at apply time from 1Password.

## Git Workflow

Keep changes small and verify before pushing:

```sh
chezmoi diff
git status
git diff
git commit -m "Describe the change"
git push
```
