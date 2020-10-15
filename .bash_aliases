alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias toupper="tr [a-z] [A-Z]"
alias tolower="tr [A-Z] [a-z]"

goto() {
  cd `readlink -f $1`
}

## Extract file, example. "ex package.tar.bz2"
extract() {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz)  tar xzf $1 ;;
      *.bz2)     bunzip2 $1 ;;
      *.rar)     rar x $1 ;;
      *.gz)      gunzip $1  ;;
      *.tar)     tar xf $1  ;;
      *.tbz2)    tar xjf $1 ;;
      *.tgz)     tar xzf $1 ;;
      *.zip)     unzip $1 ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1 ;;
      *)         echo $1 cannot be extracted ;;
    esac
  else
    echo $1 is not a valid file
  fi
}

# create directory and navigate to it
mk() {
  mkdir -p -- "$1" && cd -P -- "$1"
}

# ls alias
#ll() {
#  ls -alFh $@
#}

alias cfgit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias hexencode='xxd -p'
alias hexdecode='xxd -p -r'
alias ctrlc='xclip -selection c'
alias ctrlv='xclip -selection c -o'
