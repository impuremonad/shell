import Quickshell
import Quickshell.Wayland
import QtQuick
import "../../config"

Variants {
    model: Quickshell.screens

    delegate: PanelWindow {
        id: wallpaper
        property var modelData
        screen: modelData
        WlrLayershell.layer: WlrLayer.Background
        exclusionMode: ExclusionMode.Ignore
        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        Image {
            id: img
            anchors.fill: parent
            source: Qt.resolvedUrl(Appearance.wallpaper_root_dir + Appearance.wallpaper_name)
            fillMode: Image.PreserveAspectCrop
            smooth: true
            mipmap: true
        }
    }
}
