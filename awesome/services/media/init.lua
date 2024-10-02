local playerctl = require("services.media.playerctl")


local media_service = {}

media_service.player = playerctl.new {
    players = { "qtws", "%any" },
    metadata = {
        title = "xesam:title",
        artist = "xesam:artist",
    },
}

return media_service
