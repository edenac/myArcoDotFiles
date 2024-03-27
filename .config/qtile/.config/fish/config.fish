if status is-interactive
    # Commands to run in interactive sessions can go here
# terminal commands
    alias l "lsd -h"
    alias la "lsd -ah"
    alias ll "lsd -lh"
    alias nv "nvim"

    # alias xampp "sudo xampp"
    # alias maven "~/maven/bin/mvn"#el comando de maven es mvn 

# tmux alias
    alias tl "tmux ls"
    alias tast "tmux attach-session -t"
    alias ta "tmux a"

# lazygit    
    alias lg "lazygit"

# updates
  # update with pacman
    alias update-db='sudo pacman -Sy'
    alias update-system='sudo pacman -Syyu'

  # update with yay pending due to better is apply te real commando to memorize

  # update just one package (app)

  # update cache
    alias update-fc='sudo fc-cache -fv' # to do work a font instaled

# fixes
    alias sysfailed="systemctl list-units --failed"
    alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
    alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
    alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"

# grubconfig
    alias grubconfig="sudo $EDITOR /etc/default/grub"
    alias grubupdate="sudo grub-mkconfig -o /boot/grub/grub.cfg"
    alias grubootconfig="sudo $EDITOR /boot/grub/grub.cfg"

# backgrounds edits
  alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

# install / uninstall

  # to use AUR community-repositories and as user strictly NOT ROOT, DON'T USE AS ROOT
    alias yins "yay -S" 
  
  # to use official pacman repositorires as root
    alias pins "sudo pacman -S"
    alias punins "sudo pacman -Rns"
    alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

end
