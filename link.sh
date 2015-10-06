# Create symbolic links in the home directory to the dotfiles.
for file in $(cd $(dirname $0) && pwd)/.{vimrc,gitignore,gitconfig,tern-config}; do
	ln -s $file ~
done