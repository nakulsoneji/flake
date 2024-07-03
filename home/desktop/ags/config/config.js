import Bar from "./widgets/Bar.js"
import Music from "./widgets/Music.js"
import launcher from "./widgets/Launcher.js"
import Notifications from "./widgets/Notifications.js"
import actionLauncher from "./widgets/NotificationActions.js"

App.config({
  style: "./style.css",
  windows: [
    Bar(),
    Music(), 
    //launcher,
    //actionLauncher,
    //Notifications()
  ]
})

export {}
