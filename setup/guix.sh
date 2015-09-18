#!/bin/bash

# Fail if attempting to use a variable which hasn't been set.
set -u;
# Stop on first error.
set -e;

sudo aptitude install git;
# ToDo get my .ssh keys
# ToDO what else?

sudo aptitude install guile-2.0 libgcrypt20 libgcrypt20-dev build-essential guile-gnutls;
