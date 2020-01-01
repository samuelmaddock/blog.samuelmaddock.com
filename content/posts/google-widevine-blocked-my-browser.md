---
title: "I tried creating a web browser, and Google blocked me"
tags: ["browser", "drm", "google", "widevine"]
featured_image: '/images/chromium-cover.png'
images:
- /images/chromium-cover-social.png
date: 2019-04-02T09:00:00-04:00
lastmod: 2019-04-04T09:00:00-04:00
hacker_news: "https://news.ycombinator.com/item?id=19553941"
reddit: "https://www.reddit.com/r/programming/comments/b8jekq/i_tried_creating_a_web_browser_and_google_blocked/"
---

![I'm sorry but we're not supporting an open source solution like this](/images/google-widevine-gmail.png)

After 4 months of waiting, that is the response I got from [Widevine](https://www.widevine.com/), Google’s DRM for web browsers, regarding a [license agreement](https://github.com/castlabs/electron-releases#verified-media-path-vmp). For the last 2 years I’ve been working on a web browser that now cannot be completed because Google, the creators of the _open source_ browser Chrome, won’t allow DRM in an _open source_ project.

The browser I’m building, called [Metastream](https://github.com/samuelmaddock/metastream), is an Electron-based (Chromium derived), MIT-licensed browser hosted on GitHub. Its main feature is the ability to playback videos on the web, synchronized with other peers. Each client runs its own instance of the Metastream browser and transmits playback information to keep them in sync—no audio or video content is sent.

If someone is creating a browser that wants to playback media, they’ll soon discover the requirement of DRM for larger web media services such as Netflix and Hulu. There are a few DRM providers for the web including Widevine, PlayReady, and FairPlay.

As far as I’m aware, Widevine is the only available DRM for a Chromium-based browser, especially so for Electron. Chromium accounts for roughly **70% market share** of all web browsers, soon to include [Microsoft’s upcoming Edge browser rewrite](https://www.windowscentral.com/microsoft-building-chromium-powered-web-browser-windows-10). Waiting 4 months for a minimal response from a vendor with such a large percentage of the market is unacceptable.

This isn't something I'm alone in either, [several Electron users](https://github.com/electron/electron/issues/12427) have waited months for a response. More prominently, the creators of Brave Browser also had [issues waiting for replies from Google Widevine](https://github.com/brave/browser-laptop/issues/10449#issuecomment-323800130).

> “This is a prime example for why free as in beer is not enough. Small share browsers are at the mercy of Google, and Google is stalling us for no communicated-to-us reason.” \
- Brian Bondy, Co-founder & CTO of Brave

I’m now only left with two options regarding the fate of Metastream: stop development of a desktop browser version, or pivot my project to a browser extension with reduced features. The latter requiring publishing to the Google Chrome Web Store which would further entrench the project into a Google walled garden.

If you know of any way to help out, [please get in touch](/contact).

**April 4th edit:** No response from Google Widevine yet. Because a few folks asked, here is the [full email exchange I had with Widevine](/widevine/gmail-thread.html). The initial response was received after getting in contact with another browser vendor to ping a Widevine contact they have. If you intend to inquire about a license agreement for your project, including the information they requested upfront could help.
