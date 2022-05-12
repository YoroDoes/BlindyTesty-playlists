#!/bin/sh

mkdir -p playlists/

[ -f "playlists/$TITLE.json" ] && (echo "A playlist with the name $TITLE already exists" >&2 ; exit 1);

echo "$PLAYLIST" | sed -E 's/^```|```$//g' | jq '.' > "playlists/$TITLE.json"
