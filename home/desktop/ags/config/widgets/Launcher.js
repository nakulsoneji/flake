const { query } = await Service.import("applications")
const WINDOW_NAME = "launcher"

function Apps(width = 300, height = 500, spacing = 8) {
  function createApp(appItem, i) {
    return Widget.Box({
      attribute: {
        app: appItem,
        id: i
      },
      spacing: spacing,
      canFocus: false,
      className: "picker-listing",
      css: `padding: ${spacing}px`,
      children: [
        Widget.Icon({
          icon: appItem.icon_name || "",
          size: 32,
        }),
        Widget.Label({
          hpack: "start",
          truncate: "end",
          label: appItem.name,
          visible: true
        }),
      ]
    })
  }

  function createAppListing(appName) {
    return query(appName).map(createApp)
  }

  const applications = Variable(createAppListing(""))
  const selection = Variable(0)

  const appListing = Widget.Box({
    orientation: 1,
    spacing: spacing,
    canFocus: false,
    children: applications.bind().as(apps => {
      apps[selection.getValue()].class_names = [ "picker-listing", "picker-listing-active" ]
      return apps
    })
  })

  const search = Widget.Entry({
    visibility: true,
    className: "picker-list-search",
    onChange: ({ text }) => {
      const apps = applications.getValue()
      apps.forEach(a => {
        a.visible = a.attribute.app.match(text)
        a.class_name = "picker-listing"
      })

      const visible = apps.filter(a => a.visible)
      if (visible.length < 1) {
        return
      }
      if (selection.getValue() >= visible.length) {
        selection.setValue(visible.length - 1)
      }
      apps[visible[selection.getValue()].attribute.id].class_names = [ "picker-listing", "picker-listing-active" ]
    },
    onAccept: async () => {
      const apps = applications.getValue()
      const visible = apps.filter(a => a.visible)
      const result = apps[visible[selection.getValue()].attribute.id].attribute.app

      App.toggleWindow(WINDOW_NAME)
      result.launch()
    }
  })

  .on("key-press-event", (_, event) => {
  /*
  * ctrl+n: 57
  * ctrl+p: 33
  * up: 116
  * down: 111
  *
  * ctrl+u: 30
  * ctrl+d: 40
  */
    const apps = applications.getValue()
    const visible = apps.filter(a => a.visible)

    switch (event.get_keycode()[1]) {
      case 57:
      case 116:
        apps[visible[selection.getValue()].attribute.id].class_name = "picker-listing"

        selection.setValue(selection.getValue() + 1)
        if (selection.getValue() >= visible.length) {
          selection.setValue(visible.length - 1)
        }
        apps[visible[selection.getValue()].attribute.id].class_names = [ "picker-listing", "picker-listing-active" ]
        break
      case 33:
      case 111:
        apps[visible[selection.getValue()].attribute.id].class_name = "picker-listing"
        selection.setValue(selection.getValue() - 1)
        if (selection.getValue() < 0) {
          selection.setValue(0)
        }
        apps[visible[selection.getValue()].attribute.id].class_names = [ "picker-listing", "picker-listing-active" ]
        break
      case 30:
        if (scrollableApps.vadjustment.value <= scrollableApps.vadjustment.get_lower()) {
          scrollableApps.vadjustment.value = scrollableApps.vadjustment.get_lower()
        }
        else {
          scrollableApps.vadjustment.value -= 100
        }
        break
      case 40:
        if (scrollableApps.vadjustment.value >= scrollableApps.vadjustment.get_upper()) {
          scrollableApps.vadjustment.value = scrollableApps.vadjustment.get_upper()
        }
        else {
          scrollableApps.vadjustment.value += 100
        }
        break

    }
  })

  const scrollableApps = Widget.Scrollable({
    className: "picker-list-scroll",
    canFocus: false,
    hscroll: "never",
    css: `min-width: ${width}px; min-height: ${height}px; padding: ${spacing}px`,
    child: appListing
  })

  return Widget.Box({
    orientation: 1,
    spacing: spacing * 1.25,
    children: [
      search,
      scrollableApps
    ],
    setup: self => self.hook(App, (_, windowName, visible) => {
      if (windowName != WINDOW_NAME) {
        return
      }

      if (visible) {
        search.text = ""
        search.grab_focus()
        applications.setValue(createAppListing(""))
      }
    })
  })
}

export const launcher = Widget.Window({
  css: "background-color: transparent;",
  child: Apps(),
  setup: self => self.keybind("Escape", () => {
    App.closeWindow(WINDOW_NAME)
  }),
  keymode: "exclusive",
  name: WINDOW_NAME, 
  visible: false 
})

export default launcher 
