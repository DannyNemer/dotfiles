# Create symbolic links in the home directory to the dotfiles.
for file in $(cd $(dirname $0) && pwd)/.{zshrc,aliases,exports,functions,vimrc,gitignore,gitconfig,tern-config}; do
	ln -s $file ~
done