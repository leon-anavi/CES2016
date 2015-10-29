/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import "models"

Item {
    id: vehicle_container
    width: 1080
    height: 912
    property alias vehicleImage: vehicle_image.source

    Image {
        id: vehicle_image
        x: 136
        width: 776
        height: 833
        anchors.top: parent.top
        anchors.topMargin: 30

        MouseArea {
            anchors.fill: parent
            onClicked: TireModel.metric = !TireModel.metric
        }
    }

    Image {
        id: l_f_tire_icon
        y: 246
        width: 35
        height: 35
        anchors.left: parent.left
        anchors.leftMargin: 55
        fillMode: Image.PreserveAspectFit
        source: "../../images/dashboard/Status_OK.png"
    }

    Text {
        id: left_front_tire_label
        color: "#b2f0ff"
        text: qsTr("Left Front Tire")
        anchors.top: l_f_tire_icon.top
        anchors.topMargin: 3
        anchors.left: l_f_tire_icon.right
        anchors.leftMargin: 15
        font.pixelSize: 24
    }

    Text {
        id: front_left_tire_pressure
        color: "#ffffff"
        text: TireModel.pressure.frontLeft.toFixed(1)
        anchors.left: left_front_tire_label.left
        anchors.leftMargin: 0
        anchors.top: left_front_tire_label.bottom
        anchors.topMargin: 20
        font.pixelSize: 24
    }

    Text {
        id: front_left_tire_pressure_unit
        x: 160
        y: 297
        color: "#ffffff"
        text: TireModel.metric ? qsTr("bar") : qsTr("PSI")
        anchors.top: left_front_tire_label.bottom
        anchors.topMargin: 20
        anchors.left: front_left_tire_pressure.right
        font.pixelSize: 24
        anchors.leftMargin: 5
    }

    Image {
        id: l_r_tire_icon
        x: -1
        y: 519
        width: 35
        height: 35
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left
        source: "../../images/dashboard/Status_OK.png"
        anchors.leftMargin: 55
    }

    Text {
        id: left_rear_tire_label
        x: -1
        y: -1
        color: "#b2f0ff"
        text: qsTr("Left Rear Tire")
        anchors.top: l_r_tire_icon.bottom
        anchors.topMargin: -31
        anchors.left: l_r_tire_icon.right
        font.pixelSize: 24
        anchors.leftMargin: 15
    }

    Text {
        id: rear_left_tire_pressure
        x: -1
        y: -1
        color: "#ffffff"
        text: TireModel.pressure.rearLeft.toFixed(1)
        anchors.top: left_rear_tire_label.bottom
        anchors.topMargin: 20
        anchors.left: left_rear_tire_label.right
        font.pixelSize: 24
        anchors.leftMargin: -148
    }

    Text {
        id: rear_left_tire_pressure_unit
        x: 159
        y: 570
        color: "#ffffff"
        text: TireModel.metric ? qsTr("bar") : qsTr("PSI")
        anchors.top: left_rear_tire_label.bottom
        anchors.topMargin: 20
        anchors.left: rear_left_tire_pressure.right
        font.pixelSize: 24
        anchors.leftMargin: 5
    }

    Image {
        id: r_f_tire_icon
        x: -6
        y: 246
        width: 35
        height: 35
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left
        source: "../../images/dashboard/Status_OK.png"
        anchors.leftMargin: 810
    }

    Text {
        id: right_front_tire_label
        x: -6
        y: -6
        color: "#b2f0ff"
        text: qsTr("Right Front Tire")
        anchors.top: r_f_tire_icon.top
        anchors.topMargin: 3
        anchors.left: l_f_tire_icon.right
        font.pixelSize: 24
        anchors.leftMargin: 770
    }

    Text {
        id: front_right_tire_pressure
        x: -6
        y: -6
        color: "#ffffff"
        text: TireModel.pressure.frontRight.toFixed(1)
        anchors.top: right_front_tire_label.bottom
        anchors.topMargin: 20
        anchors.left: left_front_tire_label.left
        font.pixelSize: 24
        anchors.leftMargin: 755
    }

    Text {
        id: front_right_tire_pressure_unit
        x: 909
        y: 297
        color: "#ffffff"
        text: TireModel.metric ? qsTr("bar") : qsTr("PSI")
        anchors.top: front_right_tire_pressure.bottom
        anchors.topMargin: -28
        anchors.left: front_right_tire_pressure.right
        font.pixelSize: 24
        anchors.leftMargin: 5
    }

    Image {
        id: r_r_tire_icon
        x: -6
        y: 519
        width: 35
        height: 35
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left
        source: "../../images/dashboard/Status_OK.png"
        anchors.leftMargin: 810
    }

    Text {
        id: right_rear_tire_label
        x: -6
        y: -6
        color: "#b2f0ff"
        text: qsTr("Right Rear Tire")
        anchors.top: r_r_tire_icon.bottom
        anchors.topMargin: -32
        anchors.left: r_r_tire_icon.right
        font.pixelSize: 24
        anchors.leftMargin: 15
    }

    Text {
        id: rear_right_tire_pressure
        x: -6
        y: -6
        color: "#ffffff"
        text: TireModel.pressure.rearRight.toFixed(1)
        anchors.top: right_rear_tire_label.bottom
        anchors.topMargin: 20
        anchors.left: left_front_tire_label.left
        font.pixelSize: 24
        anchors.leftMargin: 755
    }

    Text {
        id: front_right_tire_pressure_unit1
        x: 909
        y: 570
        color: "#ffffff"
        text: TireModel.metric ? qsTr("bar") : qsTr("PSI")
        anchors.top: rear_right_tire_pressure.bottom
        anchors.topMargin: -28
        anchors.left: front_right_tire_pressure.right
        font.pixelSize: 24
        anchors.leftMargin: 5
    }
}

