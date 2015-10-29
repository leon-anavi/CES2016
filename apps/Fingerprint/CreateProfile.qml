/* This Source Code Form is subject to the terms of the Mozilla Public
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
    signal createProfile()

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

    BoxButton {
        y: 210
        width: 550
        height: 100
        anchors.horizontalCenter: parent.horizontalCenter
        shadow: "in"
        color: Style.yellowLt
        text: "Select an Avatar for your Profile"
    }

    Row {
        y: 390
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 250

        Image {
            source: "images/Female-Avatar.png"

            MouseArea {
                anchors.fill: parent
                onClicked: FingerprintModel.avatar = "female"
            }
        }

        Image {
            source: "images/Male-Avatar.png"

            MouseArea {
                anchors.fill: parent
                onClicked: FingerprintModel.avatar = "male"
            }
        }
    }

    BoxButton {
        y: 780
        width: 370
        height: 70
        anchors.right: parent.right
        anchors.rightMargin: 20
        shadow: "fill"
        color: Style.yellowLt
        text: "Create Profile"
        onClicked: createProfile()
    }
}
