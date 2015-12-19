#! /bin/bash

URL="http://paste.bear.im"
BODY=$(cat)
RESULT=`curl -s -S -u "USER:PASS" -X POST -d "$BODY" $URL/documents | sed 's/^.*"key":"\([^"]*\)".*$/\1/'`

echo "$URL/$RESULT"
echo "$URL/$RESULT" | pbcopy
