#!/bin/sh

echo "Setting up your Mac..."

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo
echo "${green}---------------------------${reset}"
echo "${green}--- Setting up your Mac ---${reset}"
echo "${green}-------===-----------------${reset}"
echo

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update
brew upgrade

# Install all our dependencies with bundle
brew tap homebrew/bundle
brew bundle
brew cleanup

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi    

# Make ZSH the default shell environment
# chsh -s $(which zsh)


echo
echo "${green}-------------${reset}"
echo "${green}--- Done. ---${reset}"
echo "${green}-------------${reset}"
echo