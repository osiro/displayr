#!/usr/bin/env bash

URL=http://ec2-54-208-43-209.compute-1.amazonaws.com
RETRIES=5
HEALTH_CHECK_INTERVAL_SECONDS=1
SUCCESS_MSG="WebServer is up"
FAIL_MSG="WebServer is down"

while :; do
  curl --retry $RETRIES --silent -o /dev/null $URL

  RESULT=$?

  if [ $RESULT -eq 0 ]; then
    echo $SUCCESS_MSG
  else
    echo $FAIL_MSG
  fi

  sleep $HEALTH_CHECK_INTERVAL_SECONDS
done
