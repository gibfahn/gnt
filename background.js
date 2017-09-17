console.log('background helloooo')
browser.runtime.onMessage.addListener(openAllInTabs);

function openAllInTabs(message) {
  console.log('message:', message)
  // Just open 5 for testing purposes.
  // TODO(gib): Actually open all the tabs.
  let count = 0;
  message.urls.forEach(url => {
    if (count < 5) {
      count++
      const creating = browser.tabs.create({url})
      console.log(`creating ${count}`, creating)
    }
  })
}
