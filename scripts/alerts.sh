#!/bin/bash

while read event;
do
  echo -e "Subject:Service has started\n\n$event\n" | sendmail thisisprod@timbrook.im
done < <(docker events --filter event=start);
