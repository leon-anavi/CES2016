/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import system 1.0
import components 1.0
import utils 1.0


Item {
    anchors.fill: parent
    visible: System.activeSetting === name
    property bool showTechnologyToggle: false
    property alias technologyEnabled: techSwitch.value

    property string name: "unknown"
    property alias description: descriptionLabel.text

    Rectangle {
        id: rectangle1
        height: 260
        width: parent.width

        color: "#222"

        Row {
            x: 20
            y: 10
            spacing: 20

            Image {
                y: 20
                source: "images/back.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: System.activeSetting = "settings"
                }
            }

            Column {
                y: 4
                spacing: -10

                BoxHeading { text: "SETTINGS" }

                Text {
                    font.family: "Source Sans Pro"
                    font.pixelSize: 66
                    font.weight: Font.Bold
                    color: "white"
                    text: name
                    font.capitalization: Font.AllUppercase
                }
            }

        }

        Rectangle {
            id: settingDivider
            width: parent.width - x*2
            x: 40
            y: 140
            height: 2
            color: "#555"
        }

        HexSwitch {
            id: techSwitch
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.right: parent.right
            anchors.rightMargin: 15
            clip: false
            visible: showTechnologyToggle
        }

        Text {
            id: descriptionLabel
            x: 60
            y: 163
            font.family: "Source Sans Pro"
            font.pixelSize: 60
            color: Style.orangeViv
        }
    }
}
