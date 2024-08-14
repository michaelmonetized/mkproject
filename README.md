# Make Project (mkproject.sh)

this is a simple bash script to create new projects and avoid some common mistakes like accidentally pushing .env to a remote repository.

## License

[MIT](LICENSE.md)

## Install

Download the latest release from the [releases page](https://github.com/michaelmonetized/mkproject/releases) and put it somewhere in your path or symlink it to a directory in your path.

```bash
wget https://github.com/michaelmonetized/mkproject/releases/download/v0.1.0/mkproject.zip
unzip mkproject.zip
chmod +x mkproject/mkproject.sh
ln -s $(pwd)/mkproject/mkproject.sh /usr/local/bin/mkproject
cp -r mkproject/template ~/.config/mkproject/
```

## Configure

1. Put any files you want included by default in your new projects in the `~/.config/mkproject/template/` if not found mkproject will use the template from the installation folder.
2. Remove or make any necessary changes to the template files.
3. Place a .env or copy the .env from the install directory to make necessary changes such as the default branch name, initial commit message, or command to run after completetion.

The default $runafter command is `code .` which will open the project in VSCode. Some may choose to change this to `nvim README.md` or `vim .` to open the project in NeoVim or Vim or anything else you like, maybe `gh repo create --public $name && git push`

## Run

```bash
./mkproject.sh <project-name>
```

### Example

```bash
./mkproject.sh my-project
```

The project folder will be created in the current directory and the following files will be added:

1. `.gitignore`
2. `README.md`
3. `LICENSE.md`
4. `.editorconfig`
5. `.prettierrc`
6. `.vscode/settings.json`

mkproject will then run `cd <project-name> && git init --initial-branch=main && git add . && git commit -am "init" && code .` to add the files to the git repository.
