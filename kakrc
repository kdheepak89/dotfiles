colorscheme gruvbox

set global tabstop 4
set global indentwidth 4

# soft wrap
addhl global/ wrap

# this is going to be a really long line so that I can test the soft wrap of the editor kakoune. I can't really think of what to type over here

# Tab completions and tabstop
hook global InsertCompletionShow .* %{
    try %{
        # this command temporarily removes cursors preceded by whitespace;
        # if there are no cursors left, it raises an error, does not
        # continue to execute the mapping commands, and the error is eaten
        # by the `try` command so no warning appears.
        execute-keys -draft 'h<a-K>\h<ret>'
        map window insert <tab> <c-n>
        map window insert <s-tab> <c-p>
    }
}
hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>
    unmap window insert <s-tab> <c-p>
}


# simulate Vim's textwidth (but hardcoded to some value)
# hook global BufNew .* autowrap-enable
hook global WinCreate .* %{ autowrap-enable }

# vim old habits
map global normal D '<a-l>d' -docstring 'delete to end of line'
map global normal Y '<a-l>y' -docstring 'yank to end of line'

map global normal '#' :comment-line<ret> -docstring 'comment line'
map global normal '<a-#>' :comment-block<ret> -docstring 'comment block'

map global goto m '<esc>m;' -docstring 'matching char'

# add line numbers

hook global WinCreate .* %{
  addhl window/wrap wrap
  addhl window/number-lines number-lines -relative -hlcursor
  addhl window/show-whitespaces show-whitespaces -tab '›' -tabpad '⋅' -lf ' ' -spc ' ' -nbsp '⍽'
  addhl window/show-matching show-matching
  addhl window/VisibleWords regex \b(?:FIXME|TODO|XXX)\b 0:default+rb

  # smarttab-enable
  # tab-completion-enable
  show-trailing-whitespace-enable; face window TrailingWhitespace default,magenta
  # search-highlighting-enable; face window Search +bi
  # volatile-highlighting-enable; face window Volatile +bi
}

# relative line numbers
hook global WinCreate .* %{addhl number_lines -relative}

map global normal <%> '<c-s>%' # Save position before %
map global normal <x> <a-x>

######################################################
# https://github.com/mawww/kakoune/wiki/Bc
# Incrementing / decrementing numbers
def -hidden -params 2 inc %{ %sh{
    if [ "$1" = 0 ]
    then
        count=1
    else
        count="$1"
    fi
    printf '%s%s\n' 'exec h"_/\d<ret><a-i>na' "$2($count)<esc>|bc<ret>h"
} }
map global normal <c-a> ':inc %val{count} +<ret>'
map global normal <c-x> ':inc %val{count} -<ret>'

map global object q Q -docstring 'double quote string'
map global object Q q -docstring 'single quote string'

## More:
# Git extras.
def git-show-blamed-commit %{
  git show %sh{git blame -L "$kak_cursor_line,$kak_cursor_line" "$kak_buffile" | awk '{print $1}'}
}
def git-log-lines %{
  git log -L %sh{
    anchor="${kak_selection_desc%,*}"
    anchor_line="${anchor%.*}"
    echo "$anchor_line,$kak_cursor_line:$kak_buffile"
  }
}
def git-toggle-blame %{
  try %{
    addhl window/git-blame group
    rmhl window/git-blame
    git blame
  } catch %{
    git hide-blame
  }
}
def git-hide-diff %{ rmhl window/git-diff }

declare-user-mode git
map global git b ': git-toggle-blame<ret>'       -docstring 'blame (toggle)'
map global git l ': git log<ret>'                -docstring 'log'
map global git c ': git commit<ret>'             -docstring 'commit'
map global git d ': git diff<ret>'               -docstring 'diff'
map global git s ': git status<ret>'             -docstring 'status'
map global git h ': git show-diff<ret>'          -docstring 'show diff'
map global git H ': git-hide-diff<ret>'          -docstring 'hide diff'
map global git w ': git-show-blamed-commit<ret>' -docstring 'show blamed commit'
map global git L ': git-log-lines<ret>'          -docstring 'log blame'

# Highlight trailing whitespace in normal mode, with the TrailingWhitespace face.
# What I really want is to only not highlight trailing whitespace as I'm
# inserting it, but that doesn't seem possible right now.
def show-trailing-whitespace-enable %{
  # addhl window/TrailingWhitespace regex \h+$ 0:TrailingWhitespaceActive
  # face window TrailingWhitespaceActive TrailingWhitespace
  hook -group trailing-whitespace window ModeChange 'normal:insert' \
    %{ face window TrailingWhitespaceActive '' }
  hook -group trailing-whitespace window ModeChange 'insert:normal' \
    %{ face window TrailingWhitespaceActive TrailingWhitespace }
}
def show-trailing-whitespace-disable %{
  rmhl window/TrailingWhitespace
  rmhooks window trailing-whitespace
}
face global TrailingWhitespace ''

def switch-to-modified-buffer %{
  eval -save-regs a %{
    reg a ''
    try %{
      eval -buffer * %{
        eval %sh{[ "$kak_modified" = true ] && echo "reg a %{$kak_bufname}; fail"}
      }
    }
    eval %sh{[ -z "$kak_main_reg_a" ] && echo "fail 'No modified buffers!'"}
    buffer %reg{a}
  }
}


