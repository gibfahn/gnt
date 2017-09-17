const notificationCenter = document.getElementById('notification-center')
const tabnav = notificationCenter.getElementsByClassName('tabnav')[0]

const rightBar = tabnav.getElementsByClassName('float-right')[0]
const existingButton = rightBar.getElementsByClassName('btn-sm')[0]

const newButton = document.createElement('button')

newButton.className = existingButton.className
newButton.innerText = 'Open all in tabs'
newButton.onclick = passUrlsToBackground

rightBar.insertBefore(newButton, existingButton)

function passUrlsToBackground(event) {
  const urls = Array.from(
    document.getElementsByClassName('js-navigation-open js-notification-target')
  ).map(a => a.href)
  browser.runtime.sendMessage({urls: urls})
  // TODO(gib): when do we reload the tab? Maybe when all the tabs have been opened?
  // window.location.reload(true)
}
