{ pkgs, config, ... }:

let
  workspace = toString config.devenv.root;
in
{
  packages = [
    pkgs.git
    pkgs.jujutsu
    pkgs.tmux
    pkgs.python3Packages.ipython
    pkgs.python3Packages.jupyterlab
  ];

  languages.python.enable = true;

  env = {
    IPYTHONDIR = "${workspace}/config/ipython";
    PTPYTHON_CONFIG_HOME = "${workspace}/config/ptpython";
    JUPYTER_CONFIG_DIR = "${workspace}/config/jupyter";
    JUPYTER_RUNTIME_DIR = "${workspace}/.state/jupyter/runtime";
  };

  scripts.ptpython.exec = ''
    mkdir -p "${workspace}/.state/ptpython"
    exec ${pkgs.python3Packages.ptpython}/bin/ptpython \
      --history-file "${workspace}/.state/ptpython/history" "$@"
  '';

  enterShell = ''
    mkdir -p "${workspace}/.state/ipython" "${workspace}/.state/jupyter/runtime"
  '';
}
