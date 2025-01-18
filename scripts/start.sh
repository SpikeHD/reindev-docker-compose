#!/bin/bash

shopt -s nocasematch

if [[ "$FOXLOADER" =~ ^(true|1|yes|on)$ ]]; then
  echo "Starting FoxLoader server..."

  # This loves to spit out handshake_failures when starting for the first time if this isn't set
  java -jar server-foxloader.jar --server -Dcom.sun.net.ssl.enableECC=false
else
  echo "Starting Vanilla server..."
  java -jar server.jar
fi

shopt -u nocasematch