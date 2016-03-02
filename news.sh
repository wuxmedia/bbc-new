#!/bin/bash
## BBC RSS ripper, to a file read by /bin/bar.sh
while :
do
  RSS=$(curl --silent "http://feeds.bbci.co.uk/news/rss.xml?edition=uk" | grep -E '(title>|description>)' | grep -v "BBC News" | sed -e 's/<\/[^>]*>/\n/g' -e 's/<[^>]*>//g' | sed  '/^\s*$/d' | sed -e 's/^[ \t]*//')
  IFS=$'\n'
    for i in $RSS 
    do 
    echo $i > /tmp/rss.feed
    sleep 11s
  done
  sleep 100s
done
