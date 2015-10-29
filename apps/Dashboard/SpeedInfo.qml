/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import vehicle 1.0
import "models"

Item {
    width: 540
    height: 590

    MouseArea {
        anchors.fill: parent
        onClicked: {
            SpeedModel.metric = !SpeedModel.metric
            TripModel.metric = !TripModel.metric
        }
    }

    Image {
        id: speed_icon
        width: 50
        height: 50
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: parent.top
        source: "../../images/dashboard/Speed_Icon.png"
    }

    Text {
        id: speed_label
        text: qsTr("SPEED")
        anchors.verticalCenter: speed_icon.verticalCenter
        verticalAlignment: Text.AlignVCenter
        anchors.left: speed_icon.right
        anchors.leftMargin: 15
        font.pixelSize: 36
        color: "orange"
    }

    Text {
        id: speed_unit
        text: SpeedModel.metric ? qsTr("KM/H") : qsTr("MPH")
        anchors.bottom: speed_label.bottom
        anchors.left: speed_label.right
        anchors.leftMargin: 6
        font.pixelSize: 20
        color: "orange"
    }

    Rectangle {
        id: speed_bar
        y: 75
        width: SpeedModel.percentage * 4
        height: 12
        color: "orange"
        anchors.left: speed_label.left
    }

    Item {
        id: speed_gauge
        y: 88
        width: 400
        height: 23
        anchors.left: speed_bar.left

        Row {
            id: speed_bars
            y: 15
            height: 10
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            spacing: 386 / 6

            Repeater {
                model: 7
                Item {
                    width: 2
                    height: 10

                    Rectangle {
                        anchors.fill: parent
                        color: "orange"
                    }

                    Text {
                        y: 12
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#ffa500"
                        text: (index * SpeedModel.max / 6).toFixed(0)
                        font.pixelSize: 12
                    }
                }
            }
        }

        Rectangle {
            width: 400
            height: 2
            color: "orange"
            anchors.left: speed_bars.left
            anchors.top: speed_bars.bottom
        }
    }

    Text {
        id: mph
        color: "#ffffff"
        text: SpeedModel.metric ? qsTr("KM/H") : qsTr("MPH")
        font.family: "Verdana"
        anchors.bottom: dynamic_mph.bottom
        anchors.bottomMargin: 8
        anchors.left: dynamic_mph.right
        anchors.leftMargin: 23
        font.pixelSize: SpeedModel.metric ? 42 : 52
    }

    Text {
        id: dynamic_mph
        x: 95
        y: 224
        width: 284
        height: 166
        color: "#ffffff"
        text: SpeedModel.textSpeed.toFixed(0)
        font.family: "Arial"
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 170
    }

    Text {
        id: odometer_amount
        width: 183
        height: 46
        color: "#666666"
        text: TripModel.distance.toLocaleString(Qt.locale("en_US"), "f", 1)
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: dynamic_mph.bottom
        anchors.topMargin: 40
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
    }

    Text {
        id: odometer_unit
        color: "#666666"
        text: TripModel.metric ? "KM" : "MI"
        anchors.top: odometer_amount.top
        anchors.left: odometer_amount.right
        anchors.leftMargin: 15
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 40
    }
}
