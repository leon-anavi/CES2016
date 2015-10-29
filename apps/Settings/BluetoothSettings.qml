/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import system 1.0
import components 1.0
import utils 1.0

SettingsView {
    id:bluetoothSettingsView
    name: "bluetooth"
    showTechnologyToggle: true

    onTechnologyEnabledChanged: {
        console.log("Bluetooth set to", technologyEnabled)
    }

    Component {
        id:blueToothDevice

        Rectangle {
            height: 150
            width: parent.width
            color: "#222"

            Column {
                Text {
                    text: deviceName
                    font.pointSize: 36
                    color: "#ffffff"
                }

                Text {
                    text: deviceAddress
                    font.pointSize: 18
                    color: "#ffffff"
                }
            }

            Button {
                anchors.top:parent.top
                anchors.right: parent.right
                anchors.rightMargin: 40

                buttonText:"Pair"

                MouseArea {

                    onClicked: {
                       console.log("Pair with", deviceAddress);
                    }
                }
            }
        }
    }

    ListView {
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 200
        anchors.bottom: parent.bottom
        model: BluetoothDummy {}
        delegate: blueToothDevice
        clip: true
    }
}

