/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0
import system 1.0
import utils 1.0
import vehicle 1.0
import "models"

App {
    appId: "dashboard"

    function changeVehicle(vehicle) {
        vehicle_container.vehicleImage = vehicle.image
        FuelModel.baseTank = vehicle.tank
        FuelModel.baseAverage = vehicle.mpg
        SpeedModel.baseMaxSpeed = vehicle.speed
    }

    Component.onCompleted: changeVehicle(CarsModel.get(1))

    Item {
        id: header
        y: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 40
        anchors.rightMargin: 40
        height: 90

        DateTime {}
    }

    SpeedInfo {
        id: speed_container
        anchors.top: header.bottom
    }

    FuelInfo {
        id: fuel_container
        x: 540
        anchors.right: parent.right
        anchors.top: header.bottom
    }

    TemperatureInfo {
        id: temperature_container
        x: 540
        anchors.right: parent.right
        anchors.top: fuel_container.bottom
    }

    TireInfo {
        id: vehicle_container
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: temperature_container.bottom
    }

    Item {
        id: footer
        height: 100
        anchors.top: vehicle_container.bottom
        anchors.topMargin: -2
        anchors.left: parent.left
        anchors.right: parent.right

        Row {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter

            Repeater {
                model: CarsModel

                Text {
                    height: 80
                    width: parent.width / 3
                    font.pixelSize: 30
                    color: "#fe9c00"
                    text: model.name
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    MouseArea {
                        anchors.fill: parent
                        onClicked: changeVehicle(model)
                    }
                }
            }
        }
    }

}
