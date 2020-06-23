---
layout: post
title: Useful Commands
date: 2020-06-16 10:58 +1000
categories: Programming Code NoteToSelf
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
