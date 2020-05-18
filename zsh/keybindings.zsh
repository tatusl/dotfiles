# Jump to beginning and end of the line in vi mode
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# Hack for getting ALT+C working with fzf in MacOS
bindkey "ç" fzf-cd-widget
