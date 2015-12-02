/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
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

    property bool radioIsOn: false

    function refreshFrequency() {
        frequency.text = radio.freq.toLocaleString(Qt.locale("en_US"), "f", 2) + " Mhz";
    }

    function refreshMode() {
        mode.text = radio.mode;
    }

    function refreshMute() {
        if (radioIsOn === true) {
            if (radio.mute) {
                mute.text = "(Muted)";
                mute.color = "red";
            } else {
                mute.text = "(Playing)";
                mute.color = Style.greenViv;
            }
        } else {
            mute.text = "";
        }
    }

    // -------------

    Text {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 20
        font.pixelSize: 40
        color: "white"
        text: "On/Off"

        Image {
            id: power
            anchors.top: parent.bottom
            anchors.margins: 10
            width: 150
            height: 50
            source: "../../images/switchplate_off.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (!radioIsOn) { radioIsOn = true; radio.play(); }
                               else { radioIsOn = false; radio.stop(); }
                }
            }
        }
    }

    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: 20
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
            text: "FM"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (radio.mode === "FM") radio.mode = "AM";
                                        else radio.mode = "FM"
                    refreshMode();
                }
            }
        }
    }

    Text {
        id: mute
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 20
        font.pixelSize: 38
        color: "red"
        text: ""
        Component.onCompleted: refreshMute();

        MouseArea {
            anchors.fill: parent
            onClicked: {
                radio.mute = !radio.mute;
                refreshMute();
            }
        }
    }

    Text {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 20
        font.pixelSize: 38
        color: "white"
        text: "Frequency"

        Text {
            id: frequency
            anchors.top: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 10
            font.pixelSize: 48
            color: "white"
            text: "Mhz"
            Component.onCompleted: refreshFrequency();

            Rectangle {
                anchors.top: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                width: 100
                height: 20
                color: "transparent"

                Text {
                    id: frequency_minus
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.margins: 10
                    font.pixelSize: 38
                    color: "white"
                    text: "\uf068"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: { radio.freq -= 0.1; refreshFrequency(); }
                    }
                }
                Text {
                    id: frequency_plus
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.margins: 10
                    font.pixelSize: 38
                    color: "white"
                    text: "\uf067"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: { radio.freq += 0.1; refreshFrequency(); }
                    }
                }
            }
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: 250
        height: 120
        color: "transparent"

        Text {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 40
            color: "white"
            text: "Presets"
        }

        Image {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: 10
            width: 65
            height: width
            source: "images/preset_1.png"
            MouseArea {
                anchors.fill: parent
                onClicked: { radio.freq = 90.8; refreshFrequency(); }
            }
        }

        Image {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 10
            width: 65
            height: width
            source: "images/preset_2.png"
            MouseArea {
                anchors.fill: parent
                onClicked: { radio.freq = 95.6; refreshFrequency(); }
            }
        }

        Image {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 10
            width: 65
            height: width
            source: "images/preset_3.png"
            MouseArea {
                anchors.fill: parent
                onClicked: { radio.freq = 101.3; refreshFrequency(); }
            }
        }
    }

    RadioPropertyItem {
        id: radio
        onPlaying: { power.source = "../../images/switchplate_on.png"; refreshMute(); }
        onStopped: { power.source = "../../images/switchplate_off.png"; refreshMute(); }
    }
}
