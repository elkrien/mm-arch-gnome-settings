#### NO GREETING WHEN START

function fish_greeting
end

#### FISH COLORS

export MICRO_TRUECOLOR=1


#### "BAT" AS A MANPAGER

set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" 


#### ALIAS

alias cat="bat"
alias ls="exa -abghHlS --group-directories-first"

#### FISH AUTOSTART
neofetch
starship init fish | source


