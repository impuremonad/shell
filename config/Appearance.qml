pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    property string font_family: "JetbrainsMono Nerd Font"

    // Wallpaper
    property string wallpaper_root_dir: "/home/impuremonad/Pictures/Wallpapers/"
    property string wallpaper_name: "tartarus.png"

    // Bar
    property string bar_bg: "#282828"
    property string bar_fg: "#fbf1c7"
    property string bar_muted: "#665c54"
    property font bar_font: ({
            family: root.font_family,
            pixelSize: 18,
            bold: true
        })
    property int bar_vpadding: 10
    property int bar_spacing: 10
    property int bar_width: 46

    // Workspaces
    property string active_workspace_bg: "#fe8019"
    property int workspaces_radius: 15
    property string inactive_workspace_bg: "#504945"
    property string workspaces_bg: "#3c3836"
    property int workspace_width: 10
    property int workspaces_spacing: 5
    property string empty_workspace_label: " "
    property string occupied_workspace_label: "󰮯"

    // Clock
    property int clock_spacing: 2
    property string clock_color: "#ebdbb2"
}
