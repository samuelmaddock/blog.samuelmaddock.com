---
title: "Problems fixed on my Steam Deck"
tags: ["steam deck", "troubleshooting", "emulation"]
date: 2023-07-31T00:30:00-04:00
draft: true
---

I ordered my Steam Deck back in November, 2021. Since then it's almost entirely replaced my playtime using my desktop PC. Sitting on the couch, booting up the deck, and launching most games works flawlessly.

However, outside of Steam's official library, the software can start to breakdown a bit. This mostly comes up while running emulated games. By far the worst experiences have been sitting around with friends, ready to play an old, multiplayer emulated game and having the experience interrupted mid-session.

I'll be recording and occassionally updating this doc with problems I've run into and their solutions in hopes of helping others—in the case they come across this post. Hope it helps!

## 👾 Emulators

[**EmuDeck**](https://www.emudeck.com/) seemed to be the most popular choice for setting up emulators on the Steam Deck. It was the best choice for me as I didn't want to bother with configuring each emulator individually.

Of course, no software is perfect and I've encountered my fair share of problems with it.

Eventually I came across this table of required files for each emulator. Most startup problems can be resolved by acquiring the files listed here: https://github.com/dragoonDorise/EmuDeck#using-steam-rom-manager

### N64 - Emulator settings not persisting with RetroArch
- Delete configs for cores in `/home/deck/.var/app/org.libretro.RetroArch/config/retroarch/config`
- Remove all the files in **Mupen64Plus-Next** folder
- _Solution initially found in [Reddit thread](https://www.reddit.com/r/SteamDeck/comments/wkjppy/retroarch_on_screen_overlay_settings_wont_save/)_

### N64 - Emulator graphics showing artifacts
- Switch video driver to use vulkan
- Use **ParaLLel-RDP** video core

### N64 - Inputs lockup after controller disconnects
- Link to RetroArch GitHub issue

### SNES - Emulator settings not persisting with RetroArch
- Delete configs for cores in `/home/deck/.var/app/org.libretro.RetroArch/config/retroarch/config`
- Remove all the files in **Snes-9x** folder

### GameCube - Controllers 2-4 not working
- Open Dolphin
- Enable extra controller slots for GameCube

### Xbox - Game won’t start
- Need BIOS files

### Wii - Game won’t start
- Need prod.keys

### PS1/PS2 - Game won’t start
- Need BIOS files

### PS2 - Border around screen
- Set window zoom setting to 101%

## 🎮 Steam Games

### Stardew Valley - Local Co-op Split Screen
- Steam Deck built-in controller causes problems when second player joins while using external Bluetooth controllers
- Need to disable Steam Deck controller using [Auto Disable Steam Controller](https://github.com/scawp/Steam-Deck.Auto-Disable-Steam-Controller) script
  - Note that this also requires setting up a Linux `sudo` password in advance

## Other Games

### PT Emulation 1.3
- Need to switch to Keyboard & Mouse controls to advance past first menu. Then switch back to standard controller input once the gameplay starts.
