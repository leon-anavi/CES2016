/* Copyright (C) 2015, Pioneer Corporation. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import utils 1.0

Item {
    id:listItem
    width: 800
    height:102

    property int itemHeight: (listItem.height - underline.height)/3
    property int itemWidth: listItem.width - jacket.width

    signal clicked()

    function unknown(v, alt) {
        return v ? v : alt
    }

    Image {
        id:jacket
        source: unknown(albumart, "images/cover_album.png");
        width: listItem.height
        height: listItem.height
        anchors.top: listItem.top
        anchors.left:listItem.left
    }

    Column {
        anchors.top: listItem.top
        anchors.left: jacket.right

        Text {
            anchors.left: parent.left
            anchors.leftMargin: 20
            height: itemHeight
            verticalAlignment: Text.AlignVCenter
            color: Style.white
            font.pixelSize: 25
            text: unknown(artist, "Unknown artist")
        }

        Text {
            anchors.left: parent.left
            anchors.leftMargin: 20
            height: itemHeight
            verticalAlignment: Text.AlignVCenter
            color: Style.blueViv
            font.pixelSize: 25
            text: unknown(album, "Unknown album")
        }

        Text {
            anchors.left: parent.left
            anchors.leftMargin: 20
            height: itemHeight
            verticalAlignment: Text.AlignVCenter
            color: Style.white
            font.pixelSize: 25
            text: unknown(title, "Unknown title")
        }

        Rectangle {
            id:underline
            width: itemWidth
            height: 3
            color: Style.blueViv
        }
    }

    SequentialAnimation {
        id:scaleAnimation

        NumberAnimation {
            target: listItem
            property: "scale"
            from: 1
            to: 0.95
            duration: 100
        }

        NumberAnimation {
            target: listItem
            property: "scale"
            from: 0.95
            to: 1
            duration: 100
        }
    }

    MouseArea{
        anchors.fill: listItem
        onClicked:{
            scaleAnimation.start()
            listItem.clicked()
        }
    }
}
