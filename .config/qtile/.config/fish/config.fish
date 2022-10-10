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
    alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
#   alias upclean= 'sudo pacman -Syyu --nocofirm --needed ; sudo pacman -Rns $(pacman-Qtdq) --noconfirm --needed' 

end
