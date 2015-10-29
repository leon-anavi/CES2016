/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import vehicle 1.0

Item {
    width: 540
    height: 295

    MouseArea {
        anchors.fill: parent
        onClicked: FuelModel.metric = !FuelModel.metric
    }

    Image {
        id: fuel_icon
        width: 35
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        source: "../../images/dashboard/Fuel_Icon.png"
    }

    Text {
        id: fuel_label
        text: qsTr("FUEL")
        anchors.verticalCenter: fuel_icon.verticalCenter
        verticalAlignment: Text.AlignVCenter
        anchors.left: fuel_icon.right
        anchors.leftMargin: 15
        font.pixelSize: 36
        color: "yellow"
    }

    Text {
        id: fuel_unit
        color: "#d9b8a814"
        text: FuelModel.metric ? qsTr("LITERS") : qsTr("GALLONS")
        anchors.bottomMargin: 0
        anchors.bottom: fuel_label.bottom
        anchors.left: fuel_label.right
        anchors.leftMargin: 6
        font.pixelSize: 20
    }

    Rectangle {
        id: fuel_bar
        x: 49
        y: 75
        width: FuelModel.percentage * 4
        height: 12
        color: "yellow"
    }

    Item {
        id: fuel_gauge
        x: 48
        y: 96
        width: 400
        height: 15

        Row {
            id: fuel_bars
            y: 42
            height: 10
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 390 / 4

            Repeater {
                model: 5

                Item {
                    width: 2
                    height: 10
 
                    Rectangle {
                        anchors.fill: parent
                        color: "yellow"
                    }

                    Text {
                        y: 12
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "yellow"
                        text: (index * FuelModel.tankSize / 4).toFixed(0)
                        font.pixelSize: 12
                    }
                }
            }
        }

        Rectangle {
            id: fuel_bottom_bar
            width: 400
            height: 2
            color: "yellow"
            anchors.top: fuel_bars.bottom
        }
    }

    Text {
        id: fuel_level_label
        x: 73
        y: 158
        color: "#ffffff"
        text: qsTr("LEVEL:")
        font.bold: true
        font.pixelSize: 24
    }

    Text {
        id: fuel_range_label
        x: 73
        y: 185
        color: "#ffffff"
        text: qsTr("RANGE:")
        font.bold: true
        font.pixelSize: 24
    }

    Text {
        id: fuel_avg_label
        x: 73
        y: 214
        color: "#ffffff"
        text: qsTr("AVG:")
        font.bold: true
        font.pixelSize: 24
    }

    Text {
        id: fuel_amount
        x: 225
        y: 158
        color: "#ffffff"
        text: FuelModel.level.toFixed(0) + (FuelModel.metric ? qsTr(" liters") : qsTr(" gallons"))
        font.pixelSize: 24
    }

    Text {
        id: fuel_range
        x: 225
        y: 185
        color: "#ffffff"
        text: FuelModel.range.toFixed(0) + (FuelModel.metric ? qsTr(" km") : qsTr(" mi"))
        font.pixelSize: 24
    }

    Text {
        id: fuel_avg_consumption
        x: 225
        y: 214
        color: "#ffffff"
        text: FuelModel.average.toFixed(1) + (FuelModel.metric ? qsTr(" l/100 km") : qsTr(" mpg"))
        font.pixelSize: 24
    }

    Rectangle {
        id: rectangle1
        x: 49
        y: 169
        width: 7
        height: 7
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle2
        x: 48
        y: 196
        width: 7
        height: 7
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle3
        x: 48
        y: 225
        width: 7
        height: 7
        color: "#ffffff"
    }
}
