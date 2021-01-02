function __fzf_cd_subdir -d "Change directory"
    set --local --export SHELL (command --search fish)
    set selected (
        fd -t d --color=always --exclude=.git 2>/dev/null |
        fzf --ansi --preview='__fzf_preview_file {}'
    )

    if test $status -eq 0
        if not test -z "$selected"
            builtin cd "$selected"
            # Remove last token from commandline.
            commandline -t ""
        end
    end

    commandline --function repaint
end
