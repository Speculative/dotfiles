set PATH $PATH $HOME/.config/yarn/global/node_modules/.bin /home/jtao/.deno/bin $HOME/bin $HOME/.local/bin /home/jtao/code/lyoko/scripts
set -x EDITOR nvim
source /home/jtao/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

