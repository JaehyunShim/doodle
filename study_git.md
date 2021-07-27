# Study Git

## 1. Sign up & in Github
- [Jaehyun Shim's github page](https://github.com/JaehyunShim)
- [Install Chrome Octotree](https://chrome.google.com/webstore/detail/octotree/bkhaagjahfmjljalopjnoealnfndnagc)

## 2. Install
```sh
$ sudo apt-get install git
```

## 3. Configure
```sh
$ git config --global user.name "JaehyunShim"
$ git config --global user.email "sjh2808@gmail.com"
$ git config --global --list

$ ssh-keygen -t rsa -b 4096 -C "sjh2808@gmail.com"
Enter a file in which to save the key (/Users/you/.ssh/id_rsa): # press enter
Enter passphrase (empty for no passphrase):                     # type 'qwert' and press enter
Enter same passphrase again:                                    # type 'qwert' and press enter
$ ssh-add ~/.ssh/id_rsa                                         # type 'qwert' and press enter
$ cat ~/.ssh/id_rsa.pub                                         # copy ssh key ('Ctrl'+'Shift'+'c')

Login github -> `Settings` -> `SSH and GPG keys` -> `New SSH key`
Paste the copy from id_rsa.pub. Nothing need for the title. Press `Add SSH key`, then done.
```

## 4. Commands
```sh
# Clone
$ git clone https://github.com/JaehyunShim/doodles.git  # https, id and pw needed every time
$ git clone git@github.com:JaehyunShim/doodles.git      # ssh, id and pw not needed

# Add, Commit and Push
$ cd /path/to/git/folder/
$ touch example.cpp
$ git add example.cpp
$ git commit -m 'added example.cpp'
$ git push origin master

# Fix, Commit and Push
$ nano example.cpp                      # modify example.cpp
$ git commit -am 'modified example.cpp' # use '-am' instead of add command for already added files
$ git push origin master

# Pull
$ git pull origin [branch_name]

# Checkout
$ git checkout [branch]
# Checkout a new branch
$ git checkout -b [new_branch]
$ git checkout -b [new_branch] [old_branch]

# Show branch
$ git branch
# Copy branch
$ git branch [new_branch]
$ git branch [new_branch] [old_branch]

# Delete local branch
$ git branch -d [branch_name]
# Delete remote branch
$ git push origin -d [branch_name]

# Cancel git push
$ git reset HEAD^
$ git push -f origin [branch_name]

# Remove git log
$ rm -rf .git
$ git init
$ git add .
$ git commit -m "Update"
$ git remote add origin http://github.com/JaehyunShim/repo_name.git
$ git push -uf origin master
```

## 5. Gitflow
- [Reference](http://woowabros.github.io/experience/2017/10/30/baemin-mobile-git-branch-strategy.html)
```sh
master branch       # For latest source code
ros-version branch  # For release for each ros version
feature branch      # For implementing a function
hotfix branch       # For bug-fixing
ros2 branch         # For latest ros2 source code
ros2-version branch # For release for each ros2 version
```

## 6. GitIgnore
- [gitignore file](https://stackoverflow.com/questions/27850222/what-is-gitignore-exactly/27850270)

## 7. License
- Apache, GNU GPL, MIT, ...

## 8. Reference
- [MissingCS Version Control](https://missing.csail.mit.edu/2020/version-control/)
