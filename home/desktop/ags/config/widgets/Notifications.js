const notifications = await Service.import("notifications")

notifications.popupTimeout = 3000;
notifications.forceTimeout = true;
notifications.clearDelay = 100;

Utils.timeout(1000, () => Utils.notify({
  summary: "Notification alskjdflaksf Popup Example",
  iconName: "info-symbolic",
  body: "Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.",
  actions: {
    "Cool": () => print("pressed Cool"),
  },
}))
function NotificationsList() {
  function NotificationIcon({ app_icon, app_entry, image }) {
    if (image) {
      return Widget.Box({
        vexpand: true,
        hpack: "center",
        vpack: "center",
        css: `background-image: url("${image}");`
          + "background-size: contain;"
          + "background-repeat: no-repeat;"
          + "background-position: center;"
          + "min-width: 96px;"
          + "min-height: 96px;"
      })
    }
    let icon = "dialog-information-symbolic"

    if (Utils.lookUpIcon(app_icon)) {
        icon = app_icon
    }

    if (app_entry && Utils.lookUpIcon(app_entry)) {
        icon = app_entry
    }
    return Widget.Box({
      css: "min-width: 32px;"
          + "min-height: 32px;", 
      child: Widget.Icon({
        size: 32,
        icon
      })
    })
  }

  function NotificationActions(notification) {
    if (notification.actions == undefined) {
      return Widget.Box({})
    }
    return Widget.Box({
      className: "notification-actions",
      spacing: 10,
      children: notification.actions.map(a => {
        return Widget.Button({
          className: "notification-actions-button",
          hexpand: true,
          onClicked: () => notification.invoke(a.id),
          label: a.label,
        })
      })
    })
  }

  function NotificationWidget(notification) {
    const title = Widget.Label({
      xalign: 0,
      className: "notification-title",
      hpack: "start",
      wrap: true,
      hexpand: true,
      useMarkup: true,
      maxWidthChars: 30,
      label: notification.summary,
    })

    const icon = Widget.Box({
      className: "notification-icon",
      child: NotificationIcon(notification)
    })
    
    let children = [ title ]

    if (notification.body != "") {
      const body = Widget.Label({
        className: "notification-body",
        maxWidthChars: 25,
        justification: "left",
        hexpand: true,
        xalign: 0,
        wrap: true,
        label: notification.body,
      })
      children.push(body)
    }

    return Widget.Box({
      attribute: notification,
      orientation: 1,
      classNames: [ 
        "notification",
        `notification-${notification.urgency}`
      ], 
      children: [
        Widget.Box({
          children: [
            icon,
            Widget.Box({
              vertical: true,
              vpack: "center",
              children
            }),
          ]
        }),
        NotificationActions(notification)
      ],
    })
  }

  return Widget.Box({
    children: notifications.popups.map(NotificationWidget),
    css: "min-width: 2px; min-height: 2px;",
    className: "notification-list",
    vertical: true,
    setup: self => {
      function onNotified(id) {
        const n = notifications.getNotification(id)
        if (n) {
          self.children = [...self.children, NotificationWidget(n)]
        }
      }
      function onDismissed(id) {
        self.children.find(n => id == n.attribute.id)?.destroy()
      }

      self.hook(notifications, (_, id) => onNotified(id), "notified")
      self.hook(notifications, (_, id) => onDismissed(id), "dismissed")
      self.hook(notifications, (_, id) => onDismissed(id), "closed")

    }
  })
}

function Notifications() {
  return Widget.Window({
    name: "notifications",
    anchor: ["top", "right"],
    className: "notification-window",
    margins: [ 6, 3, 6, 3 ],
    child: NotificationsList(),
  })
}

export default Notifications
