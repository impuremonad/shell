import QtQuick
import Quickshell
import "../../../config"

Column {
    id: root

    property color color: Appearance.clock_color
    spacing: Appearance.clock_spacing

    Text {
        id: text

        anchors.horizontalCenter: parent.horizontalCenter

        horizontalAlignment: Text.AlignHCenter
        text: Qt.formatDateTime(new Date(), "hh\nmm")
        font: Appearance.bar_font
        color: root.color
    }

    Timer {
        interval: 10000
        repeat: true
        running: true
        onTriggered: text.text = Qt.formatDateTime(new Date(), "hh\nmm")
    }
}
