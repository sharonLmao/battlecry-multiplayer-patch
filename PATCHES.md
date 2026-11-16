# Patches

What each changed class does. Classes live under their package in `src/scripts/`;
the edited copies are in `patches/`.

## The core problem
The game authenticates through **GamerSafe** (shut down). Flow was:
`public connect → join "AuthRoom" socket → send GamerSafe token → server returns a
secure login token`. With GamerSafe dead, the AuthRoom never returns a token, so the
game hangs and no online feature works. The Player.IO HTTP API and database are still
live, and the public connection accepts guests.

## Identity / auth
- **`com.battlecry.io.PlayerIO.PlayerIOConnectionSecure`**
  The guest bypass. After the public connect it stops waiting on the AuthRoom and
  treats the public session as logged in (`onConnectTemp`). The connection id is
  `Main.instance.GetPIOid()` (= `GS_<yourname>`) instead of a hardcoded guest, so each
  player has their own server identity and save.
- **`com.lachhhEngine.io.externalAPI.GamerSafeController`**
  `loggedIn` returns true (no live GamerSafe). `playerName` returns a locally stored
  name via a Flash `SharedObject` ("battlecry_guest"). Added helpers:
  `BC_LocalName` (your name, `CHEAT_`-prefixed when cheats are on),
  `BC_HasName` / `BC_SetName` (persist the chosen name + cheat flag),
  `BC_IsCheat`, and `BC_ClearIdentity` (reset).

## Name selection + existence check
- **`com.battlecry.screens.ConnectPlayerIOScreen`**
  Every online connect funnels through `SetInfo`. If no name is chosen yet it opens the
  name chooser first, then connects.
- **`com.battlecry.screens.LoginScreen`** (the dead GamerSafe login box, repurposed)
  Name chooser: validates the name (letters/numbers/underscore, 3–20 chars), checks the
  live server for an existing `PlayerObjects/GS_<name>` (taken → ask again), then a
  Yes/No **"Enable cheats?"** prompt, then saves and connects.
- **`com.battlecry.screens.TitleScreen`**
  START always shows the Offline/Online screen again (the forced "logged in" state was
  auto-jumping straight into multiplayer and hiding Offline).

## Cheats
- **`com.battlecry.Main`**
  The coin-pack handlers (`onItemPurchased`, `ItemPurchased`) now add money only when
  the account has cheats enabled (`GamerSafeController.BC_IsCheat()`).

## UI
- **`com.battlecry.screens.LinkScreen`** (Invite popup)
  Shows `Add me by name: <yourname>` instead of the dead berzerkstudio.com share URL.
- **`com.battlecry.screens.OptionScreen`**
  **Delete Data** also clears the stored name/cheat identity — a full in-game reset.

## Misc
- **`com.battlecry.io.PlayerIO.PlayerIOConnection`**
  Debug trace beacons removed for release.

## server/
`server/api.playerio.com/` is a small PHP forwarder for **Flashpoint only**. Flashpoint
routes the game's `api.playerio.com` calls through its own offline proxy (404). The
forwarder relays them to the real live service. Running standalone (the `.bat`) does
**not** need this — the game reaches `api.playerio.com` directly.
