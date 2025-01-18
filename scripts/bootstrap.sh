#!/bin/bash

shopt -s nocasematch

if [[ "$FOXLOADER" =~ ^(true|1|yes|on)$ ]]; then
  echo "Installing FoxLoader..."

  # Get release info
  RELEASE_INFO=$(curl -s "https://api.github.com/repos/Fox2Code/FoxLoader/releases/latest")

  # Extract the .jar file download URL using jq
  JAR_URL=$(echo "$RELEASE_INFO" | jq -r '.assets[] | select(.name | contains("jar")) | .browser_download_url')

  # Download the .jar file
  curl -L -o server.jar "$JAR_URL"
else
  echo "Installing Vanilla server..."

  # Gotta hard code this unfortunately
  curl -L -o server.jar "https://drive.google.com/uc?export=download&id=1iqIQZUnrE2jYAZlCa4gzcjNu5Jp39TxP"
fi

chmod +x server.jar

shopt -u nocasematch