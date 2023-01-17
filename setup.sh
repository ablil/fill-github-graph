#!/bin/bash
# Description: create dump commit each day of the year 2000


nextdate=2000-01-01
enddate=2000-12-31

while [[ "$nextdate" != "$enddate" ]]; do
  nextdate=$(date -I -d "$nextdate + 1 day")
  echo $(date -d $nextdate)

  # add current date to file
  echo "$nextdate" > currentdate

  # commit file 
  git add currentdate && git commit -m "update date to $nextdate" -o currentdate

  # update commit date
  GIT_COMMITTER_DATE=$(date -d $nextdate) git commit --amend --no-edit --date "$(date -d $nextdate)"
done
