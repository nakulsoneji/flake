const mpris = await Service.import("mpris")

mpris.connect("changed", m => {
  console.log(m.players)
})

export {}

