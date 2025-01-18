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

  # Check if FOXLOADER_DOWNLOAD_URL is set, and set JAR_URL accordingly
  if [[ -z "$FOXLOADER_DOWNLOAD_URL" ]]; then
    echo "FOXLOADER_DOWNLOAD_URL is not set, using latest release..."
    # Get release info
    RELEASE_INFO=$(curl -s "https://api.github.com/repos/Fox2Code/FoxLoader/releases/latest")

    # Extract the .jar file download URL using jq
    JAR_URL=$(echo "$RELEASE_INFO" | jq -r '.assets[] | select(.name | contains("jar")) | .browser_download_url')
  else
    echo "FOXLOADER_DOWNLOAD_URL is set, using that URL..."
    JAR_URL="$FOXLOADER_DOWNLOAD_URL"
  fi

  # Download the .jar file
  curl -L -o server-foxloader.jar "$JAR_URL"
  chmod +x server-foxloader.jar
else
  echo "Installing Vanilla server..."

  # Gotta hard code this unfortunately
  curl -L -o server.jar $SERVER_DOWNLOAD_URL
  chmod +x server.jar
fi

shopt -u nocasematch

exit 0