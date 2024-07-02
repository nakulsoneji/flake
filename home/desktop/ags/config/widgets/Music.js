import { zeroPad } from '../utils/utils.js'

// TODO: when there is no data about the length of the song, don't print it, as it causes this error:
// GLib-GObject-CRITICAL **: 17:00:56.900: value "inf" of type 'gdouble' is invalid or out of range for property 'value' of type 'gdouble'


const mpris = await Service.import("mpris")
const players = mpris.bind("players")
export const revealMusic = Variable(false)

/** @param {import('types/service/mpris').MprisPlayer} player */
function Player(player) {
  const coverImg = Widget.Box({
    className: "music-img",
    vpack: "center",
    css: player.bind("track_cover_url").as(u => {
      return `background-image: url('${u}');`
    }),
  })

  const title = Widget.Label({
    hexpand: false,
    className: "music-title",
    useMarkup: true,
    hpack: "start",
    wrap: true,
    setup: self => {
      function update() {
        const { track_title, track_artists } = player;
        self.label = `<b>${track_title}</b>\n<i>${track_artists.join(",")}</i>`
      }
      self.hook(player, update)
    }
  })

  const progressBar = Widget.Slider({
    hexpand: true,
    drawValue: false,
    className: "music-progress",
    on_change: ({ value }) => player.position = player.length * value,
    setup: self => {
      function update() {
        const { position, length } = player;

        const lengthMins = zeroPad(Math.floor(length / 60), 2)
        const lengthSecs = zeroPad(Math.floor(length % 60), 2)
        const positionMins = zeroPad(Math.floor(position / 60), 2)
        const positionSecs = zeroPad(Math.floor(position % 60), 2)
  
        const positionFormat = `${positionMins}:${positionSecs}`
        const lengthFormat = `${lengthMins}:${lengthSecs}`
        
        self.value = position / length
        self.marks = [
          [0, `${positionFormat}`, "bottom"],
          [1, `${lengthFormat}`, "bottom"]
        ]
      }
      self
        .hook(player, update)
        .hook(player, update, "position")
        .poll(1000, update)
    } 
  })

  const backButton = Widget.Button({
    hpack: "center",
    onClicked: () => player.previous(),
    child: Widget.Icon({
      size: 40,
      icon: "media-skip-backward-symbolic",
    })
  })

  const playPauseButton = Widget.Button({
    hpack: "center",
    onClicked: () => player.playPause(),
    child: Widget.Icon({
      size: 40,
      setup: self => self.hook(player, self => {
        const status = player.play_back_status;
        let icon;
        switch (status) {
          case "Playing": 
            icon = "media-playback-pause-symbolic"
            break
          case "Paused":
            icon = "media-playback-start-symbolic"
            break
          default:
            icon = "media-playback-stop-symbolic"
        }

        self.icon = icon
      })
    })
  })

  const forwardButton = Widget.Button({
    hpack: "center",
    onClicked: () => player.next(),
    child: Widget.Icon({
      size: 40,
      icon: "media-skip-forward-symbolic",
    })
  })
 
  const buttons = Widget.CenterBox({
    hexpand: true,
    spacing: 10,
    width_request: 200,
    startWidget: backButton,
    centerWidget: playPauseButton,
    endWidget: forwardButton 
  })

  const volumeBar = Widget.Box({
    children: [
      Widget.Icon({
        setup: self => self.hook(player, () => {
          const volume = player.volume * 100
          const icon = [
            [101, 'overamplified'],
            [67, 'high'],
            [34, 'medium'],
            [1, 'low'],
            [0, 'muted'],
          ].find(([threshold]) => Number(threshold) <= volume)?.[1]

          self.icon = `audio-volume-${icon}-symbolic`
        }),
        css: "margin-right: 5px;",
        size: 17
      }),
      Widget.Slider({
        hexpand: true,
        drawValue: false,
        onChange: ({ value }) => player.volume = value,
        setup: self => self.hook(player, () => {
          self.value = player.volume
        })
      }),
    ]
  })

  return Widget.Box({
    orientation: 1,
    spacing: 10,
    className: "music-widget",
    children: [
      coverImg,
      title,
      progressBar,
      buttons,
      volumeBar
    ]
  })
}

function Media() {
  return Widget.Box({
    // for some reason adding this makes it appear, but thats not all
    // with this unset,if i toggle the visibility, it appears too???
    css: "min-height: 2px; min-width: 2px;",
    child: players.as(p => {
      const excludedPlayers = [ "firefox" ]

      function findPlayer(players) {
        const playerctld = players.find(p => p.name == "playerctld" && !excludedPlayers.some(playerName => playerName == p.entry) && p.entry != null && p.can_play != null)
        const otherPlayer = players.find(p => p.name != "playerctld" && !excludedPlayers.some(playerName => playerName == p.name))

        if (playerctld != undefined) {
          return playerctld
        }
        else if (otherPlayer != undefined) {
          return otherPlayer
        }
        else {
          return undefined
        }
      }

      const player = findPlayer(p)
      if (player == undefined) {
        revealMusic.setValue(false)
        return Widget.Label()
      }
      return Player(player)
    })
  })
}

function Music(monitor = 0) {
  return Widget.Window({
    name: `music-widget-${monitor}`,
    anchor: [ "top", "left" ],
    margins: [ 6, 3, 6, 3 ],
    monitor,
    visible: revealMusic.bind(),
    child: Media()
  })
}

export default Music
