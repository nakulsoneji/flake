const n = await Service.import("notifications")

function openActions() {
  function fetchNotification() {
    return n.notifications.reverse().find(notification => notification.actions != undefined)
  }

  
}

export {}
