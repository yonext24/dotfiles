Mi configuración dentro de wsl, para poder integrar la configuración rapidamente hay que correr los siguientes comandos:

```bash
git clone https://github.com/yonext24/dotfiles ~/.dotfiles

# Crear symlinks

mkdir ~/.config

ln -s ~/.dotfiles/nvim ~/.config/nvim

ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh

ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/tmux ~/.config/tmux/
```
