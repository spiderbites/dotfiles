# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gbs='git branch --sort=-committerdate' # git branch sorted
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gac='git add -A && git commit -m'
alias ge='git-edit-new'

# Delete all local branches that have been merged into the default branch
function gcleanmerged {
  default_branch=$(gdefaultbranch)
  git branch --merged $default_branch | grep -v "\* $default_branch" | xargs -n 1 git branch -d
}

# Interactive branch cleanup - shows branches and lets you pick which to delete
function gcleani {
  git branch --sort=-committerdate | grep -v "^\*" | fzf --multi --preview="git log --oneline --graph --date=short --pretty=\"format:%C(auto)%cd %h%d %s\" {}" | xargs git branch -D
}

# List branches older than N days (outputs branch names only for piping)
function glistold {
  days=${1:-30}
  git for-each-ref --format='%(refname:short) %(committerdate:short)' refs/heads | \
    while read branch date; do
      if [[ $(date -j -f "%Y-%m-%d" "$date" +%s) -lt $(date -j -v-${days}d +%s) ]]; then
        echo "$branch"
      fi
    done
}

# Delete branches older than N days (default 30)
function gcleanold {
  days=${1:-30}
  git for-each-ref --format='%(refname:short) %(committerdate)' refs/heads | \
    awk -v days=$days '$2 <= "'$(date -d "$days days ago" +%Y-%m-%d)'"' | \
    awk '{print $1}' | grep -v "^$(git rev-parse --abbrev-ref HEAD)$" | xargs git branch -D
}

# git add everything and commit it with 'wip' msg
function gwip {
  git add .
  git commit -m 'wip'
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

# Reset current branch to match origin/branch
function greset() {
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  git reset --hard origin/$current_branch
}
