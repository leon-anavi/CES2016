/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton

import QtQuick 2.0

Item {
    property bool metric: false

    function mphToKph(value) {
        return (metric ? 1.60934 : 1 ) * value
    }

    property real baseMaxSpeed: 120
    property real textSpeed: 0
    property real currentSpeed: percentage * max * 0.01
    property real max: Math.ceil(mphToKph(baseMaxSpeed) / 30) * 30
    property real percentage: 0

    Timer {
        interval: 100
        repeat: true
        running: true

        onTriggered: textSpeed = currentSpeed
    }

    NumberAnimation on percentage {
        from: 100
        to: 0
        duration: 15000
        loops: Animation.Infinite
        easing.type: Easing.CosineCurve
    }
}
