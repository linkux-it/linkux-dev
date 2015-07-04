
source ./installers/common.sh
echo

FILES="${$HOME}/.linkux-dev/conf/ubuntu/vimrc
${$HOME}/.linkux-dev/conf/ubuntu/tmux.conf
${$HOME}/.linkux-dev/conf/ubuntu/zpreztorc
${$HOME}/.linkux-dev/conf/ubuntu/taskrc
${$HOME}/.linkux-dev/conf/ubuntu/ackrc"

for rcfile in $FILES; do
  ln -s "$rcfile" "${rcfile:t}"
done

