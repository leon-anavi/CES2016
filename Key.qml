/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import QtGraphicalEffects 1.0
import utils 1.0

Item {
    id: root

    width: 90
    height: 130

    property color color: Style.orangeViv
    property alias text: textItem.text
    property alias symbol: symbolItem.text
    property real fade: 0.16
    property string icon: ""

    signal clicked()

    Rectangle {
        id: keyRect
        anchors.fill: parent
        radius: 10
    }

    LinearGradient {
        anchors.fill: parent
        source: keyRect
        start: Qt.point(0, 0)
        end: Qt.point(0, 130)
        gradient: Gradient {
            GradientStop { position: 0.0; color: root.color }
            GradientStop { position: root.fade; color: Qt.darker(root.color, 2.0) }
            GradientStop { position: 0.8; color: "black" }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        radius: 10
        border.width: 4
        border.color: Style.orangeLt

        Text {
            id: symbolItem
            visible: icon === ""
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 15
            anchors.rightMargin: 20
            font.pixelSize: 28
            font.family: "Source Sans Pro"
            color: "white"
        }

        Text {
            id: textItem
            visible: icon === ""
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            font.pixelSize: 60
            font.family: "Source Sans Pro"
            color: "white"
        }

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            source: icon === "" ? icon : "images/" + icon + ".png"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
