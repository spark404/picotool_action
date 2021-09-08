#!/bin/bash

if [ ! -z "$GITHUB_WORKSPACE" ]; then
	cd $GITHUB_WORKSPACE
fi

/usr/bin/picotool $@