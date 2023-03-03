# Create symbolic links in the home directory to the dotfiles.
for file in $(cd $(dirname $0) && pwd)/.{zshrc,gitconfig}; do
  ln -sv $file ~
done

# Sync the desktop folder with Dropbox.
sudo remove ~/Desktop && ln -s ~/Dropbox/Desktop ~/Desktop
