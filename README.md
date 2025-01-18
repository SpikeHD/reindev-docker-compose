<h1 align="center">
  ReIndev Docker Compose
</h1>

<p align="center">
  A fairly simple <code>docker-compose</code> setup running ReIndev or FoxLoader as a server.
</p>

# Guide

1. Clone this repository.
2. Setup your variables, folders, etc. as needed.
3. Run `docker-compose up -d`.
4. Wait for the server to start.
5. Enjoy!

## Directories

* `world` - This is where your world data will be. Or you can put an existing world in there, if you have one!
* `mods` - If using FoxLoader, this is where you should place your mod files. **REMINDER**: Mod `.jar` files should be placed in `mods/ReIndev<version>`, not at the root.
* `backups` - This is where backups will be stored.
* `extra` - This is where extra config files (`ops.txt`, `server.properties`, etc.) are stored. These are mounted as volumes, so they will change if the server changes them within the container.

## Environment Variables

Set any variables you want to use in the `server.env` and `backups.env` files. There are some custom variables included, which are documented below, but you can include any!

### `server.env`

* `FOXLOADER` - Set to `true`/`1`/etc. to use FoxLoader, or `false`/`0`/etc. to use vanilla.
  * **Not required**, will default to vanilla
* `SERVER_DOWNLOAD_URL` - The URL to download the vanilla server from.
  * **Required** if running vanilla
  * **Not required** if running FoxLoader
* `FOXLOADER_DOWNLOAD_URL` - The URL to download the FoxLoader server from.
  * **Not required** if running FoxLoader (it will just download the latest release)
  * **Not required** if running vanilla

### `backups.env`

* `RUN_EVERY` - How often to run the backup script, in seconds.
  * **Not required**, will default to `4h`
* `KEEP_MAX` - How many backups to keep. Setting this to `0` will keep all backups.
  * **Not required**, will default to `12`

# Notes

* You can switch between vanilla and FoxLoader interchangeably by changing the `FOXLOADER` variable in the `server.env` file. This does not require a rebuild!
* Changing `SERVER_DOWNLOAD_URL` or `FOXLOADER_DOWNLOAD_URL` will not have an effect if the server is already downloaded (aka will require a rebuild).