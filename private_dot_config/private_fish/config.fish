set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    if test -e /opt/rh/gcc-toolset-12/enable
        bash /opt/rh/gcc-toolset-12/enable
    end
end

function fish_prompt
    # metadata line
    printf "%s[%s]%s" (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
    printf "%s%s%s" (set_color red) (fish_git_prompt) (set_color normal)

    printf "\n"

    # command line
    if set -q SSH_CLIENT; or set -q SSH_CONNECTION
        printf "%s%s@%s" (set_color brblue) $USER $hostname
    end
    printf "%s > " (set_color normal)
end

if command -q direnv
    direnv hook fish | source
end

fish_user_key_bindings
