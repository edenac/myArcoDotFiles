if status is-interactive
    # Commands to run in interactive sessions can go here
# terminal
    alias l "lsd"
    alias nv "nvim"
    alias p "pacman"

# tmux alias
    alias tl "tmux ls"
    alias tast "tmux attach-session -t"
    alias ta "tmux a"

# lazygit    
    alias lg "lazygit"

# bashrc
    alias update='sudo pacman -Syyu'
    alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
    alias update-fc='sudo fc-cache -fv' # to font install 
    alias sysfailed="systemctl list-units --failed"
    alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"
    alias grubconfig="sudo $EDITOR /etc/default/grub"
    alias grubupdate="sudo grub-mkconfig -o /boot/grub/grub.cfg"
    alias grubootconfig="sudo $EDITOR /boot/grub/grub.cfg"
    alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
    alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
    alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"


end
