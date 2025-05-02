-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = require("keybindings.clientbindings"),
			buttons = require("keybindings.clientbuttons"),
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},

	-- Add titlebars to normal clients and dialogs
	{ rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = false } },

	-- Set Discord to always map on the tag named "2" on screen 2.
	{ rule = { class = "discord" }, properties = { screen = 2, tag = "2" } },

	-- Set Firefox to always map on the tag named "1" on screen 2.
	{ rule = { class = "firefox" }, properties = { screen = 2, tag = "1", maximized = false } },

	-- IntelliJ is always maximized for some reason
	{ rule = { class = "idea" }, properties = { maximized = false } },

	-- Nautilus is always maximized for some reason
	{ rule = { class = "org.gnome.Nautilus" }, properties = { maximized = false } },

	-- Libreoffice windows are always maximized for some reason
	{ rule = { class = "libreoffice" }, properties = { maximized = false } },

	-- Davinci Resolve needs a lot of rules...
	-- TODO: Make the second monitor window work
	{ rule = { class = "resolve", name = "Project Manager" }, properties = { placement = awful.placement.centered } },

	-- ETCNomad auto setup
	{ rule = { name = "Eos : 1" }, properties = { maximized = false, screen = 2, tag = "3" } },
	{ rule = { name = "Eos : 2" }, properties = { maximized = false, screen = 1, tag = "3" } },

	-- Yazi drag and drop window needs centering

	{ rule = { class = "Dragon", name = "dragon" }, properties = { placement = awful.placement.centered } },
}
-- }}}
