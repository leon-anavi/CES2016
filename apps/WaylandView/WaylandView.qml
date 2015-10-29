/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import system 1.0
import components 1.0

App {
    appId: "wayland"

    property int currentPid: 0

    /* Helper to kill the current app before launching a new one */
    function launchApp(path, params) {
        params = params || [];
        if (currentPid != 0) {
            appLauncher.killProcess(currentPid)
        }

        currentPid = appLauncher.launchProcess(path, params)
    }

    Column {
        anchors.fill: parent

        Row {
            height: 100
            spacing: 25
            Button {
                buttonText: "MediaManager"

                MouseArea {
                    anchors.fill: parent
                    onClicked: launchApp("crosswalk",["http://google.com/"])
                }
            }
        }

        /* This is the item which shows the wayland surface. When a new wayland app is launched, it
         * is automatically drawn in this item */
        Item {
            id: waylandView
            // 1920 - TopBar (120) - BottomBar (120) - 100
            height: 1580
            width: parent.width
            Item {
                id: crossWalkSurface
                anchors.fill: parent
                property var child: null
    
                Component.onCompleted: {
                    compositor.windowAdded.connect(windowAdded)
                }
    
                function windowAdded(window) {
                    child = compositor.item(window);
                    child.parent = crossWalkSurface
                    child.anchors.fill = crossWalkSurface
                    child.surface.requestSize(Qt.size(crossWalkSurface.width, crossWalkSurface.height))
                }
            }
        }
    }
}
