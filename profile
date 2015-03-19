# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

# Get rid of annoying error message "stdin: is not a tty"
# See https://github.com/mitchellh/vagrant/issues/1673#issuecomment-24404605
tty -s && mesg n
