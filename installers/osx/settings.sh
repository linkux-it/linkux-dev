
source ./installers/common.sh
echo

FILES="${$HOME}/.linkux-dev/conf/osx/vimrc
${$HOME}/.linkux-dev/conf/osx/tmux.conf
${$HOME}/.linkux-dev/conf/osx/zpreztorc
${$HOME}/.linkux-dev/conf/osx/ackrc"

for rcfile in $FILES; do
  ln -s "$rcfile" "${rcfile:t}"
done

