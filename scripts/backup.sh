#!/bin/bash

# Configuration
MINECRAFT_DIR="/usr/local/reindev"
BACKUP_DIR="backups"
DATE=$(date +"%Y-%m-%d")
BACKUP_FILE="world_backup_$DATE.tar.gz"

# Navigate to Minecraft server directory
cd "$MINECRAFT_DIR" || exit

echo "Creating backup..."

# Create backup
tar -czf "$BACKUP_DIR/$BACKUP_FILE" world

echo "Backup created: $BACKUP_DIR/$BACKUP_FILE"

# Keep only the 12 most recent backups
ls -1t "$BACKUP_DIR"/world_backup_* | tail -n +13 | xargs -r rm