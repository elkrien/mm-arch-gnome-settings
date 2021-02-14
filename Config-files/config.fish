# No greeting when starting an interactive shell.
function fish_greeting
end

export MICRO_TRUECOLOR=1

# Fish autostart
neofetch
starship init fish | source
