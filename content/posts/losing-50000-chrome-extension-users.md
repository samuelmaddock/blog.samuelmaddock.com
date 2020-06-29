---
title: "I lost 50,000 Chrome extension users after adding required permissions"
tags: ["browser extension", "chrome web store", "firefox addon", "metastream"]
featured_image: '/images/extension/webstore-install-prompt.png'
images:
- /images/extension/webstore-install-prompt.png
date: 2020-06-29T13:00:00-04:00
# hacker_news: "https://news.ycombinator.com/item?id=21992050"
# reddit: "https://www.reddit.com/r/programming/comments/eltwlh/the_end_of_indie_web_browsers_you_can_not_compete/"
---

Last week I shipped an update to [my Chrome extension](https://chrome.google.com/webstore/detail/metastream-remote/fakegmdomhmegokfomgmkbopjibonfcp) which added an additional required permission. Here’s what the permission requests access for:

> Change your settings that control websites' access to features such as cookies, JavaScript, plugins, geolocation, microphone, camera etc.

When the extension auto-updates with the newly required permissions, Chrome disables the extension and prompts the user to approve these new permissions.

Because of this, my extension lost 50,000 users over a few days. For comparison, around 700 users uninstall the extension on an average day.

{{< figure src="/images/extension/webstore-uninstalls.png" alt="Chrome Web Store uninstalls with a huge spike during recent days" >}}

{{< figure src="/images/extension/discord-feedback.png" caption="Discord community members rightfully asking what’s up." >}}

{{< figure src="/images/extension/webstore-feedback.png" caption="Chrome Web Store feedback." >}}

These reactions are all justified, the permissions I asked for are broad and could cause harm if used maliciously.

I initially made these changes to workaround a problem in my webapp where two popups are needed and one gets blocked by Chrome’s popup blocker. Using the requested permissions ([contentSettings API](https://developer.chrome.com/extensions/contentSettings)), I can force allowing all popups to be opened from the companion website which requires the extension.

{{< figure src="/images/extension/metastream-popups.jpg" caption="**Left:** Netflix in a popup - synchronized in a session, **Right:** session chat and user management" >}}

Of course, as the developer, I know my use case for this permission is harmless, but a lack of granular permissions and messaging to the end-user means they must accept more than they’d like. Or not, in this case.

I ended up deciding to revert this permission change and make it optional—asking only when needed in the right context. This causes a bit more friction for my app, but the needed permissions are just too much.

Sadly, because of review times, I had to incur further loss of users until Google approved of the changes 12 hours later (not that bad, relatively). In any case, it gave me time to reflect on not making such changes so hastily in the future… 🙃

{{< figure src="/images/extension/webstore-pending.png" caption="Yes, that’s correct. I somehow ended up with “fake” in my extension ID." >}}

In reality, the users I lost because of this were likely those who haven’t used the extension in some time, but rather kept it installed until prompted for additional permissions. And while the effects were of my own doing, there’s more that bothers me about this situation.

The change I needed to make to the extension was to allow all popups to be opened on a website. However, the permissions I asked for had to include geolocation, microphone, and camera access among other things. Why do these permissions need to be so broad?

When a Chrome Web Store developer asks for permissions in their extension, they’re required to write a reason for each (this was added somewhat recently).

{{< figure src="/images/extension/webstore-permission-justification.png" alt="Chrome Web Store permission justifications listed for each API requested." >}}

It’d be great if these could also be displayed to the user when asked to allow an extension. Developers could always stretch the truth here, but it might be better than the permission description alone.

I suspect this particular case might not be as necessary in the future as the web [Permissions API](https://developer.mozilla.org/en-US/docs/Web/API/Permissions_API) further develops ([please add popups to the list!](https://github.com/w3c/permissions/issues/210) 🙇‍♂️).

In addition to my extension being on the Chrome Web Store, [it’s also available as a Firefox Addon.](https://addons.mozilla.org/en-US/firefox/addon/metastream-remote/)

In the Firefox Addon store, it’s listed as part of their Recommended Addons program. This is a huge differentiator from the Chrome Web Store. It comes with benefits for both developers and end users.

_**Real humans**_ review addon updates and provide technical feedback when something isn’t quite right. Seeing firsthand the effort that goes into these reviews gives me much greater trust in their other recommended addons.

{{< figure src="/images/extension/firefox-addon-review.png" caption="An excerpt from a past review by the Firefox Addon team." >}}

For the permission issue I ran into, the update I made was only needed for Chrome. Firefox allows me to open two popups without one being blocked. Had that not been the case though, I suspect their review team could have had helpful feedback for me.

Ultimately, the takeaway here is that if you need to ask for more permissions in an extension, maybe think more carefully on whether it’s really needed or if you can get by with an optional prompt—even if the friction added to the user experience is painful.
