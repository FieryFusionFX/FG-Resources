# Fierygames FXServer - deployment recipe

How to move this exact server (Qbox/qbx, custom resources, the 174-vehicle
add-on pack, everything built this session) from this dev box onto a
different computer. This isn't a txAdmin `recipe.yaml` (a lot of what's here
is hand-patched files, not something a fresh git-clone-and-script deploy
could reproduce) - it's a copy-this / edit-that checklist instead.

`Qbox_A1B5B5.base\` is now a git repo (pushed to GitHub as **FG-Resources**,
private). That's the recommended transfer method since it's just a clone on
the other end - no drives, no FTP client. A direct-copy fallback is included
too in case you ever need it.

## 1. What's in the repo (and what deliberately isn't)

Everything under `F:\Fierygames\txData\Qbox_A1B5B5.base\` is tracked EXCEPT
(see `.gitignore`):

- `cache\` (5.4GB, regenerated automatically on first boot)
- `.replxx_history` (local console history)
- `server.cfg.bkp` (an old backup)
- `secrets.cfg` (per-deployment secrets - see step 3, never committed)

So a clone gets you:
- `resources\` (~5.6GB - almost all of that is `[Autos]`, the vehicle pack)
- `server.cfg`, `ox.cfg`, `voice.cfg`, `permissions.cfg`, `misc.cfg`
- `secrets.cfg.example` (template - copy to `secrets.cfg` and fill in, step 3)
- `myLogo.png` (optional, currently unused - `load_server_icon` is commented out)
- This file

No individual file is anywhere near GitHub's 100MB limit (largest is ~17MB),
so this pushes as a plain repo - no Git LFS needed.

**Direct-copy fallback** (no GitHub): copy the same file list above straight
to the new machine (external drive, `robocopy`, `rsync`, SFTP) instead of
cloning. Because the vehicle models are already-compressed game assets,
zipping first won't meaningfully shrink anything - copy the folder as-is.

## 2. Database

A fresh dump of the current database (schema + all data - characters,
vehicles, money, everything as it stands right now) is at:

    F:\Fierygames\database\backups\Qbox_A1B5B5_deploy.sql

On the main server, create a database and import it:

```
mysql -u root -e "CREATE DATABASE Qbox_A1B5B5 CHARACTER SET utf8mb4"
mysql -u root Qbox_A1B5B5 < Qbox_A1B5B5_deploy.sql
```

(Adjust user/host for whatever MySQL/MariaDB the main server actually runs -
this doesn't have to be the same portable MariaDB this dev box uses.)

## 3. Create `secrets.cfg` on the new box

This file is deliberately never committed to the repo (it never was, even
before the GitHub move - see its own header comment). Copy the template and
fill it in on the new machine:

```
cp secrets.cfg.example secrets.cfg
```

Then fill in:

- `sv_licenseKey` - the existing key should keep working on a new IP, but if
  the server refuses to start or Cfx complains, grab a fresh one from
  https://keymaster.fivem.net/ for the new server.
- `mysql_connection_string` - point this at wherever the database actually
  lives on the main server (host/user/password/db name), not necessarily
  `localhost`/no-password like this dev box.
- `sv_hostname` / `sv_projectName` / `sv_projectDesc` / `qbx:discordLink` -
  branding, set these however you want the live server to look.
- `add_principal identifier.fivem:4707155 group.admin` - this is tied to a
  FiveM account, not the box, so it carries over as-is. Add more
  `add_principal` lines here for any other admins.
- The API key lines (`SCREENSHOT_BASIC_TOKEN`, `NPWD_AUDIO_TOKEN`,
  `inventory:webhook`) are blank/placeholder right now - fill in if you want
  those features live.

Nothing else in `server.cfg`, `ox.cfg`, `voice.cfg`, `permissions.cfg`, or
`misc.cfg` needs to change to move servers.

## 4. Get FXServer itself running on the target

The actual server binary is platform-specific and does NOT come along with
the resources/cfg copy above - it has to match whatever OS the main server
runs.

- **Same OS (Windows):** you can copy `F:\Fierygames\FXServer\` too
  (232MB, contains `server\build_2026-08-20\FXServer.exe`) and reuse
  `start.bat` as a template - just repoint `TXHOST_DATA_PATH` at wherever you
  put the `txData` folder on the new box.
- **Linux (most rented FiveM hosts/VPS):** download a matching or newer
  Linux artifact build from https://runtime.fivem.net/artifacts/fxserver/master/
  (there's no Windows->Linux binary reuse). Point `--data-path`
  at wherever you copied `Qbox_A1B5B5.base` on the new box.
- **A hosting control panel (Zap/PebbleHost/etc.):** these usually just want
  the `resources` folder + `server.cfg` uploaded through their own web UI/FTP,
  and they run their own FXServer binary + txAdmin. Same file list from step 1
  still applies, minus the FXServer binary concern.

## 5. First boot checklist

1. Start MariaDB/MySQL first if it's not already running, and confirm the
   import from step 2 worked (`SHOW TABLES;`).
2. Start FXServer/txAdmin.
3. Watch the console until it settles - this build should start **259**
   resources total when everything (including `fg_heavyarms` and the
   `[Autos]` vehicle pack) comes up clean.
4. Scan the boot log for `error`, `couldn't find`, `SCRIPT ERROR`,
   `exception`, `fatal` - ignore benign `wmic`/`players.json`/`info.json`/
   `dynamic.json` noise, anything else is worth investigating.
5. Join and sanity check: spawn a vehicle, check a garage, check the phone
   garage app, buy something from a shop, confirm police/HUD behave.

## Known quantities from this build (for comparison after deploy)

- 259 resources on a clean boot
- `ox_inventory` reports "Inventory has loaded 306 items"
- Game port `30120` (TCP+UDP), txAdmin port `40120`
