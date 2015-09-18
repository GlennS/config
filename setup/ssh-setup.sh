#!/bin/bash

# Fail if attempting to use a variable which hasn't been set.
set -u;
# Stop on first error.
set -e;

# Get my ssh keys and config.

git clone https://GlennS@github.com/GlennS/.ssh.git;

pushd .ssh > /dev/null;

git remote remove origin;
git remote add origin git@github.com:GlennS/.ssh.git;
chmod 600 versioncontrol.private.openssh cse_server_root_key;
ssh-agent;
ssh-add versioncontrol.private.openssh;

popd > /dev/null;
