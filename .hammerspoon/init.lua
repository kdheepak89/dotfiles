hyper = {"ctrl", "alt", "cmd", "shift"}
ctrlaltcmd = {"ctrl", "alt", "cmd"}
cmdctrlshift = {"cmd", "ctrl", "shift"}

-------------------------------------------------------------------------------------

hs.grid.setGrid("12x12")
hs.grid.MARGINX = 10
hs.grid.MARGINY = 0
hs.window.animationDuration = 0 -- disable animations

-------------------------------------------------------------------------------------

-- Reload configuration
-- Download and install http://www.hammerspoon.org/Spoons/SpoonInstall.html
hs.loadSpoon("SpoonInstall")

-- http://www.hammerspoon.org/Spoons/ReloadConfiguration.html
spoon.SpoonInstall:andUse("ReloadConfiguration",
               {
                    config = { watch_paths = { os.getenv("HOME") .. "/GitRepos/dotfiles/.hammerspoon" } },
                    start = true,
               }
)
hs.hotkey.bind(hyper, "r", function()
    hs.reload()
end)

-------------------------------------------------------------------------------------


windows = hs.window.filter.new()

-- make mouse always in the center of focused window
windows:subscribe(hs.window.filter.windowFocused, function(window, appName)
    local f = window:frame()
    hs.mouse.setAbsolutePosition({x=(f.x + (f.w / 2)), y=(f.y + (f.h / 2))})
end)

-------------------------------------------------------------------------------------

hs.alert.show("Config loaded!")

