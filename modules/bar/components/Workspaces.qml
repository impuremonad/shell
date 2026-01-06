import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "../../../config"

ColumnLayout {
    id: root
    spacing: Appearance.workspaces_spacing

    property var wsIdsToShow: {
        // This logic is unnecessary for rendering labels but
        // I originally intended to render the ws numbers so I'll leave it here,
        // it doesn't affect the labels rendering
        let ids = [1, 2, 3, 4, 5];
        for (const ws of Hyprland.workspaces.values) {
            if (ws.id > 5 && (ws.toplevels.values.length > 0 || ws.id === focusedWorkspaceId)) {
                if (!ids.includes(ws.id)) {
                    ids.push(ws.id);
                }
            }
        }
        return ids;
    }

    property int focusedWorkspaceId: Hyprland.workspaces.values.find(ws => ws.focused).id

    Repeater {
        model: wsIdsToShow

        Rectangle {
            property int wsId: wsIdsToShow[index]
            property var ws: Hyprland.workspaces.values.find(w => w.id === wsId)
            property bool isEmpty: !ws || ws.toplevels.values.length === 0
            property bool isFocused: focusedWorkspaceId === wsId

            color: Appearance.bar_bg
            implicitWidth: 25
            implicitHeight: 25
            Text {
                color: isFocused ? Appearance.bar_fg : Appearance.bar_muted
                anchors.centerIn: parent
                text: isEmpty ? (isFocused ? Appearance.occupied_workspace_label : Appearance.empty_workspace_label) : Appearance.occupied_workspace_label
            }
        }
    }
}
