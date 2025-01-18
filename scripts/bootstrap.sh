#!/bin/bash

shopt -s nocasematch

# If FOXLOADER is set and the file already exists, we can just exit
if [[ "$FOXLOADER" =~ ^(true|1|yes|on)$ ]] && [[ -f "server-foxloader.jar" ]]; then
  echo "FoxLoader already installed, exiting..."
  exit 0
fi

# Otherwise if it is unset, and the server.jar exists, we can just exit
if [[ ! "$FOXLOADER" =~ ^(true|1|yes|on)$ ]] && [[ -f "server.jar" ]]; then
  echo "Vanilla server already installed, exiting..."
  exit 0
fi

if [[ "$FOXLOADER" =~ ^(true|1|yes|on)$ ]]; then
  echo "Installing FoxLoader..."

  # Get release info
  RELEASE_INFO=$(curl -s "https://api.github.com/repos/Fox2Code/FoxLoader/releases/latest")

  # Extract the .jar file download URL using jq
  JAR_URL=$(echo "$RELEASE_INFO" | jq -r '.assets[] | select(.name | contains("jar")) | .browser_download_url')

  # Download the .jar file
  curl -L -o server-foxloader.jar "$JAR_URL"
  chmod +x server-foxloader.jar
else
  echo "Installing Vanilla server..."

  # Gotta hard code this unfortunately
  curl -L -o server.jar "https://drive.google.com/uc?export=download&id=1iqIQZUnrE2jYAZlCa4gzcjNu5Jp39TxP"
  chmod +x server.jar
fi

shopt -u nocasematch

exit 0