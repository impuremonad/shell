import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "components"
import "../../config"

PanelWindow {
    id: root

    anchors {
        top: true
        bottom: true
        left: true
    }
    WlrLayershell.layer: WlrLayer.Top
    implicitWidth: Appearance.bar_width
    implicitHeight: Screen.height

    color: Appearance.bar_bg

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: Appearance.bar_vpadding
        anchors.bottomMargin: Appearance.bar_vpadding
        spacing: Appearance.bar_spacing

        OsIcon {
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            Layout.fillHeight: true
        }

        Workspaces {
            Layout.alignment: Qt.AlignHCenter
        }

        Item {
            Layout.fillHeight: true
        }

        Clock {
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
