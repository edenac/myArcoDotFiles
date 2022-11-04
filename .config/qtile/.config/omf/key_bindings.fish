# Just clear the commandline on control-c
# las comillas son para comandos del editor y sin las comillas para ejecuciones de comandos pero con atajos

# execute
bind \cc 'commandline -r ""'
bind \cy redo
bind \ch history
bind \ct 'tree -C'

# go to something or things which control can not handle it

#ctrl can't handle it
bind \e\[3\;5~ kill-word

# go to something
bind \eh htop
bind \er ranger
bind \et tmux
bind \en nvim
bind \el lvim

# bind \t forward-char

