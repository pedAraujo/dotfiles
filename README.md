# Dotfiles
My configuration files for zsh, tmux, nvim, etc. for easy set up.

### Setup
1. Open terminal and run:
```bash
mkdir -p $HOME/Dev/pedAraujo
cd $HOME/Dev/pedAraujo
git clone https://github.com/pedAraujo/dotfiles.git
cd dotfiles
```

2. Make setup script executable
   
Run inside the dotfiles directory:
```bash
chmod +x setup.sh
```

3. Run the Setup script with:
```bash
./setup.sh
```

4. Restart the Terminal:

After the script has finished running, restart your terminal to ensure that the new configurations are loaded properly.

The script will:

- Check if the zsh shell is installed. If it is, it will set up .zshrc and change the default shell to zsh. If not, it will create a .bashrc based on .zshrc and switch the default shell to bash.
- Create symbolic links (symlinks) for your configuration files such as .vimrc, .tmux.conf, etc.
- Install required packages like zsh, tmux, and neovim using apt on Linux or brew on macOS.
- Back up any old configuration files to the ~/dotfiles_backup directory.
