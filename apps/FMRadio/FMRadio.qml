/* Copyright (C) 2015, Jaguar Land Rover, IoT.bzh. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import system 1.0
import utils 1.0
import radio 1.0

App {
    appId: "fmradio"
    id: radioApp

    property bool radioIsOn: false

    // -------------

    Item {
        anchors.centerIn: parent
        width: 250
        height: 200


        // Frequency
        Column {
            spacing: 10

            // Frequency title ("Frequency")
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 38
                color: "white"
                text: "Frequency"
            }

            // Frequency content ("100.0 Mhz")
            Text {
                id: frequency
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 48
                color: "white"
                text: radio.freq.toLocaleString(Qt.locale("en_US"), "f", 2) + " Mhz"
            }

            // Frequency switch ("+/-")
            Row {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    id: frequency_minus
                    font.pixelSize: 38
                    color: "white"
                    text: "\uf068"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: radio.freq -= 0.1
                    }
                }
                Text {
                    id: frequency_plus
                    font.pixelSize: 38
                    color: "white"
                    text: "\uf067"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: radio.freq += 0.1
                    }
                }
            }
        }


        // On/Off switch
        Text {
            anchors.bottom: parent.top
            anchors.left: parent.right
            anchors.leftMargin: 100
            font.pixelSize: 40
            color: "white"
            text: "On/Off"

            Image {
                id: power
                anchors.top: parent.bottom
                anchors.margins: 10
                width: 150
                height: 50
                source: radioApp.radioIsOn ? "../../images/switchplate_on.png" : "../../images/switchplate_off.png"

                MouseArea {
                    anchors.fill: parent
                    onClicked: radioApp.radioIsOn ? radio.stop() : radio.play()
                }
            }
        }


        // Mode ("AM/FM")
        Text {
            anchors.bottom: parent.top
            anchors.right: parent.left
            anchors.rightMargin: 100
            font.pixelSize: 38
            color: "white"
            text: "Mode"

            Text {
                id: mode
                anchors.top: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 10
                font.pixelSize: 40
                color: "white"
                text: radio.mode ? "AM" : "FM"
                MouseArea {
                    anchors.fill: parent
                    onClicked: radio.mode ? radio.mode = Radio.FM : radio.mode = Radio.AM
                }
            }
        }


        // Mute ("(Playing)/(Mute)")
        Text {
            id: mute
            anchors.top: parent.bottom
            anchors.right: parent.left
            anchors.rightMargin: 100
            font.pixelSize: 38
            color: radio.mute ? "red" : Style.greenViv
            text: !radioApp.radioIsOn ? "" : (radio.mute ? "(Muted)" : "(Playing)")
            MouseArea {
                anchors.fill: parent
                onClicked: radio.mute = !radio.mute
            }
        }


	// Presets
        Column {
            anchors.top: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            // Presets title ("Presets")
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 40
                color: "white"
                text: "Presets"
            }

            // Presets images ("Preset 1", "Preset 2"...)
            Row {
                spacing: 10

                Image {
                    width: 65
                    height: width
                    source: "images/preset_1.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: radio.freq = 90.8
                    }
                }
                Image {
                    width: 65
                    height: width
                    source: "images/preset_2.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: radio.freq = 95.6
                    }
                }
                Image {
                    width: 65
                    height: width
                    source: "images/preset_3.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: radio.freq = 101.3
                    }
                }
            }
        }

    }

    // -------------

    Radio {
        id: radio
        onPlaying: radioApp.radioIsOn = true;
        onStopped: radioApp.radioIsOn = false;
    }

}
