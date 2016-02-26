
source ./installers/common.sh
echo

FILES="${HOME}/.linkux-dev/conf/osx/tmux.conf
${HOME}/.linkux-dev/conf/osx/zpreztorc
${HOME}/.linkux-dev/conf/osx/taskrc
${HOME}/.linkux-dev/conf/osx/ackrc
${HOME}/.linkux-dev/conf/osx/ctags"

ln -s "${HOME}/.linkux-dev/conf/osx/nvimrc" ~/.config/nvim/init.vim

for rcfile in $FILES; do
  ln -s "${rcfile}" ~/.$(basename $rcfile)
done

e_header "Install base16 themes"
[ ! -d "~/.config/base16-shell" ] && git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

e_header "Update .zshrc for global"
if grep -Fxq "# start global setup" ~/.zshrc
then
  sed -i '' '/# start global setup/,/# end global setup/d' ~/.zshrc
fi

cat >> ~/.zshrc <<- EOM
# start global setup

# Base16 Shell
BASE16_SHELL="\$HOME/.config/base16-shell/base16-ashes.dark.sh"
[[ -s \$BASE16_SHELL ]] && source \$BASE16_SHELL

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias codeit='. ./codeit.sh'

export VISUAL=nvim
export EDITOR="$VISUAL"

ulimit -n 4096

# end global setup
EOM

