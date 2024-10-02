local capi = Capi
local table = table
local awful = require("awful")
local beautiful = require("theme.theme")
local config = require("config")
local mebox = require("widget.mebox")
local menu_templates = require("ui.menu.templates")
local dpi = Dpi


local main_menu

local menu_items = {}

table.insert(menu_items, {
    text = "Terminal",
    icon = config.places.theme .. "/icons/console-line.svg",
    icon_color = beautiful.palette.gray,
    callback = function() awful.spawn(config.apps.terminal) end,
})
table.insert(menu_items, {
    text = "File Manager",
    icon = config.places.theme .. "/icons/folder.svg",
    icon_color = beautiful.palette.yellow,
    callback = function() awful.spawn(config.apps.file_manager) end,
})
table.insert(menu_items, {
    text = "Text Editor",
    icon = config.places.theme .. "/icons/file-document-edit.svg",
    icon_color = beautiful.palette.white,
    callback = function() awful.spawn(config.apps.editor) end,
})
table.insert(menu_items, {
    text = "Web Browser",
    icon = config.places.theme .. "/icons/web.svg",
    icon_color = beautiful.palette.blue,
    callback = function() awful.spawn(config.apps.browser) end,
})
table.insert(menu_items, {
    text = "Calculator",
    icon = config.places.theme .. "/icons/calculator.svg",
    icon_color = beautiful.palette.magenta,
    callback = function() awful.spawn(config.apps.calculator) end,
})
table.insert(menu_items, {
    text = "Music Player",
    icon = config.places.theme .. "/icons/music.svg",
    icon_color = beautiful.palette.green,
    callback = function() awful.spawn(config.apps.music_player) end,
})
table.insert(menu_items, {
    text = "Video Player",
    icon = config.places.theme .. "/icons/video.svg",
    icon_color = beautiful.palette.red,
    callback = function() awful.spawn(config.apps.video_player) end,
})
table.insert(menu_items, {
    text = "Applications",
    icon = config.places.theme .. "/icons/apps.svg",
    icon_color = beautiful.palette.orange,
    cache_submenu = false,
    submenu = menu_templates.applications.shared,
})

if config.features.wallpaper_menu then
    table.insert(menu_items, mebox.separator)
    table.insert(menu_items, {
        text = "Wallpaper",
        icon = config.places.theme .. "/icons/image-size-select-actual.svg",
        icon_color = beautiful.palette.green,
        submenu = menu_templates.wallpaper.shared,
    })
end

table.insert(menu_items, mebox.separator)
table.insert(menu_items, {
    text = "Shortcuts",
    icon = config.places.theme .. "/icons/apple-keyboard-command.svg",
    icon_color = beautiful.palette.blue,
    callback = function() capi.awesome.emit_signal("main_bindbox::show") end,
})
table.insert(menu_items, mebox.separator)
table.insert(menu_items, {
    text = "Exit",
    icon = config.places.theme .. "/icons/power.svg",
    icon_color = beautiful.palette.red,
    submenu = menu_templates.power.shared,
})

main_menu = mebox {
    item_width = dpi(192),
    items_source = menu_items,
}

return main_menu
