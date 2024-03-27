# Just clear the commandline on control-c
# las comillas son para comandos del editor y sin las comillas para ejecuciones de comandos pero con atajos

# execute
bind \cc 'commandline -r ""'
bind \cy redo
bind \ch 'history | head -50'
bind \ct 'tree -C | bat'
bind \cg lazygit

# go to something or things which control can not handle it

#ctrl can't handle it
bind \e\[3\;5~ kill-word

# go to something
bind \eh htop
bind \eb btop
bind \er ranger
bind \et tmux
bind \en nvim
bind \el lvim
bind \eg gotop

# bind \t forward-char

