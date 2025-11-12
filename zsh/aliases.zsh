alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

alias pt='parquet-tools'

alias code='/usr/local/bin/cursor'

c() {
  code "$(dev cd "$1" --no-chdir)"
}
