/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0
import utils 1.0
import "models"

Item {
    id: dialer

    Item {
        id: phoneKeypad
        width: 400
        height: childrenRect.height
        anchors.centerIn: parent

        Rectangle {
            id: inputBox
            color: "transparent"
            border.width: 1
            border.color: "white"
            height: 100
            width: parent.width

            Item {
                anchors.margins: 20
                anchors.fill: parent

                Text {
                    id: numberInput
                    anchors.fill: parent
                    font.pixelSize: 40
                    verticalAlignment: TextInput.AlignVCenter
                    text: ""
                    color: "white"
                }

                Rectangle {
                    color: "#6653b5ce"
                    height: parent.height/1.5
                    width: height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right

                    AwesomeIcon {
                        anchors.centerIn: parent
                        height: childrenRect.height
                        ucKey: "\uf00d"
                        iconSize: 30
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: numberInput.text = ""
                    }
                }
            }
        }

        NumberPad {
            width: parent.width
            anchors.topMargin: 20
            anchors.top: inputBox.bottom
            onNumber: numberInput.text += number
        }
    }

    Rectangle {
        width: 100
        height: 260
        anchors.right: phoneKeypad.left
        anchors.top: phoneKeypad.top
        anchors.rightMargin: 20
        anchors.topMargin: 120
        color: PhoneModel.callState === "" ? Style.greenViv : "red"

        Image {
            anchors.centerIn: parent
            source: "images/icon_" + (PhoneModel.callState === "" ? "call" : "endcall") + "_blue.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (PhoneModel.callState === "")
                    PhoneModel.dial(numberInput.text)
                else
                    PhoneModel.hangUp()
            }
        }
    }
}
