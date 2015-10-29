/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0

Item {
    id: root

    width: background.width
    height: background.height

    property string name
    property string icon

    signal clicked()

    Image {
        id: background
        source: "images/AppHex.png"
    }

    Column {
        y: 10
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: -10

        AppIcon {
            name: root.icon
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            text: root.name
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
