browser.runtime.onMessage.addListener(openAllInTabs);

function openAllInTabs({urls}) {
  urls.forEach(url => browser.tabs.create({url}))
  // https://github.com/mozilla/webextension-polyfill/issues/130
  return Promise.resolve("Dummy response to keep the console quiet");
}
