#!/bin/bash

shopt -s nocasematch

if [[ "$FOXLOADER" =~ ^(true|1|yes|on)$ ]]; then
  echo "Starting FoxLoader server..."
  java -jar server.jar --server -Dcom.sun.net.ssl.enableECC=false
else
  echo "Starting Vanilla server..."
  java -jar server.jar
fi

shopt -u nocasematch