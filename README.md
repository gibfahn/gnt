# Github Notifications in Tabs

If you're like me you frequently end up with way too many Github Notifications.
I like to go through them all a page at a time in new tabs to give the browser a
good workout.

This extension adds an extra button to the [GitHub notifications
page](https://github.com/notifications) that opens the current page of
unread notifications in tabs.

**NOTE:** This currently opens 5 items (and adds a red border to the page). This
is for testing purposes.

This extension uses the cool new [webextensions api][] (official website
[here][browser extensions]), which means that it works with the newest Firefox,
and will soon work with Chrome. For now though we need to polyfill chrome
support.

To load the polyfill:

```bash
git clone --recursive https://github.com/gibfahn/gnt && cd gnt
(cd webextension-polyfill && npm install)
cp webextension-polyfill/browser-polyfill.js browser-polyfill.js
```

You can load the extension directly from `about:debugging` (Firefox) and
`chrome://extensions` (Chrome).

[webextesions api]: https://developer.mozilla.org/en-US/Add-ons/WebExtensions
[browser extensions]: https://browserext.github.io/browserext/
