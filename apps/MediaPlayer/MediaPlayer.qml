/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import utils 1.0
import system 1.0

App {
    appId: "media_player"
    width: 1080

    Column {
        anchors.top: parent.top
        anchors.topMargin: 100
        width: parent.width
        spacing: 60

        Row {
            spacing: 30

            Rectangle {
                height: label.height
                width: 200
                color: Style.orangeViv
            }

            Text {
                id: label

                color: Style.orangeViv
                font.pixelSize: 20
                text: "MEDIA MANAGER"
            }
        }

        Rectangle {
            width: parent.width
            height: 2
            color: Style.blueViv
        }

        Player {
            anchors.horizontalCenter: parent.horizontalCenter
            source: "song.mp3"
        }
    }
}
