# Create symbolic links in the home directory to the dotfiles.
for file in $(cd $(dirname $0) && pwd)/.{zshrc,functions,gitconfig,mackup,mackup.cfg}; do
	ln -sv $file ~
done
