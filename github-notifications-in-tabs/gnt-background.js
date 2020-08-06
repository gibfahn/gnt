browser.runtime.onMessage.addListener(({urls}) => {
  if (Array.isArray(urls)) {
    for (const url of urls) {
      browser.tabs.create({url: url});
    }
    return Promise.resolve("URLs opened.");
  } else {
    return Promise.resolve("No URLs passed.");
  }
});
