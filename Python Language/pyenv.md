# Manage multiple python versions using pyenv

Requirements to install pyenv 
brew install openssl readline sqlite3 xz zlib tcl-tk@8 libb2 zstd

## Install pyenv on zsh on mac
    $ curl -fsSL https://pyenv.run | zsh

## Add pyenv to your shell
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(pyenv init -)"' >> ~/.zprofile
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zprofile

## Commands 
pyenv commands
Usage with --help
pyenv install --help
pyenv install --list

### Get the latest pyenv versions
pyenv update 

```zsh
$ pyenv install --list | grep -E ' 3\.([1-9][0-9]+)'
  3.10.0
  3.10-dev
  3.10.1
  ...
  3.13.5
  3.13.5t
  3.13.6
  3.13.6t
  3.13.7
  3.13.7t
  3.14.0rc2
  3.14.0rc2t
  3.14-dev
  3.14t-dev
  3.15-dev
  3.15t-dev
  ```
### Check installed versions
pyenv versions

### Checking the Current Python Executable Path: which
pyenv which python3

### Set the python version
pyenv shell <version>
pyenv local <version>
pyenv global <version>

## Differences between venv, virtualenv and pyenv
pyenv manages multiple Python versions.
virtualenv and venv manage virtual environments for a specific Python version.
pyenv-virtualenv manages virtual environments across multiple Python versions.

### Preferred approach
$ pyenv virtualenv [python_version] <environment_name>
pyenv virtualenv 3.13.5 testProject_venv
pyenv uninstall <virtualenv_name>
pyenv virtualenvs
pyenv local testProject_venv