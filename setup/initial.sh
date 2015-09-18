#!/bin/bash

# Fail if attempting to use a variable which hasn't been set.
set -u;
# Stop on first error.
set -e;

# Install aptitude and sudo. Make the current user a sudoer. Logout (you need to logout and then back in for the sudo change to take effect).
# Assumes that there is already a line for the 'sudo' group in the visudoers file.

SUDO_WHO="${USER}";

su root;
apt-get install aptitude;
aptitude install sudo;
adduser "${SUDO_WHO}" sudo;

aptitude install zsh;
chsh cse -s /bin/zsh;

aptitude install git;
exit;
exit;

