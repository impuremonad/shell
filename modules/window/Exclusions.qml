import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../config"

Scope {
    property int thickness: Appearance.window_thickness

    // Top Border Reservation (Full Width)
    PanelWindow {
        anchors {
            top: true
            left: true
            right: true
        }
        implicitHeight: thickness
        color: Appearance.bar_bg
    }
    // Right Border Reservation (Full Height)
    PanelWindow {
        anchors {
            right: true
            top: true
            bottom: true
        }
        implicitWidth: thickness
        color: Appearance.bar_bg
    }

    // Bottom Border Reservation (Full Width)
    PanelWindow {
        anchors {
            bottom: true
            left: true
            right: true
        }
        implicitHeight: thickness
        color: Appearance.bar_bg
    }
}
