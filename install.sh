#!/bin/sh

echo "Installing phairy"

DESTINATION=${1:-"$HOME/bin"}

mkdir -p -v "$DESTINATION"
if [[ 0 -ne $? ]]; then
    echo "Failed to create missing bin dir"
    exit 1
fi

cp -v "src/phairy"* "$DESTINATION"
if [[ 0 -ne $? ]]; then
    echo "Something went wrong. Maybe $DESTINATION is not writable?"
    exit 2
fi

chmod -v a+x "$DESTINATION/phairy"*
if [[ 0 -ne $? ]]; then
    echo "Something went wrong, can't make phairy scripts executable."
    exit 3
fi

echo "Done!"