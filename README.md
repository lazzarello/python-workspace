# Python workspace

A shared, reproducible Python environment for Linux and macOS, powered by Nix and devenv.

## Requirements

Install [Nix](https://nixos.org/download/) and [devenv](https://devenv.sh/getting-started/).

## Use

```sh
devenv shell
tmux new-session -A -s python
```

Inside the session, use `python`, `ptpython`, `ipython`, or `jupyter lab`.

From another terminal, attach with:

```sh
tmux attach -t python
```

Add Python packages declaratively in `devenv.nix`. Enter a fresh `devenv shell` and restart the affected REPL or Jupyter kernel after changing it.

`devenv.lock` pins the environment. Commit notebooks, scripts, and reusable configuration; local REPL history and Jupyter runtime files are ignored.
