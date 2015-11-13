/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0

Item {
    width: 800
    height: 800
    x:0
    y:0
    id: root
    property variant child: null

    ContrastEffect {
        id: effect
        source: child
        anchors.fill: parent
        opacity: 1
    }

    function windowAdded(window) {
        print(compositor)
        child = compositor.item(window);
        child.parent = root
        child.width = root.width
        child.height = root.height
    }
    Component.onCompleted: {
        compositor.windowAdded.connect(windowAdded)
    }

    Rectangle {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 100
        height: 100
        z: 100
        Text {
            text: "HelloWayland"
        }

        MouseArea {
            property int currentPid: 0
            anchors.fill: parent
            onClicked: {
                print("CurrentPid: " + currentPid)
                if (currentPid == 0) {
                    currentPid = appLauncher.launchProcess("/mnt/usb/jlr/hello_wayland/hello_wayland", [])
                } else {
                    appLauncher.killProcess(currentPid)
                    currentPid = ""
                }
            }
        }
    }
}
