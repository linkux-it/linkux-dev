
source ./installers/common.sh
echo

FILES="${$HOME}/.linkux-dev/conf/osx/vimrc
${$HOME}/.linkux-dev/conf/osx/tmux.conf
${$HOME}/.linkux-dev/conf/osx/zpreztorc
${$HOME}/.linkux-dev/conf/osx/ackrc"

for rcfile in $FILES; do
  ln -s "$rcfile" "${rcfile:t}"
done

e_header "Install zprezto"

[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ] && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

FILES="${ZDOTDIR:-$HOME}/.zprezto/runcoms/zlogin
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zlogout
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zpreztorc
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshenv
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc"
for rcfile in $FILES; do
  ln -s "$rcfile" "${rcfile:t}"
done

chsh -s /bin/zsh

e_header "Install base16 themes"
[ ! -d "~/.config/base16-shell" ] && git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

e_header "Update .zshrc for base 16"
if grep -Fxq "# start bas16 setup" ~/.zshrc
then
  sed -i '' '/# start bas16 setup/,/# end python setup/d' ~/.zshrc
fi

cat >> ~/.zshrc <<- EOM
# start bas16 setup

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# end bas16 setup
EOM

