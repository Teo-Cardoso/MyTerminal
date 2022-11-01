#!/bin/sh

git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# Update .zshrc file
echo "export ZSH=\"~/.oh-my-zsh\"
export EDITOR=\'code\'

ZSH_THEME=\"powerlevel10k/powerlevel10k\"
POWERLEVEL9K_MODE=\"agnoster\"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(anaconda custom_ros)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders

POWERLEVEL9K_CUSTOM_ROS_FOREGROUND=\"black\"
POWERLEVEL9K_CUSTOM_ROS_BACKGROUND=\"yellow\"

plugins=(
	git
	dnf
	zsh-syntax-highlighting
	zsh-autosuggestions
	fzf
)
	
source $ZSH/oh-my-zsh.sh" > ~/.zshrc

#Install fonts
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
mkdir ~/.fonts
cp $SCRIPTPATH/.fonts/* ~/.fonts/

set -e

sudo apt install terminator

echo "[global_config]
  suppress_multiple_term_dialog = True
  title_use_system_font = False
  title_font = Hack Bold 9
[keybindings]
[profiles]
  [[default]]
    background_color = \"#0e2f39\"
    background_darkness = 0.9
    background_type = transparent
    cursor_color = \"#ffffff\"
    cursor_color_fg = False
    font = Hack Bold 10
    foreground_color = \"#eeeeec\"
    use_system_font = False
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = \"\"
    [[[child1]]]
      type = Terminal
      parent = window0
[plugins]" > ~/.config/terminator/config
