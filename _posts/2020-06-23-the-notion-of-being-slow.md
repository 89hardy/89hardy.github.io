---
layout: post
title: The Notion of Being Slow
date: 2020-06-23 22:11 +1000
categories: [Technology, Product Review]
tags: [notion, productivity, app-review, user-experience, performance, mobile-apps]
description: "A critical look at Notion's mobile app performance issues and how they impact user experience, despite the platform's powerful features and flexibility."
image: /assets/images/posts/notion.jpg
---
I've been using the [Notion App](https://www.notion.so) for a few months now, and I love it. It's extremely powerful, flexible, and lets you do more than you can imagine. It's like a combined and a better version of Google Keep and Evernote combined. However, there is a known problem with the mobile app which hasn't been addressed for the longest. And it is that of the launch time. It works beautifully on the desktop but takes forever to launch on the mobile. From my past experiences, I've seen apps behave this way when there is a lot of initial asset loading and syncing happening in the background, specifically at the splash screen stage. While I assumed that we as tech community stopped doing lazy loading this way a few years ago, this app has reminded us that we haven't.

The issue probably isn't that of the app being on Electron, but maybe because of the constant requests being sent and received from the server, by virtue of it being a web app. While I'm assuming they have already worked on compressing these requests, going the dedicated mobile app way might be the right way to do it as the user base grows, and while they grow as a company. Reflecting changes on the app instantly and syncing it with the server in the background later is also something that can be seriously considered. But while any of these things, or something else is done to improve this issue, it'll continue to be a major pain point from a user's point of view. And as a regular user, I feel for you!