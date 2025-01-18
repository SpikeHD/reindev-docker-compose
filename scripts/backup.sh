# Configuration
MINECRAFT_DIR="/usr/local/reindev"
BACKUP_DIR="/backups"
DATE=$(date +"%Y-%m-%d")
BACKUP_FILE="world_backup_$DATE.tar.gz"

KEEP_MAX=${KEEP_MAX:-12}

sleep "${RUN_EVERY:-4h}"

# Navigate to Minecraft server directory
cd "$MINECRAFT_DIR" || exit

echo "Creating backup..."

# Create backup
tar -czf "$BACKUP_DIR/$BACKUP_FILE" world

echo "Backup created: $BACKUP_DIR/$BACKUP_FILE"

if [[ "$KEEP_MAX" -eq 0 ]]; then
  echo "Retaining all backups..."
  exit
fi

# Keep only the most recent backups
ls -1t "$BACKUP_DIR"/world_backup_* | tail -n +$KEEP_MAX | xargs -r rm