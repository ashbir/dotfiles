# Dotfiles

These are my personal dotfiles. They are managed using [GNU Stow](https://www.gnu.org/software/stow/) and Make.

## Installation

To install a specific configuration, for example Neovim, run:

```bash
make nvim
```

Running `make` or `make all` will not install all configurations. You must install them one by one.

This will create symbolic links from the files in the respective directory to your home directory.

## Available Configurations

You can see the available configurations by running:
```bash
make list
```
The following configurations are available, corresponding to the directories in this repository:
- `fvwm`
- `ghostty`
- `git`
- `hyprland`
- `i3`
- `kanata`
- `nvim`
- `sioyek`
- `sway`
- `tmux`
- `vscode`
- `zathura`
- `zsh`

## Other Commands

- `make clean`: Remove all installed configurations.
- `make clean-<config_name>`: Remove a specific configuration (e.g., `make clean-nvim`).
- `make help`: Show available Make targets.
