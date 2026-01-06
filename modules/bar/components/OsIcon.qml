import QtQuick

Item {
    id: root

    implicitWidth: 40
    implicitHeight: 40

    Image {
        anchors.centerIn: parent

        source: "../../../assets/NixOS.svg"

        // Resize the svg source to ensure crisp rendering at target size
        sourceSize.width: 24
        sourceSize.height: 24

        // Keep the icon slightly smaller than the container for padding
        width: 24
        height: 24

        fillMode: Image.PreserveAspectFit
        smooth: true
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            console.log("OS Icon clicked");
            // Later we will hook this up to toggle the Launcher window
            // Example: LauncherWindow.visible = !LauncherWindow.visible
        }
    }
}
