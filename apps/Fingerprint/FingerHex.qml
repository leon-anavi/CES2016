/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0

Item {
    id: root

    width: childrenRect.width
    height: childrenRect.height

    property alias name: text.text
    property bool filled

    signal clicked()

    Column {
        Image {
            source: "images/print-record-" + (filled ? "filled" : "empty") + ".png"

            MouseArea {
                anchors.fill: parent
                onClicked: root.clicked()
            }
        }

        Text {
            id: text
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 30
            color: "white"
        }   
    }
}
