# Mi configuración personal

Mi configuración dentro de wsl:
Para poder integrar la configuración rapidamente hay que correr los siguientes comandos:

```bash
git clone https://github.com/yonext24/dotfiles ~/.dotfiles

# Crear symlinks

mkdir ~/.config

ln -s ~/.dotfiles/nvim ~/.config/nvim

ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/tmux ~/.config/tmux/
```

Esta configuración también contiene el layout de teclado que utilizo.
Esta se tiene que buildear con [Keyboard Layout editor](https://www.microsoft.com/en-us/download/details.aspx?id=102134)

![Imágen del layout](./assets/keyboard.png)
