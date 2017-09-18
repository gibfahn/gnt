# Github Notifications in Tabs

If you're like me you frequently end up with way too many Github Notifications.
I like to go through them all a page at a time in new tabs to give the browser a
good workout.

This extension adds an extra button to the [GitHub notifications
page](https://github.com/notifications) that opens the current page of
unread notifications in tabs.

**NOTE:** This currently opens 5 items (and adds a red border to the page). This
is for testing purposes.

### Installing

Addons are published here (note that they're not 100% working yet)

- [Firefox Add-on page][]
- [Chrome Add-on page][]

### About WebExtensions

This extension uses the cool new [webextensions api][] (official website
[here][browser extensions]), which means that it works with the newest Firefox,
and will soon work with Chrome. For now though we need to polyfill chrome
support.

### Running locally

To set up this repo:

```bash
git clone --recursive https://github.com/gibfahn/gnt && cd gnt
```

You can load the extension directly from `about:debugging` (Firefox) and
`chrome://extensions` (Chrome). Load the `github-notifications-in-tabs`
subdirectory.

### Developing

To run various useful commands use `./do` (see src for info):

```bash
./do     # Prints available commands.
./do run # Runs web-ext.
```

### Uploading a new version

- [Firefox Dashboard][]
- [Chrome Dashboard][]

[Firefox Add-on page]: https://addons.mozilla.org/en-GB/firefox/addon/github-notifications-in-tabs/
[Chrome Add-on page]: https://chrome.google.com/webstore/detail/github-notifications-in-t/mcccfglfeaibmhkbnkgdkkhoakjdafdf
[webextensions api]: https://developer.mozilla.org/en-US/Add-ons/WebExtensions
[browser extensions]: https://browserext.github.io/browserext/
[Firefox Dashboard]: https://addons.mozilla.org/en-GB/developers/addon/github-notifications-in-tabs/
[Chrome Dashboard]: https://chrome.google.com/webstore/developer/dashboard
