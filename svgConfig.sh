mkdir -p HOME
mkdir -p ETC

./listPackages.sh > package_list.txt
cat ~/.xinitrc > HOME/.xinitrc
cat ~/.bashrc > HOME/.bashrc
cat ~/.Xresources > HOME/.Xresources
cat ~/.vimrc > HOME/.vimrc
cat ~/.tmux.conf > HOME/.tmux.conf
cat /etc/httpd/conf/httpd.conf > ETC/httpd/httpd.conf
cat /etc/php/php.ini > ETC/php/php.ini
rm -rf HOME/.vim
cp -r ~/.vim HOME/.vim
rm -rf HOME/bin
cp -r ~/bin HOME/
