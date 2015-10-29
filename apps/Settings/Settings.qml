/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0
import system 1.0
import utils 1.0

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        opacity: 0.8
        color: "black"
    }

    MouseArea {
        anchors.fill: parent
    }

    Column {
        x: 41
        y: 18
        spacing: -2

        BoxHeading {
            x: 7
            text: "APPS"
        }

        Text {
            font.family: "Source Sans Pro"
            font.pixelSize: 60
            font.weight: Font.Bold
            color: "white"
            text: "SETTINGS"
        }
    }

    ListModel {
        id: settingsModel

        ListElement { name: "Volume Settings"; view: "volume" }
        ListElement { name: "Bluetooth Settings"; view: "bluetooth" }
        ListElement { name: "WIFI Settings"; view: "wifi" }
        ListElement { name: "RVI Settings"; view: "rvi" }
        ListElement { name: "Hotspot Settings"; view: "hotspot" }
    }

    Component {
        id: settingsDelegate

        Item {
            x: 20
            width: 960
            height: 131

            Text {
                anchors.verticalCenter: parent.verticalCenter
                font.family: "Source Sans Pro"
                font.pixelSize: 40
                font.capitalization: Font.AllUppercase
                color: Style.orangeViv
                text: model.name
            }

            Rectangle {
                anchors.top: parent.top
                height: 2
                width: parent.width
                color: "#555"
                visible: model.index > 0
            }

            MouseArea {
                anchors.fill: parent
                onClicked: System.activeSetting = model.view
            }
        }
    }

    Item {
        y: 170
        x: 40
        width: 1000
        height: parent.height - 170

        Rectangle {
            width: parent.width
            height: childrenRect.height
            color: "#222"
            visible: System.activeSetting === "settings"

            ListView {
                height: childrenRect.height
                width: childrenRect.width
                model: settingsModel
                delegate: settingsDelegate
           }
        }

        VolumeSettings { id: volume }
        BluetoothSettings { id: bluetooth }
        WifiSettings { id: wifi }
        RVISettings { id: rvi }
        HotspotSettings { id: hotspot }
    }

    Image {
        y: 48
        anchors.right: parent.right
        anchors.rightMargin: 55

        source: "../../images/bt_close.png"

        MouseArea {
            anchors.fill: parent
            onClicked: System.showSettings = false
        }
    }
}
