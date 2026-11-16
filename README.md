# Battle Cry: Age of Myths — Multiplayer Patch

A fan patch that brings the online mode of **Battle Cry: Age of Myths** (Berzerk Studio)
back to life.

The game's backend (Player.IO) is still running — the live ladder, other players'
armies, and the database are all reachable. The only thing that broke is the
**GamerSafe** login service, which was shut down. Because the game could reach the
servers but never sign in, every online feature was dead.

This patch makes the game sign in as a **guest** (skipping the dead GamerSafe step),
so online play works again against the real, still-live servers.

> Unofficial, non-commercial, fan-made preservation project. Not affiliated with
> Berzerk Studio or Player.IO. Share responsibly.

---

## What works

- **Online play** against the live ladder and real players' armies
- **Per-player accounts** — pick a name; your save lives on the Player.IO server
- **Add / battle friends by name** (Friends → Add, type their name)
- **Offline campaign** (unchanged)
- **Optional cheat accounts** — tagged `CHEAT_` so everyone can see them

## How to play (simplest)

1. Put the `dist/` folder somewhere on a Windows PC.
2. Download Adobe's **standalone Flash player** (projector) and save it in `dist/`
   as `flashplayer_sa.exe`. (It isn't redistributed here — see *Flash player* below.)
3. Double-click **`Play-BattleCry-Online.bat`**.
   - It grants the game local-trusted permission (so it can reach the internet) and
     launches it.
4. Click **START → Play Online**, pick a name, and play.

### Flash player
Any Windows standalone Flash projector works. Common sources: a Flashpoint install
(`FPSoftware/Flash/flashplayer_32_sa.exe`) or the Internet Archive's Flash player
collection. Rename it to `flashplayer_sa.exe` and drop it in `dist/`.

## Playing with a friend

1. Each of you runs the build and picks a **unique name** at *Play Online*.
2. **Play at least one online battle** so your army is saved to the server.
3. In **Friends → Add**, type your friend's **name** (no `GS_` prefix — the game adds it).
4. You can now battle each other's armies.

Battles are **asynchronous** (you fight a snapshot of their army) — this is how the
game's "battle your friends" always worked; there is no live real-time match.

## Cheat accounts

When you create a name you're asked **"Enable cheats?"**
- **Yes** → your name is tagged `CHEAT_<name>` (visible to everyone) and the in-game
  coin packs add money.
- **No** → a normal account; coin packs do nothing.

To switch, **Options → Delete Data** fully resets your identity, then make a new one.

## Run it inside Flashpoint instead

If you use [Flashpoint Archive](https://flashpointarchive.org):
1. Copy `dist/battlecry_patched.swf` into
   `Flashpoint/Legacy/htdocs/flonga.com/battlecryageofmyths/`.
2. Copy `server/api.playerio.com/` into `Flashpoint/Legacy/cgi-bin/` (this forwards the
   game's Player.IO calls to the live service, which Flashpoint otherwise blocks).
3. Point the game's launch command at the local file and run it with the debug player.

See `PATCHES.md` for details and `server/` for the forwarder.

## Rebuilding from source

`src/` contains the full decompiled ActionScript of the patched build.
`patches/` contains just the classes that were changed.

To rebuild, use [JPEXS Free Flash Decompiler](https://github.com/jindrapetrik/jpexs-decompiler):

```
ffdec -replace in.swf out.swf com.lachhhEngine.io.externalAPI.GamerSafeController patches/GamerSafeController.as   (and each other patched class)
```

See `PATCHES.md` for the full list and what each change does.

## Credits

Battle Cry: Age of Myths by **Berzerk Studio**. Backend by **Player.IO**.
This is a preservation patch by fans so a childhood game can be played again.
