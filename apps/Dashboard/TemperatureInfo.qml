/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import vehicle 1.0

Item {
    width: 540
    height: 295

    Image {
        id: temp_icon
        width: 20
        height: 45
        anchors.top: parent.top
        anchors.left: parent.left
        source: "../../images/dashboard/Temperature_Icon.png"
    }

    Text {
        id: temperature_label
        color: "#0eff00"
        text: qsTr("TEMPERATURE")
        font.pixelSize: 36
        anchors.left: temp_icon.right
        anchors.leftMargin: 28
        verticalAlignment: Text.AlignVCenter
        anchors.verticalCenter: temp_icon.verticalCenter
    }

    Text {
        id: temperature_unit
        color: "#0eb300"
        text: TemperatureModel.metric ? qsTr("CELSIUS") : qsTr("FAHRENHEIT")
        font.pixelSize: 20
        anchors.left: temperature_label.right
        anchors.leftMargin: 6
        anchors.bottom: temperature_label.bottom
    }

    Text {
        id: temperature_outdoor_label
        x: 73
        y: 81
        color: "#ffffff"
        text: qsTr("OUTDOOR:")
        font.bold: true
        font.pixelSize: 24
    }

    Text {
        id: temperature_outdoor_temperature
        x: 225
        y: 81
        color: "#ffffff"
        text: TemperatureModel.outdoorString
        font.pixelSize: 24
    }

    Rectangle {
        id: rectangle4
        x: 48
        y: 92
        width: 7
        height: 7
        color: "#ffffff"
    }

    Text {
        id: temperature_indoor_label
        x: 73
        y: 117
        color: "#ffffff"
        text: qsTr("INDOOR:")
        font.bold: true
        font.pixelSize: 24
    }

    Text {
        id: temperature_indoor_tempature
        x: 225
        y: 117
        color: "#ffffff"
        text: TemperatureModel.indoorString
        font.pixelSize: 24
    }

    Rectangle {
        id: rectangle5
        x: 48
        y: 128
        width: 7
        height: 7
        color: "#ffffff"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: TemperatureModel.metric = !TemperatureModel.metric
    }
}
