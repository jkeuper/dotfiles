#/bin/sh

#git clone --bare git@github.com:jkeuper/dotfiles.git $HOME/.cfg
git clone --bare https://github.com/jkeuper/dotfiles.git $HOME/.cfg

function cfgit {
 /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

cfgit config --local status.showUntrackedFiles no
cfgit push --set-upstream origin master

cfgit checkout &> /dev/null
if ! [ $? = 0 ]; then
  mkdir -p .cfg-backup
  cfgit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .cfg-backup/{}
  echo "Backing up pre-existing dot files to ~/.cfg-backup/";
  cfgit checkout
  # the .bash_aliases is overwritten here with the cfgit alias already present
else
  echo "alias cfgit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bash_aliases
fi;

