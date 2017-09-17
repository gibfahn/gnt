browser.runtime.onMessage.addListener(openAllInTabs);

function openAllInTabs(message) {
  message.urls.forEach(url => browser.tabs.create({url}))
}
