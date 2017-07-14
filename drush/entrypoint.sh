#!/bin/bash
if [ -x "$(command -v $1)" ]; then
  exec "$@"
else 
  drush $@
fi
