# Delete all local branches which have been merged upstream
function gclean {
  git remote prune origin
  defaultbranch=$(gdefaultbranch)
  git branch --merged $defaultbranch | grep -v "$defaultbranch" | xargs -n 1 git branch -d
}

# git add, git commit -m '.', git rebase NUM_COMMITS
function garc {
  git add .
  git commit -m '.'
  git rebase -i HEAD~"$1"
}

# git rebase NUM_COMMITS
function gr {
  git rebase -i HEAD~"$1"
}

function gitzip() { 
	git archive -o $@.zip HEAD
}

function gdefaultbranch() {
  tl=$(/usr/bin/git rev-parse --show-toplevel)
  if [[ -f "${tl}/.git/refs/heads/main" ]]; then
    echo "main"
  else
    echo "master"
  fi
}