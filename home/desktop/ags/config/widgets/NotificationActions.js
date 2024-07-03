const n = await Service.import("notifications")
const WINDOW_NAME = "notificationActions"

function Actions(width = 200, height = 500, spacing = 8) {
  function createAction(actionItem, i) {
    return Widget.Box({
      attribute: {
        app: actionItem,
        id: i
      },
      spacing: spacing,
      canFocus: false,
      className: "picker-listing",
      css: `padding: ${spacing}px`,
      children: [
        Widget.Label({
          hpack: "center",
          truncate: "end",
          label: actionItem.label,
        }),
      ]
    })
  }

  function getNotification() {
    return n.popups.reverse().find(n => n.actions != undefined)
  }

  function createActionListing() {
    const actionsNotification = getNotification()
    if (actionsNotification == undefined) {
      return []
    }
    return actionsNotification.actions.map(createAction)
  }
  
  const actions = Variable(createActionListing())
  const notif = Variable(getNotification())
  const selection = Variable(0)

  const actionListing = Widget.Box({
    orientation: 1,
    spacing: spacing,
    canFocus: true,
    css: `min-width: ${width}px; min-height: 2px; background-color: #1e1e2e; border: 2px solid #89b4fa;`,
    children: actions.bind().as(action => {
      if (action.length > 0) {
        action[selection.getValue()].class_names = [ "picker-listing", "picker-listing-active" ]
      }
      return action
    })
  })
  .on("key-press-event", (_, event) => {
    const acts = actions.getValue()

    switch (event.get_keycode()[1]) {
      case 57:
      case 116:
        acts[selection.getValue()].class_name = "picker-listing"

        selection.setValue(selection.getValue() + 1)
        if (selection.getValue() >= acts.length) {
          selection.setValue(acts.length - 1)
        }
        acts[selection.getValue()].class_names = [ "picker-listing", "picker-listing-active" ]
        break
      case 33:
      case 111:
        acts[selection.getValue()].class_name = "picker-listing"
        selection.setValue(selection.getValue() - 1)
        if (selection.getValue() < 0) {
          selection.setValue(0)
        }
        acts[selection.getValue()].class_names = [ "picker-listing", "picker-listing-active" ]
        break
      case 36:
        const attribute = acts[selection.getValue()].attribute
        notif.getValue()?.invoke(attribute.app.id)
        break
    }
  })


  return Widget.Box({
    orientation: 1,
    spacing: spacing * 1.25,
    children: [
      actionListing
    ],
    setup: self => self.hook(App, (_, windowName, visible) => {
      if (windowName != WINDOW_NAME) {
        return
      }
      if (visible) {
        actionListing.grab_focus()
        actions.setValue(createActionListing())
        notif.setValue(getNotification())
      }
    })
  })
}

export const actionLauncher = Widget.Window({
  css: "background-color: transparent;",
  child: Actions(),
  setup: self => self.keybind("Escape", () => {
    App.toggleWindow(WINDOW_NAME)
  }),
  keymode: "exclusive",
  name: WINDOW_NAME, 
  visible: false 
}).hook(n, self => {
  if (n.popups.length < 1) {
    self.visible = false
  }
})

export default actionLauncher 

