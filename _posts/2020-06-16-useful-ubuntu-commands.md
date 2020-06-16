---
layout: post
title: Useful Ubuntu Commands
date: 2020-06-16 10:58 +1000
categories: Programming Code NoteToSelf
---
1. To update the subsystem:

```
sudo apt update        # Fetches the list of available updates

sudo apt upgrade       # Installs some updates; does not remove packages

sudo apt full-upgrade  # Installs updates; may also remove some packages, if needed

sudo apt autoremove    # Removes any old packages that are no longer needed
```