#!/bin/bash

DIRECTORY="/"

THRESHOLD=75

COMMAND_IF_OVER_THRESHOLD="sh prune-images-on-day.sh"
COMMAND_IF_UNDER_THRESHOLD="echo 'Занятость директории не превышает 75%'"

USED_PERCENTAGE=$(df --output=pcent "$DIRECTORY" | tail -n 1 | tr -d ' %')

if [ "$USED_PERCENTAGE" -gt "$THRESHOLD" ]; then
    eval "$COMMAND_IF_OVER_THRESHOLD"
else
    eval "$COMMAND_IF_UNDER_THRESHOLD"
fi
