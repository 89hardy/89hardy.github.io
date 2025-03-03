---
layout: post
title: To Serverless or to not Serverless
date: 2020-06-27 22:11 +1000
categories: [Programming, Cloud Computing]
tags: [serverless, cloud-computing, aws-lambda, azure-functions, development, architecture]
description: "Explore the pros and cons of serverless architecture and when to use it. A practical guide for developers considering serverless computing for their next project."
image: /assets/images/posts/serverless.jpg
---
I had been wanting to learn more about serverless architectures for some time and after a going through it in detail, I think it's very promising. The hype is totally justified! It changes the game in many ways, and is a good way of inclusion. It simplifies the entry barrier for people who are just starting and saves them the time and complexity of the traditional REST APIs.

For those who are new to this, one can look at it as a cloud computing system in which cloud is not just the storage space, but also the computing server. Resource allocation is completely request and need based, and so is the pricing. You pay for what you use and not for some predefined package. It can be used alongwith the traditional architectures, or as an independent service. It takes away the pain of deployment, system maintenance, scaling, and so on.

Is it something for you? Depends on what you want it to do with it. If you are a developer, just go ahead and try it out, if you haven't yet. It's a good learning curve and something which will be widely accepted in times to come. If you are someone who wants to run some non-complex projects, save on running costs, resources, and the pain of system-level complexities, this is for you. Go and try Amazon Lambda to begin with. You'll only be charged for the instance when a lambda wakes up, takes your request, and gives you the output. Which is literally pennies. So for any non-complex, less/medium traffic service, serverless architectures might work well for you. But if you need heavy computing power and constant database interactions (read ML libraries), with multiple API layers and requests, or support for upcoming languages and SDKs, then the system isn't ready yet. This might change in near future, but that's where it stands at the moment.

So to serverless, or to not serverless? You probably have the answer now!