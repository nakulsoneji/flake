import Bar from "./widgets/Bar.js"
import Music from "./widgets/Music.js"
import launcher from "./widgets/Launcher.js"

App.config({
  style: "./style.css",
  windows: [
    Bar(),
    Music(), 
    launcher
  ]
})

export {}
