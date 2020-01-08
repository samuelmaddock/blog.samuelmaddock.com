---
title: "The End of Indie Web Browsers: You Can (Not) Compete"
tags: ["browser", "drm", "w3c", "eme", "widevine", "playready", "fairplay"]
featured_image: '/images/end-of-evangelion-door.jpg'
images:
- /images/end-of-evangelion-door.jpg
date: 2020-01-08T09:00:00-04:00
hacker_news: "https://news.ycombinator.com/item?id=21992050"
reddit: "https://www.reddit.com/r/webdev/comments/eltwzq/the_end_of_indie_web_browsers_you_can_not_compete/"
---

In 2017, the body responsible for standardizing web browser technologies, W3C, introduced _Encrypted Media Extensions_ (EME)—thus bringing with it the end of competitive indie web browsers.

No longer is it possible to build your own web browser capable of consuming some of the most popular content on the web. Websites like Netflix, Hulu, HBO, and others require copyright content protection which is only accessible through browser vendors who have license agreements with large corporations.

During development of [Metastream⁠](https://getmetastream.com/)—a browser-based side project of mine⁠—I ran into a roadblock when [Google Widevine rejected my application](/posts/google-widevine-blocked-my-browser/) to use their software that allows playback of encrypted media. The same problems I faced are affecting other developers with no known solutions in-sight.

These roadblocks were primarily introduced to appease the media industry.

## Capitalism, Media Distribution, & Piracy

All businesses want to make money, and the media distributors, like Netflix, make theirs by selling access to their content. Of course, if you have something worth selling, someone is going to want it for free.

To defend against digital pirates trying to access their content illegally, media distributors resort to using tools referred to as Digital Rights Management (DRM).

DRM in software is usually a blackbox which controls the way you access content and makes it harder to copy and redistribute. It isn't always 100% effective, given that digital piracy still exists, but it prevents most folks from being able to save the movie they're watching and share it with a friend.

This may sound reasonable if you agree that those who provide value should be paid for their services, but what often results from DRM are additional problems for consumers and creators alike—which I'll soon get into.

## DRM in web browsers

Primarily, web browsers aim to provide universal access to content on the web. Blog posts 👀, social media, videos, music, photos, etc. This is made possible by the [Open Web Platform](https://www.w3.org/wiki/Open_Web_Platform).

> The Open Web Platform is the collection of open (royalty-free) technologies which enables the Web. Using the Open Web Platform, everyone has the right to implement a software component of the Web without requiring any approvals or waiving license fees.

The World Wide Web Consortium (W3C) facilitates the standardization process by which these technologies are added to the web.

So far this has worked out well, and has enabled the universal access to information we have today through browsers like Firefox, Chrome, Safari, and many others. However, starting in 2013, the W3C sought to standardize DRM in web browsers—with support of Google, Microsoft, and Netflix—introducing technology antithetical to the Open Web Platform.

Historically, encrypted media playback was handled in browsers by plugins like Adobe Flash and Microsoft Silverlight. This led to security concerns outside of the control of browser developers. As a means of removing these concerns and enabling more technologies within the open web platform, the W3C published Encrypted Media Extensions (EME).

The [W3C backgrounder on EME](https://www.w3.org/2017/07/EME-backgrounder.html) describes the advantages of the standard:

> Encrypted Media Extensions (EME) enables interoperability, better privacy, security, accessibility and user experience in viewing movies on the Web.

EME provides a common browser API that may be used to discover, select, and interact with _Content Decryption Modules_ (CDM). **A browser must provide a compatible CDM to enable playback of encrypted media.**

## Selecting a CDM

Let's say we've come up with a great new feature for web browsers and decide to take on the challenge of building a browser ourselves—either starting from an existing open source browser or otherwise.

We want this feature to work on all websites so we'll need to provide a CDM for sites like Netflix. If we can't do that, our users will need to keep switching to another browser just for those sites. No good.

Chances are the browser you're using right now provides a CDM so let's look at what it and others provide.

| Browser | CDM |
| --- | --- |
| Chrome | Widevine |
| Firefox | Widevine |
| Safari | FairPlay |
| Edge | PlayReady & Widevine |
| Internet Explorer | PlayReady |
| Opera | Widevine |
| Brave | Widevine |
| Vivaldi | Widevine |
| Yandex | Widevine |

We see there are few options: Widevine, PlayReady, and FairPlay. To legally distribute one of these CDMs, we'll have to submit an application.

### 💤 Google Widevine

The [Widevine contact page](https://www.widevine.com/contact) provides a support link to express interest in completing a License Agreement. The form requests basic contact information and requires a company name.

Upon submitting a License Agreement request, an automated email is sent stating that the request was received and has been forwarded to the appropriate team.

And now... we wait. [Possibly for over four months, like I did.](/posts/google-widevine-blocked-my-browser/) Or perhaps they send the License Agreement, but [ignore further communication for over a year](https://twitter.com/FenetreApp/status/1141711214504005633).

Even developers of Brave browser—founded by _the creator of JavaScript_—[faced similar delays in communication](https://github.com/brave/browser-laptop/issues/10449#issuecomment-323800130).

And if we ever do get a license agreement sent to us, according to castLabs (a [Certified Widevine Implementation Partner](https://www.widevine.com/training)), we [also need Google to bless the authenticity of our browser](https://github.com/castlabs/electron-releases#verified-media-path-vmp) before we can ship to production.

> Once a license agreement is in place you will be asked to provide CSRs for development and production VMP certificates. Google will sign and return the certificates enabling them to be used for VMP-signing your applications.

### 💲 Microsoft PlayReady

Microsoft PlayReady requires its own agreements, which it defines clearly under the _Distributing a downloadable software application to end-users_ section of the [PlayReady licensing page](https://www.microsoft.com/playready/licensing/).

There's a good amount of paperwork involved, but they at least outline a [schedule for the entire process](http://public.wmlalicensing.com/public/). 22 days sounds much more reasonable than an unknown amount of time.

However, examining the _Intermediate Product License_ agreement reveals a deliverable "PlayReady Device Porting Kit and PlayReady Documentation Pack" which **requires a $10,000 advance fee.** In the case of software being sold to end-users, there's also a royalty fee of $0.35 per unit.

### 🚫 Apple FairPlay Streaming

Apple uses a proprietary CDM across its software ecosystem. There doesn't appear to be any open licensing listed on the [FairPlay website](https://developer.apple.com/streaming/fps/). Currently, after opening the _FairPlay Streaming Overview_ link and signing in with an Apple ID, we get an HTTP 403 Forbidden response from their server.

### 🙃 Develop a new CDM

But wait, since this is the Open Web, we can just build our own CDM! The W3C backgrounder on EME states:

> The specification itself can be implemented in open source and free software projects since EME doesn't mandate any particular CDM implementations. [...] The EME specification also allows for future CDM systems, including systems that would be more suitable in free software projects.

Unfortunately, the CDM is only one small part of enabling DRM on the web. Convincing media distributors to buy into a DRM solution is the much more monumental requirement. A level of trust is to be expected which typically could only be established by a large corporation.

Reviewing the [Widevine DRM Architecture Overview](https://web.archive.org/web/20180122175750/https://storage.googleapis.com/wvdocs/Widevine_DRM_Architecture_Overview.pdf) provides a more complete picture of what level of effort could be required. Suffice to say, it's difficult to imagine that any individual or small business could achieve their own DRM playback across all web services which require it.

### Summarizing our options

Ultimately there are two potential options: Widevine or PlayReady.

With Widevine we'll be stuck waiting for an indefinite amount of time without certainty of whether they'll agree to provide their solution.

With PlayReady we can expect to have to pay $10,000 upfront.

## Conclusion

Since the introduction of EME to web standards, the ability for new browsers to compete has become restricted by gatekeepers, which goes against the promises of the platform.

> Using the Open Web Platform, everyone has the right to implement a software component of the Web **without requiring any approvals or waiving license fees.**

Yes, the EME standard can be implemented by anyone, but it's moot when the requirement of a CDM says otherwise.

The barriers of DRM have affected a number of browser-related applications. A few of which are listed below:

- [Brave](https://github.com/brave/browser-laptop/issues/10449#issuecomment-323800130)—Widevine communication delays.
- [ElectronPlayer](https://github.com/oscartbeaumont/ElectronPlayer/issues/20#issuecomment-487313610)—Widevine unresponsive.
- [Fenêtre](https://twitter.com/FenetreApp/status/1141711210150354945)—Widevine unresponsive.
- [Metastream](https://github.com/samuelmaddock/metastream/issues/85)—Widevine rejection.
- [Min](https://github.com/minbrowser/min/issues/641)
- [Pennywise](https://github.com/kamranahmedse/pennywise/issues/40)
- [Wexond](https://github.com/wexond/desktop/issues/175)—Widevine unresponsive.
- _If you know of any other projects, feel free to include them by [creating a pull request.]({{% giturl %}})_

Competition is necessary for innovation—and to create a more accessible space for newcomers, these barriers will need to change.

Ultimately, the best solution for society—rather than profits—is to drop DRM altogether. Given the unlikely chance of this happening, Google, Microsoft, and Apple should work to fix the web platform they've corrupted.

## Further Reading

- [Interoperability and the W3C: Defending the Future from the Present](https://www.eff.org/deeplinks/2016/03/interoperability-and-w3c-defending-future-present)
- [Formal objection: new browsers and EME](https://github.com/w3c/encrypted-media/issues/379)
- [Thoughts on Music - Steve Jobs (2007)](https://web.archive.org/web/20080107121341/http://www.apple.com/hotnews/thoughtsonmusic/)
