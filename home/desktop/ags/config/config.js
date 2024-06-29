import Bar from "./widgets/Bar.js"
import Music from "./widgets/Music.js"

App.config({
  style: "./style.css",
  windows: [
    Bar(),
    Music() 
  ]
})

export {}
