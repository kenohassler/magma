#!/bin/bash

##
# Pre-requirements:
# - env SHARED: path to directory shared with host (to store results)
##

# BROKEN: this should be "$SHARED/findings/default/crashes", but it's irrelevant for Magma
CRASH_DIR="$SHARED/findings/crashes"

if [ ! -d "$CRASH_DIR" ]; then
    exit 1
fi

find "$CRASH_DIR" -type f -name 'id:*'
