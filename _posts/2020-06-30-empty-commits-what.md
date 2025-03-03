---
layout: post
title: Empty commits what
date: 2020-06-30 22:11 +1000
categories: [Programming, Version Control]
tags: [git, github-pages, debugging, deployment, troubleshooting, development-workflow]
description: "Learn how to use empty commits as a clever debugging technique to trigger GitHub Pages builds when regular pushes fail. A practical solution for developers using GitHub Pages for their websites."
image: /assets/images/posts/empty-commits.jpg
---
I discovered something very simple, but fascinating today! Since this website is made using Github pages, what Github essentially does is every time I make any changes to the code on the local machine, and commit and push to the master repo on Git, it verifies and rebuilds as per the new commit. If there is an error in the code, the build fails at the verification stage. 

What happened with my last commit was very strange. I did some changes, commit and push my code to the master repo, and waited for it to rebuild, which usually takes a few seconds. To my surprise, it didn't happen. It was late in the night so I left it as is, assuming it would be done by the time I wake up the next day. But it still didn't! So I checked and read up on it. Due to various issues like unstable internet connection, Github server issues etc, the code at times gets pushed to the repo, but Git doesn't recognize a new commit, so it doesn't verify and create a new build. 

As strange as it may be, there's an easy way to fix the problem: An empty commit! Yes, it exists. Just type the following in your terminal/cmd:

```
git commit -m "force building page" --about-empty

git push origin [branch name]
```

This will register a new commit with no changes in the repo, will get verified, and trigger the build automatically. I hadn't faced this problem before, and I was pleasantly surprised with this fun debugging procedure. 