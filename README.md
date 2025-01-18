<h1 align="center">
  ReIndev Docker Compose
</h1>

<p align="center">
  A fairly simple `docker-compose` setup running ReIndev or FoxLoader as a server.
</p>

# Guide

Everything you need to know about directories, environment variables, and other things is below!

## Directories

`world` - This is where your world data will be. Or you can put an existing world in there, if you have one!
`mods` - If using FoxLoader, this is where you should place your mod files. **REMINDER**: Mod `.jar` files should be placed in `mods/ReIndev<version>`, not at the root.
`backups` - This is where backups will be stored.
`extra` - This is where extra config files (`banned-players.txt`, `ops.txt`, etc.) are stored.

## Environment Variables

Set any variables you want to use in the `server.env` and `backups.env` files. There are some custom variables included, which are documented below, but you can include any!

### `server.env`

- `FOXLOADER` - Set to `true`/`1`/etc. to use FoxLoader, or `false`/`0`/etc. to use Vanilla.

### `backups.env`

- `RUN_EVERY` - How often to run the backup script, in seconds.
- `KEEP_MAX` - How many backups to keep. Setting this to `0` will keep all backups.

## Usage

1. Clone this repository.
2. Setup your variables, folders, etc. as needed.
3. Run `docker-compose up -d`.
4. Wait for the server to start.
5. Enjoy!
