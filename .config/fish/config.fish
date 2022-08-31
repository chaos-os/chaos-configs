if status is-interactive
    # Commands to run in interactive sessions can go here
end

#-------------------------------RUN ON LAUNCH------------------------------------
ufetch-arch | lolcat
faillock --reset --user $USER
starship init fish | source

#-------------------------------FISH GREETING MESSAGE-----------------------------

###--supress-old-fish-message--###
set fish_greeting ''

###--new-colorful-kitty-message--###
toilet -f term '***Welcome to the Kitty Terminal***' -d /usr/share/figlet/fonts/ -t -F border --rainbow

#-----------------------------------------ALIASES-----------------------------------------

###--term-cmd-apps--###

alias find fd
alias ls "exa -alh --group-directories-first --icons --git"
alias grep rg
alias cat bat
alias sudo "doas --"
alias vim "nvim"
alias tree "exa -a --tree --icons --group-directories-first"

###--system-update-aliases--###

alias update "mirrorup && pupd && aupd && cache && rmbackup"
alias onlyupd "aupd && pupd"

###--aura-aliases--###

alias pupd "/usr/bin/sudo aura -Syu --overwrite=\* --ask 4"
alias psync "/usr/bin/sudo aura -Sy"
alias pinstall "/usr/bin/sudo aura -S"
alias pinfo "aura -Si"
alias psearch "aura --abc -Ss"
alias cache "/usr/bin/sudo aura -Scc"
alias aupd "/usr/bin/sudo -Auxap --overwrite=\* --ask 4 --devel"
alias ainstall "/usr/bin/sudo aura -Axap" 
alias ainfo "aura -Ai"
alias asearch "aura --abc -As"
alias rmorphan "/usr/bin/sudo aura -Oj"
alias rmbackup "/usr/bin/sudo aura -Bc 5"
alias restore "/usr/bin/sudo aura -Br"
alias remove "/usr/bin/sudo aura -Qtdq | paru -Rns -"
alias downgrade "/usr/bin/sudo aura -C"

###--git-aliases--###
alias ginit "git init"
alias gpull "git pull"
alias gadd "git add"
alias gcommit "git commit -m"
alias gpush "git push"
alias gstat "git status"
alias gdiff "git diff"
alias glog "git log -p"

###--general--###
alias rm "rm -rf"
alias cp "cp -r"
alias mkdir "mkdir -p"
alias .. "cd .."
alias brtctl "sudo brightnessctl set"
alias cpd "lms cp"
alias rmd "lms rm"
alias mvd "lms sync"

###--nodejs-aliases--###
alias nd "nodemon -e js,env,html,hbs,css,cert"

###--rkhunter-aliases--###
alias rkchk "sudo rkhunter -c --sk"
alias rklog "sudo cat /var/log/rkhunter.log"
alias rkupd "sudo rkhunter --update"

###--systemd-aliases--###
alias renable "sudo systemctl enable"
alias rdisable "sudo systemctl disable"
alias rstart "sudo systemctl start"
alias rrestart "sudo systemctl restart"
alias rstatus "sudo systemctl status"
alias rstop "sudo systemctl stop"
alias uenable "systemctl enable --user"
alias udisable "systemctl disable --user"
alias ustatus "systemctl status --user"
alias ustart "systemctl start --user"
alias urestart "systemctl restart --user"
alias ustop "systemctl stop --user"

###--journalctl-aliases--###
alias errs "journalctl -p 3 -b"

###--snapper-aliases--###
alias lssnaphome "sudo snapper -c home list"
alias lssnaproot "sudo snapper -c root list"
alias snaphome "sudo snapper -c home -c"
alias snaproot "sudo snapper -c root -c"

###--reflector-aliases--###
alias mirrorup "sudo reflector --save /etc/pacman.d/mirrorlist -a 48 -l 20 -f 5 --sort rate"

###--dotfiles-management-aliases--###
alias config '/usr/bin/git --git-dir=/home/destruct/.cfg/ --work-tree=/home/destruct'
alias config '/usr/bin/git --git-dir=/run/media/destruct/39568688-b38c-43ac-a7de-c0f9888ec0c0/git-repos/dotfiles.git/ --work-tree=/home/destruct'

###--kitty-kittens-aliases--###
alias img="kitty +kitten icat"

#--------------------------------------FUNCTIONS--------------------------------------------

###--vterm-shell-side-config--###
function vterm_printf
    if begin
            [ -n "$TMUX" ]; and string match -q -r "screen|tmux" "$TERM"
        end
        # tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end

###--vterm-clear-scrollback--###
if [ "$INSIDE_EMACS" = vterm ]
    function clear
        vterm_printf "51;Evterm-clear-scrollback"
        tput clear
    end
end

function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

#--------------------------------------custom-fish-bindings----------------------------------
bind ! __history_previous_command
bind '$' __history_previous_command_arguments

# set up the same key bindings for insert mode if using fish_vi_key_bindings
if test "$fish_key_bindings" = 'fish_vi_key_bindings'
    bind --mode insert ! __history_previous_command
    bind --mode insert '$' __history_previous_command_arguments
end

#--------------------------------------Vim-mode----------------------------------------------
fish_vi_key_bindings
