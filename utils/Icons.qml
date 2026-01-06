pragma Singleton

import QtQuick
import Quickshell

QtObject {
    id: root

    // Mapping of XDG Categories to Material Symbol names
    readonly property var categoryIcons: ({
            "WebBrowser": "web",
            "TerminalEmulator": "terminal",
            "FileManager": "folder_open",
            "TextEditor": "edit_note",
            "Audio": "music_note",
            "Video": "movie",
            "Game": "sports_esports",
            "Settings": "settings",
            "System": "dns",
            "Utility": "build",
            "Development": "code",
            "Graphics": "palette",
            "Office": "description",
            "Network": "wifi"
        })

    function getIcon(appClass, fallback) {
        if (!appClass)
            return fallback;

        // Use Quickshell's native heuristic lookup
        // This tries to match the window class (e.g. "firefox") to a .desktop file
        const entry = DesktopEntries.heuristicLookup(appClass);

        if (entry && entry.categories) {
            // Check if any of the app's categories match our list
            for (const cat of entry.categories) {
                if (root.categoryIcons[cat]) {
                    return root.categoryIcons[cat];
                }
            }
        }

        // Fallback for apps without categories (or if lookup fails)
        if (appClass.toLowerCase().includes("terminal"))
            return "terminal";

        return fallback;
    }
}
