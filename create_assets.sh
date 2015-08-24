#!/bin/bash

EXAMPLE_HOST=idp.example.edu.dist
HOST=$1

function set_assets {
  cp -r -n assets/$EXAMPLE_HOST assets/$HOST
  echo "Set directory 'assets/$HOST'"
}

function set_host_var {
  local host_var="host_vars/$HOST"
  touch $host_var
  echo "Set file '$host_var', see host_vars/$EXAMPLE_HOST for example values."
}

function setup_assets {
  set_host_var
  set_assets
}

if [ "$#" -eq 1 ]
then
  setup_assets
else
  echo "Usage: `basename $0` <hostname>"
  exit 1
fi

