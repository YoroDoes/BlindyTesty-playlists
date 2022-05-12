#!/bin/sh

mkdir -p playlists/

[ -f "playlists/$TITLE.json" ] && (echo "A playlist with the name $TITLE already exists" >&2 ; exit 1);

PLAYLIST=$(echo "$PLAYLIST" | sed -E 's/^```|```$//g')
echo "$PLAYLIST" | jq '.' > /dev/null || exit 1; # exit if json is malformed

echo "$PLAYLIST" | jq '.' > "playlists/$TITLE.json"
