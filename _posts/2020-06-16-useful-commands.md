---
layout: post
title: Useful Commands
date: 2020-06-16 22:11 +1000
categories: [Programming, DevOps]
tags: [commands, jekyll, apt, linux, development-setup, reference, documentation]
description: "A collection of useful commands for system updates, Jekyll blog management, and general development tasks."
---
* To update the subsystem:

```
sudo apt update        # Fetches the list of available updates

sudo apt upgrade       # Installs some updates; does not remove packages

sudo apt full-upgrade  # Installs updates; may also remove some packages, if needed

sudo apt autoremove    # Removes any old packages that are no longer needed
```

* Jekyll commands:

```
jekyll post         # Creates a new post with the given NAME

jekyll page         # Creates a new page with the given NAME

jekyll rename       # Moves a file to a given NAME and sets the title and date

jekyll unpublish    #  Moves a post back into the _drafts directory

jekyll build        # Build your site

jekyll serve        # Serve your site locally
```
