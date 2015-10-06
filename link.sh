# Create symbolic links in the home directory to the dotfiles.
for file in $(cd $(dirname $0) && pwd)/.{vimrc,gitignore,gitconfig}; do
	ln -s $file ~
done