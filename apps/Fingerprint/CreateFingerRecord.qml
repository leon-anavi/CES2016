/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0
import system 1.0
import utils 1.0
import "models"

Item {
    anchors.fill: parent
    signal menu()

    BoxButton {
        y: 80
        width: 120
        height: 70
        anchors.right: parent.right
        anchors.rightMargin: 20
        shadow: "in"
        color: Style.blueViv
        text: "Menu"
        onClicked: menu()
    }

    Column {
        x: 40
        y: 130
        spacing: -30

        Image {
            source: "images/" + (FingerprintModel.avatar === "male" ? "Male" : "Female") + "-Avatar.png"
        }

        Text {
            font.pixelSize: 26
            color: "white"
            text: "Name and Stuff"
        }
    }

    BoxButton {
        x: 310
        y: 210
        width: 550
        height: 100
        shadow: "in"
        color: Style.yellowLt
        text: "Select the Record You Wish to Create"
    }

    FingerRow {
        y: 450
        anchors.horizontalCenter: parent.horizontalCenter
        hand: "left"
    }

    BoxHeading {
        LayoutMirroring.enabled: true

        y: 850
        anchors.left: parent.left
        boxHeight: 25
        boxWidth: 800
        fontSize: 40
        color: Style.orangeViv
        text: "LEFT HAND"
    }

    FingerRow {
        y: 1100
        anchors.horizontalCenter: parent.horizontalCenter
        hand: "right"
    }

    BoxHeading {
        y: 1500
        anchors.left: parent.left
        boxHeight: 25
        boxWidth: 800
        fontSize: 40
        color: Style.orangeViv
        text: "RIGHT HAND"
    }
}
