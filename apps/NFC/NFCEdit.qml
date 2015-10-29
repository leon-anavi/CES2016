/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0
import system 1.0
import utils 1.0
import "models"

Item {
    width: childrenRect.width
    height: childrenRect.height

    Column {
        spacing: 50

        Box {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 800
            height: 80
            color: Style.yellowLt
            shadow: "in"

            Text {
                x: 20
                width: parent.width - 40
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 30
                elide: Text.ElideLeft
                color: "white"
                text: keyboard.currentString
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 30
            font.capitalization: Font.AllUppercase
            color: "white"
            text: "Edit data and press write data button."
        }

        BoxButton {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 150
            color: Style.greenLt
            shadow: "in"
            text: "WRITE\nDATA"
            onClicked: NFCModel.value = keyboard.currentString
        }
    }

    onVisibleChanged: {
        System.showKeyboard = visible
        keyboard.currentString = NFCModel.value
    }
}
