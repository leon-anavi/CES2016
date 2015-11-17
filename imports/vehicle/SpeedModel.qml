/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton

import QtQuick 2.0
import amb 0.1

Item {
    property bool metric: false

    function mphToKph(value) {
        return (metric ? 1.60934 : 1 ) * value
    }

    property real baseMaxSpeed: 255
    property real textSpeed: prop.value
    property real percentage: textSpeed / baseMaxSpeed * 100

    AutomotivePropertyItem {
        id: prop

        objectName: "VehicleSpeed"
        propertyName: "Speed"

        Component.onCompleted: prop.connect();
    }

    Behavior on percentage {
        SmoothedAnimation {
            velocity: 100
        }
    }
}
