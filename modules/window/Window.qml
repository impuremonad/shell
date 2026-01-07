import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "../../config"

PanelWindow {
    id: root
    visible: !(Hyprland.focusedWorkspace?.hasFullscreen ?? false)
    property int borderThickness: Appearance.window_thickness

    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Bottom
    anchors {
        top: true
        right: true
        bottom: true
        left: true
    }

    margins {
        left: Appearance.bar_width - 10
    }
    color: "transparent"

    // INPUT MASK: Symmetric "hole" in the middle
    // Without this mouse won't work
    // Idk why keyboard does work, anyways...
    mask: Region {
        x: root.borderThickness
        y: root.borderThickness
        width: root.width - root.borderThickness
        height: root.height - root.borderThickness
        intersection: Intersection.Subtract
    }

    Rectangle {
        id: frameCanvas
        anchors.fill: parent
        color: Appearance.bar_bg
        layer.enabled: true
        layer.effect: MultiEffect {
            maskSource: maskShape
            maskEnabled: true
            maskInverted: true
            maskThresholdMin: 0.5
            maskSpreadAtMin: 1
        }
    }

    Item {
        id: maskShape
        anchors.fill: parent
        layer.enabled: true
        visible: false

        // VISUAL MASK: Uniform margins on all sides
        Rectangle {
            anchors.fill: parent
            anchors.margins: root.borderThickness
            radius: Appearance.window_radius
        }
    }
}
