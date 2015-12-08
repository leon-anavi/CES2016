/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import system 1.0
import vehicle 1.0

App {
    appId: "googlemaps"

    Connections {
        target: PositionModel
        onSatellitesChanged: satellites.text = "Satellites : " + PositionModel.satellites
        onNmeaStringChanged: position.text = parseNmea(PositionModel.nmeaString)
    }

    function drawMap() {
        // TODO
    }

    function parseNmea(nmeaString) {
	var nmea = nmeaString.split(",");
        var lat = "0.0,N";
        var lon = "0.0,W";

        switch (nmea[0]) {
            case "$GPRMC":
                if (nmea[2] !== 'A') return;
                lat =[nmea[3], nmea[4]];
                lon =[nmea[5], nmea[6]];
                break;
            case "$GPGGA":
                if (nmea[6] !== '1') return;
                lat =[nmea[2], nmea[3]];
                lon =[nmea[4], nmea[5]];
                break;
            default:
        }
        return lat + ", " + lon;
    }

    // -------------

    // OpenStreetMap map
    Image {
        id: map
        anchors.centerIn: parent
        anchors.margins: 10
        width: 340
        height: 150
        source: "images/map_default.png"
        Component.onCompleted: drawMap();

        // GPS title ("GPS information")
        Text {
            anchors.bottom: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 100
            font.pixelSize: 24
            color: "white"
            text: "GPS information"

            // Satellites content ("Satellites : 3")
            Text {
                id: satellites
                anchors.top: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 10
                font.pixelSize: 22
                color: "white"
                text: "Satellites : " + PositionModel.satellites
            }
 
            // Position content ("Position : 210.2N, 245.8W")
            Text {
                id: position
                anchors.top: satellites.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 10
                font.pixelSize: 22
                color: "white"
                text: "Position : " + parseNmea(PositionModel.nmeaString)
            }
        }
    }

}
