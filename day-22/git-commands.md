## Git Local SetUp

* Check git version

`git -v`

* If git is not installed

`sudo apt update`

`sudo apt install git`

* Setup git configuration

`git config --global user.name "<YOUR_NAME>"`

`git config --global user.email "<name@example.com>"`

## Git Commands

| Command | Usage | Example |
|-------|-----------|---------|
| `git init` | initialize a repo inside directory | `git init` |
| `git clone <url>` | clone an existing repo | `git clone https://github.com/alam-rijwan/90days_devops.git` |
| `git add file` | add untrack files | `git add demo.txt` |
| `git commit` | make a commit | `git commit -m "added demo.txt"` |
| `git reset file` | unstrack a file | `git reset demo.txt` |
| `git status` | check if anything to commit/add | `git status` |
| `git log` | check commit history | `git log` |
| `git revert commit-id` | creates new commit that undoes changes made by given commit | `git revert 2d36` |
| `git reset commit-id` | reset head back till given commit id | `git reset 2d36` |

