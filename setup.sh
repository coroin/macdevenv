#!/bin/bash

# set provision directory
PROVISION=~/.provision

# remove existing directory
# rm -rf $PROVISION

# create provision directory
mkdir -p $PROVISION

# copy scripts to provision
SCRIPTPATH=`dirname "$0"`
cp -R $SCRIPTPATH/* $PROVISION

# clean up
exit 0