/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import utils 1.0

Row {
    property var metadata

    function unknown(v, alt) {
        return v ? v : alt
    }

    Image {
        source: "images/cover_album.png"
    }

    Column {
        spacing: 20

        Row {
            spacing: 20

            Rectangle {
                width: 80
                height: label.height * 0.7
                color: Style.blueViv
            }

            Text {
                id: label
                color: Style.blueLt
                font.pixelSize: 30
                text: "Now Playing"
            }
        }

        Text {
            color: "white"
            font.pixelSize: 35
            text: unknown(metadata.albumArtist, "Unknown artist")
        }

        Text {
            color: Style.blueViv
            font.pixelSize: 30
            text: unknown(metadata.albumTitle, "Unknown album")
        }

        Text {
            color: "white"
            font.pixelSize: 40
            text: unknown(metadata.title, "Unknown title")
        }
    }
}
