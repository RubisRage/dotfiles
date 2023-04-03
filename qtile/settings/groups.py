from libqtile.config import Key, Group, Match
from libqtile.command import lazy
from .keys import mod, keys

# " ", " ", " ", " ", " ", " ", " ", " ", " ", , 
# [" ", None, "thunar"],


def create_groups():
    #   Icon | Match | Application | Layout
    workspace_config = [
            ["󰋜 ", [], None, 'max'],
            [" ", ['firefox'], None, 'max'],
            [" ", [], "alacritty", 'max'],
            [" ", ['Mail'], None, 'max'],
            [" ", ['kuro'], "/opt/kuro/Kuro.AppImage", 'max'],
            [
                " ",
                ['whatsapp-nativefier-d40211', 'telegram-desktop'],
                ["whatsapp-nativefier", 'telegram-desktop'],
                'monadtall'
            ],
            ["󰙯 ", [], "discord", 'max'],
            [" ", ['qtws'], "gtk-launch youtube-music-desktop", 'max'],
            [" ", [], "virtualbox", 'max'],
    ]

    groups = []

    for icon, matches, app, layout in workspace_config:

        group_matches = []

        for match in matches:
            group_matches.append(Match(wm_class=match))

        if len(group_matches) == 0:
            group_matches = None

        groups.append(Group(
            icon,
            matches=group_matches,
            spawn=app,
            layout=layout
        ))

    return groups


groups = create_groups()

for i, group in enumerate(groups):
    actual_key = str(i)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])
