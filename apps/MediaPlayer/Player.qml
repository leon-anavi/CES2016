/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import QtMultimedia 5.0 as Media

Item {
    id: playerItem
    width: 900
    height: childrenRect.height

    property alias source: player.source
    property alias albumart: songsinfo.source
    property bool beginning: true

    signal send(string cmd)

    function play() {
        player.autoPlay = !beginning
        beginning = false
    }

    Media.MediaPlayer {
        id: player
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20

        SongInfo {
            id: songsinfo
            anchors.left: parent.left
            metadata: player.metaData
        }

        PositionSlider {
            width: parent.width
            value: player.position
            max: player.duration
        }

        PlayerControls {
            anchors.horizontalCenter: parent.horizontalCenter
            player: player
        }
    }
}
