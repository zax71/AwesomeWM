-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")

local mediabuttons = gears.table.join(
	-- Volume controls
	awful.key({}, "XF86AudioRaiseVolume", function()
		volume_widget.inc(5)
	end),
	awful.key({}, "XF86AudioLowerVolume", function()
		volume_widget.dec(5)
	end),
	awful.key({}, "XF86AudioMute", function()
		volume_widget.toggle()
	end),

	-- Media controls
	awful.key({}, "XF86AudioPlay", function()
		awful.util.spawn("playerctl play")
	end),
	awful.key({}, "XF86AudioPause", function()
		awful.util.spawn("playerctl pause")
	end),
	awful.key({}, "XF86AudioNext", function()
		awful.util.spawn("playerctl next")
	end),
	awful.key({}, "XF86AudioPrev", function()
		awful.util.spawn("playerctl previous")
	end)
)

return mediabuttons
