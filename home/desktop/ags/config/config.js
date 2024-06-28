const network = await Service.import("network")
const hyprland = await Service.import("hyprland")
const battery = await Service.import('battery')
const systemtray = await Service.import('systemtray')
const audio = await Service.import('audio')

function Audio() {
  const volumeSlider = Widget.Revealer({
    revealChild: false,
    widthRequest: 0,
    transitionDuration: 1000,
    transition: 'slide_left',
    css: "margin-left: 50px",
    child: Widget.Slider({
      min: 0,
      max: 1,
      widthRequest: 100,
      drawValue: false,
      onChange: ({ value }) => audio.speaker.volume = value,
      className: "volume-slider",
    }),
  })

  const volumeInfo = Widget.Button({
    on_clicked: () => Utils.execAsync(["pavucontrol"]),
    on_secondary_click: () => audio.speaker.is_muted = !audio.speaker.is_muted,
    child: Widget.Box({
      spacing: 4,
      children: [
        Widget.Icon().hook(audio.speaker, self => {
          const vol = audio.speaker.volume * 100;
          let muted_icon;
          let volume_icon;

          if (audio.speaker.icon_name == "audio-headphones-bluetooth") {
            muted_icon = "audio-volume-muted-symbolic"
            volume_icon = "audio-headphones-symbolic"
          } 
          else {
            const icon = [
              [101, 'overamplified'],
              [67, 'high'],
              [34, 'medium'],
              [1, 'low'],
              [0, 'muted'],
            ].find(([threshold]) => Number(threshold) <= vol)?.[1];

            muted_icon = "audio-volume-muted-symbolic";
            volume_icon = `audio-volume-${icon}-symbolic`;
          }

          if (audio.speaker.is_muted) {
            self.icon = muted_icon;
          } 
          else {
            self.icon = volume_icon;
          }
        }),
        Widget.Label({
          label: audio.speaker.bind("volume").as(v => `${Math.floor(v * 100)}%`),
        }),
      ],
    }),
    css: "padding: 0px 3px 0px 3px;",
    setup: self => self.hook(audio.speaker, self => {
      if (audio.speaker.is_muted) {
        self.class_name = "audio-muted";
      } 
      else {
        self.class_name = "audio"
      }
    })
  })

  return Widget.Box({
    children: [
      volumeInfo,
    ],
    tooltip_text: audio.bind("speaker").as(s => `${s.description}`)
  }) 
}

function TrayItem(item) {
  return Widget.Button({
    child: Widget.Icon({
      icon: item.bind("icon").as(i => {
        if (typeof i == "string") {
          return `${i}-symbolic`
        } else {
          return i
        }
      })
    }),
    tooltipMarkup: item.bind('tooltip_markup'),
    onPrimaryClick: (_, event) => item.activate(event),
    onSecondaryClick: (_, event) => item.openMenu(event),
    className: "tray-item"
  });
}

function Tray() {
  return Widget.Box({
    children: systemtray.bind('items').as(i => i.map(TrayItem)),
  })
}

function Battery() {
  const batteryIcon = Widget.Icon({
    icon: battery.bind("icon_name")
  })
  const batteryLabel = Widget.Label({
    label: battery.bind("percent").as(p => `${p}%`),
    css: "padding-left: 3px;"
  })

  return Widget.Box({
    children: [
      batteryIcon,
      batteryLabel
    ],
    class_name: battery.bind('charging').as(ch => ch ? "battery-charging" : ""),
    setup: self => self.hook(battery, () => {
      const hoursLeft = Math.floor((battery.time_remaining / (60 * 60)) * 10) / 10
      self.tooltip_text = `${hoursLeft} h`
    }, "changed")
  }) 
}

function DateTime() {
  const date = Variable('', {
    poll: [1000, "date"],
  })

  return Widget.Label({
    label: date.bind().as(d => {
      const dateArray = d.split(" ")
      const timeArray = dateArray[3].split(":")
      const dateFormatted = `${dateArray[0]}, ${dateArray[1]} ${dateArray[2]}`
      const timeFormatted = `${timeArray[0]}:${timeArray[1]}`
      const dateTime = dateFormatted + " " + timeFormatted

      return dateTime
    })
  })
}

function Workspaces() {
function dispatchWorkspace(workspace) {
    hyprland.messageAsync(`hyprctl dispatch ${workspace}`)
  }

  return Widget.Box({
    children: Array.from({ length: 7 }, (_, i) => i + 1).map((i) => Widget.Button({
      onClicked: () => dispatchWorkspace(i),
      attribute: i,
      className: "workspace-button",
    })),
    setup: self => self 
      .hook(hyprland.active.workspace, () => self.children.forEach(btn => {
        if (hyprland.active.workspace.id == btn.attribute) {
          btn.label = ""
          btn.class_names = [
            "workspace-active-button",
            "workspace-button"
          ];
        } else if (btn.label != "") {
          btn.class_name = "workspace-button"
          btn.label = "󰧞"
        }
      }))
      .hook(hyprland, () => {
        const greatestId = hyprland.workspaces[hyprland.workspaces.length - 1].id
        self.children.forEach(btn => {
          btn.visible = greatestId > btn.attribute || hyprland.workspaces.some(ws => ws.id === btn.attribute);
        })
      })
      .hook(hyprland, (_, address) => {
        const urgentWindow = hyprland.clients.find(c => c.address == address)
        if (urgentWindow === undefined) {
          return
        }
        const urgentWorkspaceId = urgentWindow.workspace.id
        self.children.forEach(btn => { 
          if (urgentWorkspaceId == btn.attribute) {
            btn.label = ""
            btn.class_names = [
              "workspace-urgent-button",
              "workspace-button"
            ]
          }
        })
      }, "urgent-window"),
      className: "workspaces"
  })
}

function Network() {
  const networkIcon = Widget.Icon({
    icon: network.wifi.bind("icon_name"),
  })

  const networkLabel = Widget.Label().hook(network.wifi, label => {
    label.label = `${network.wifi.ssid} (${network.wifi.strength}%)` 
  })

  return Widget.Box({
    className: "network",
    spacing: 5,
    children: [
      networkIcon,
      networkLabel
    ],
    setup: self => self.hook(network.wifi, () => Utils.execAsync(["hostname", "-I"]) 
      .then(ip => self.tooltip_text = `${ip}`)
      .catch(err => print(err))  
    )
  })
}

function Left() {
  return Widget.Box({
    spacing: 5,
    className: "widgets-left",
    children: [
      Workspaces()
    ],
  })
}

function Center() {
  return Widget.Box({
    spacing: 5,
    className: "widgets-center",
    children: [
      DateTime()
    ]
  })
}

function Right() {
  return Widget.Box({
    spacing: 5,
    className: "widgets-right",
    hpack: "end",
    children: [
      Tray(),
      Audio(),
      Network(),
      Battery(),
    ]
  })
}

function Bar(monitor = 0) {
  return Widget.Window({
    name: "bar-${monitor}",
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    className: "bar-window",
    monitor,
    child: Widget.CenterBox({
      className: "bar",
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    })
  })
}

App.config({
  style: "./style.css",
  windows: [
    Bar()
  ]
})

export {}
