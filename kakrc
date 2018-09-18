colorscheme gruvbox

plugBegin

plug "kdheepak/kak-sensible"
plug "alexherbo2/volatile-highlighting.kak"
plug "occivink/kakoune-phantom-selection"

plugEnd

map global insert <tab> <space><space><space><space>
# map global insert <backtab> '<a-;><lt>'
# map global insert <backspace> '<a-;>:insert-bs<ret>'
map global normal ';' <a-i>
# map global object x <esc><a-x> -docstring "line"

hook global InsertChar \t %{
    exec -draft h@
}

def -hidden insert-bs %{
    try %{
        # delete indentwidth spaces before cursor
        exec -draft h %opt{indentwidth}HL <a-k>\A<space>+\z<ret> d
    } catch %{
        exec <backspace>
    }
}

def -params 1 extend-line-down %{
  exec "<a-:>%arg{1}X"
}
def -params 1 extend-line-up %{
  exec "<a-:><a-;>%arg{1}K<a-;>"
  try %{
    exec -draft ';<a-K>\n<ret>'
    exec X
  }
  exec '<a-;><a-X>'
}

# map global normal x ':extend-line-down %val{count}<ret>'
# map global normal X ':extend-line-up %val{count}<ret>'

set-option global makecmd 'make --jobs=4'

# Use ripgrep as grep
set-option global grepcmd 'rg --column --with-filename'

# soft wrap
# add-highlighter global/ wrap

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
# hook global WinCreate .* %{ autowrap-enable }

map global normal <x> <a-x>

# vim old habits
map global normal D '<a-l>d' -docstring 'delete to end of line'
map global normal Y '<a-l>y' -docstring 'yank to end of line'
map global normal C '<a-l>c' -docstring 'change to end of line'

map global normal <a-c> 'C' -docstring 'copy selection to next line'

# Delete from line begin to the current position
map global normal <a-D> '<a-h>d' -docstring 'delete from beginning of line'
# Copy from line begin to the current position
map global normal <a-Y> '<a-h>y' -docstring 'copy from beginning of line'
map global normal <a-C> '<a-h>c' -docstring 'change from beginning of line'

map global normal '#' :comment-line<ret> -docstring 'comment line'
map global normal '<a-#>' :comment-block<ret> -docstring 'comment block'

map global goto m '<esc>m;' -docstring 'matching char'


# Highlight trailing whitespace in normal mode, with the TrailingWhitespace face.
# What I really want is to only not highlight trailing whitespace as I'm
# inserting it, but that doesn't seem possible right now.
def show-trailing-whitespace-enable %{
  # add-highlighter window/TrailingWhitespace regex \h+$ 0:TrailingWhitespaceActive
  # face window TrailingWhitespaceActive TrailingWhitespace
  hook -group trailing-whitespace window ModeChange 'normal:insert' \
    %{ face window TrailingWhitespaceActive '' }
  hook -group trailing-whitespace window ModeChange 'insert:normal' \
    %{ face window TrailingWhitespaceActive TrailingWhitespace }
}
def show-trailing-whitespace-disable %{
  remove-highlighter window/TrailingWhitespace
  rmhooks window trailing-whitespace
}


hook global WinCreate .* %{
    # set-face global Whitespace bright-black,default
    # smarttab-enable
    # tab-completion-enable
    show-trailing-whitespace-enable; face window TrailingWhitespace default,magenta
    # search-highlighting-enable; face window Search +bi
    volatile-highlighting-enable; face window Volatile +bi
}


# relative line numbers
# hook global WinCreate .* %{add-highlighter number_lines -relative}
add-highlighter global/number-lines number-lines -relative -hlcursor

add-highlighter global/wrap wrap -word -marker "↳ "
# add-highlighter global/ show-matching

add-highlighter global/VisibleWords regex \b(?:FIXME|TODO|XXX)\b 0:default+rb

set-face global Whitespace rgb:363636,default
set-face global MatchingChar white,white

map global normal <%> '<c-s>%' # Save position before %

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


# User mappings ────────────────────────────────────────────────────────────────

# Paste from system register
# map global user p '!xsel --output --clipboard<ret>' -docstring "paste after"
# map global user P '<a-!>xsel --output --clipboard<ret>' -docstring "paste before"
map global user p '!pbpaste<ret>' -docstring "paste after"
map global user P '<a-!>pbpaste<ret>' -docstring "paste before"

# Replace from system register
# map global user R '|xsel --output --clipboard<ret>' -docstring "replace"
map global user r '|pbpaste<ret>' -docstring "replace"

map global user c '<a-|>pbcopy<ret>' -docstring "copy"
map global user y '<a-|>pbcopy<ret>' -docstring "yank"

# Toggle word wrapping
map global user w ':toggle-highlighter window/wrap wrap -word -indent -width 100 <ret>' -docstring 'wrap'

# Select all occurences of the main selection
map global user a '*%s<ret>' -docstring "select all"

# Show length of selection
# map global user s ':selection-length<ret>' -docstring "selection length"

# Trim all whitespaces
map global user t ':trim-whitespaces<ret>' -docstring "trim whitespaces"

# Extend selections
map global user x ':extend-line-down %val{count}<ret>' -docstring "extend line down"
map global user X ':extend-line-up %val{count}<ret>' -docstring "extend line up"

# map global user <,>     -docstring 'choose buffer'          ': buffer-chooser<ret>'
# map global user <.>     -docstring 'choose file'            ': file-chooser<ret>'
map global user b -docstring 'next buffer' ':buffer-next<ret>'
map global user B -docstring 'previous buffer' ':buffer-previous<ret>'
map global user f -docstring 'format' ': format<ret>'
# map global normal * -docstring 'search word under cursor' '<a-i><a-w>*'

# Expand selection to outer scope
# map global user e ':expand<ret>' -docstring "expand"

# 'lock' mapping where pressing 'e' repeatedly will expand the selection
# declare-user-mode expand
# map global user E ':expand; enter-user-mode -lock expand<ret>' -docstring "expand ↻"
# map global expand e ':expand<ret>' -docstring "expand"

# Select all lines directly below, above and both that contain the current selection at the same position
# map global user v     ':select-down<ret>' -docstring "select down"
# map global user <a-v> ':select-up<ret>' -docstring "select up"
# map global user V     ':select-vertically<ret>' -docstring "select all up/down"

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
    add-highlighter window/git-blame group
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

# face global TrailingWhitespace ''

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

define-command trim-whitespaces %{
   try %{
        exec -draft '%s\h+$<ret>d'
    } catch %{
    }
}

hook global BufWritePre .* trim-whitespaces

# Grep navigation
hook global BufOpenFifo '\Q*grep*' %{
    map global normal <c-n> ':grep-next-match<ret>'
    map global normal <c-p> ':grep-previous-match<ret>'
}

# Make navigation
hook global BufOpenFifo '\Q*make*' %{
    map global normal <c-n> ':make-next-error<ret>'
    map global normal <c-p> ':make-previous-error<ret>'
}

# Restore global mappings
hook global BufCloseFifo '\*(grep|make)\*' %{
    map global normal <c-n> ':buffer-next<ret>'
    map global normal <c-p> ':buffer-previous<ret>'
}


# Indent or deindent when the <tab> is pressed
# map global normal <tab>   '<a-;><gt>'
# map global normal <s-tab> '<a-;><lt>'

# File-types ───────────────────────────────────────────────────────────────────

# Add autowrap to 72 characters in git-commit
hook -group GitWrapper global WinSetOption filetype=git-commit %{
    set-option buffer autowrap_column 72
    autowrap-enable
    hook window WinSetOption filetype=(?!git-commit).* %{ autowrap-disable }
}

evaluate-commands %sh{kak-lsp --config ~/.config/kak/kak-lsp.toml --kakoune -s $kak_session}
lsp-start

# foo_bar → fooBar
# foo-bar → fooBar
# foo bar → fooBar
def camelcase %{
  exec '`s[-_<space>]<ret>d~<a-i>w'
}

# fooBar → foo_bar
# foo-bar → foo_bar
# foo bar → foo_bar
def snakecase %{
  exec '<a-:><a-\;>s-|[a-z][A-Z]<ret>\;a<space><esc>s[-\s]+<ret>c_<esc><a-i>w`'
}

# fooBar → foo-bar
# foo_bar → foo-bar
# foo bar → foo-bar
def kebabcase %{
  exec '<a-:><a-\;>s_|[a-z][A-Z]<ret>\;a<space><esc>s[_\s]+<ret>c-<esc><a-i>w`'
}

lsp-auto-hover-enable
# set-option global lsp_hover_anchor true

# map global normal C <a-l>c
# map global normal <a-c> C
# map global normal w <a-i>w

