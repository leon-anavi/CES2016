/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import QtMultimedia 5.0 as Media

Row {
    property var player
    spacing: 100

    MediaButton {
        anchors.verticalCenter: parent.verticalCenter
        icon: "previous"
        adjust: -6
        onClicked: active = !active
    }

    MediaButton {
        anchors.verticalCenter: parent.verticalCenter
        icon: "frewind"
        adjust: -4
        onClicked: active = !active
    }

    MediaButton {
        anchors.verticalCenter: parent.verticalCenter
        icon: "play-pause"
        active: player.playbackState == Media.MediaPlayer.PlayingState
        adjust: -4
        onClicked: active ? player.pause() : player.play()
    }

    MediaButton {
        anchors.verticalCenter: parent.verticalCenter
        icon: "fforward"
        adjust: -6
        onClicked: active = !active
    }

    MediaButton {
        anchors.verticalCenter: parent.verticalCenter
        icon: "next"
        adjust: -6
        onClicked: active = !active
    }

    MediaButton {
        anchors.verticalCenter: parent.verticalCenter
        icon: "shuffle"
        adjust: -8
        onClicked: active = !active
    }

    MediaButton {
        anchors.verticalCenter: parent.verticalCenter
        icon: "repeat"
        adjust: -2
        onClicked: active = !active
    }
}
