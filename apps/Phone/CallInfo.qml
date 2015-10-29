/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0
import utils 1.0
import "models"

Item {
    width: 800
    height: 340

    Rectangle {
        y: -30
        width: parent.width
        height: 10
        color: Style.blueViv
    }

    Column {
        Row {
            spacing: 80

            Image {
                source: "images/contact_picture_blue.png"
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                font.capitalization: Font.AllUppercase
                font.pixelSize: 40
                font.family: "Source Sans Pro"
                text: PhoneModel.callState
            }
        }

        Item { height: 30; width: 1 }

        Text {
            color: "white"
            font.capitalization: Font.AllUppercase
            font.pixelSize: 40
            font.family: "Source Sans Pro"
            text: PhoneModel.callName
        }

        Text {
            color: Style.blueViv
            font.pixelSize: 40
            font.family: "Source Sans Pro"
            text: PhoneModel.callNumber
        }
    }

    Grid {
        anchors.right: parent.right
        columns: 2
        spacing: 10

        Repeater {
            model: ListModel {
                ListElement {
                    text: "SPEAKER"
                    icon: "speaker"
                }

                ListElement {
                    text: "MUTE"
                    icon: "mute"
                }

                ListElement {
                    text: "HOLD"
                    icon: "hold"
                }

                ListElement {
                    text: "ADD CALL"
                    icon: "addcall"
                }
            }

            Box {
                width: 150
                height: 130
                shadow: "in"
                color: Style.blueLt

                Column {
                    anchors.centerIn: parent

                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "images/icon_" + model.icon + "_blue.png"
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "white"
                        font.capitalization: Font.AllUppercase
                        font.pixelSize: 25
                        font.weight: Font.Bold
                        font.family: "Source Sans Pro"
                        text: model.text
                    }
                }
            }
        }
    }
}
