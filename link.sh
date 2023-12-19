# Create symbolic links in the home directory to the dotfiles.
for file in $(cd $(dirname $0) && pwd)/.{zshrc,gitconfig}; do
  ln -sv $file ~
done

# Sync the Desktop folder with Dropbox.
sudo rmdir ~/Desktop && ln -s ~/Library/CloudStorage/Desktop ~/Desktop
