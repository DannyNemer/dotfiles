# Create symbolic links in the home directory to the dotfiles.
for file in $(cd $(dirname $0) && pwd)/.{zshrc,aliases,exports,functions,vimrc,gitignore,gitconfig,tern-config,mackup,mackup.cfg,fit_commit.yml}; do
	ln -sv $file ~
done