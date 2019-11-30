
# create directory and navigate to it
mk() {
  mkdir "$1" && cd "$1"
}

alias cfgit='/usr/bin/git --git-dir=/root/.cfg/ --work-tree=/root'
