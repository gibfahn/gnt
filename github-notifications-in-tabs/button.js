const notificationCenter = document.getElementById('notification-center');
const tabnav = notificationCenter.getElementsByClassName('tabnav')[0];
const rightBar = tabnav.getElementsByClassName('float-right')[0];

const newButton = document.createElement('button');
const existingButton = rightBar.getElementsByClassName('btn-sm')[0];

// If there isn't a button class to copy, use last known class.
newButton.className = existingButton !== undefined ? existingButton.className : 'btn btn-sm';

newButton.innerText = 'Open all in tabs'
newButton.onclick = passUrlsToBackground;

// Insert at the end if no existing elements.
rightBar.insertBefore(newButton, rightBar.firstChild);

function passUrlsToBackground(event) {
  const urls = Array.from(
    document.getElementsByClassName('js-navigation-open js-notification-target')
  ).map(a => a.href);
  browser.runtime.sendMessage({urls: urls});
  // TODO(gib): should we reload the tab? Maybe when all the tabs have been opened?
  // window.location.reload(true)
}
