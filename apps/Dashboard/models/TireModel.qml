/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton

import QtQuick 2.0

Item {
    property bool metric: false
    property alias pressure: pressureItem

    function psiToBar(value) {
        return (metric ? 0.06895 : 1) * value
    }

    Item {
        id: pressureItem

        property real frontLeft: psiToBar(28 + flDiff)
        property real frontRight: psiToBar(28 + frDiff)
        property real rearLeft: psiToBar(28 + rlDiff)
        property real rearRight: psiToBar(28 + rrDiff)

        property real flDiff: 0
        property real frDiff: 0
        property real rlDiff: 0
        property real rrDiff: 0

        NumberAnimation on flDiff {
            from: -5
            to: 5
            duration: 5000
            loops: Animation.Infinite
            easing.type: Easing.CosineCurve
        }

        NumberAnimation on frDiff {
            from: -5
            to: 5
            duration: 5300
            loops: Animation.Infinite
            easing.type: Easing.CosineCurve
        }

        NumberAnimation on rlDiff {
            from: -5
            to: 5
            duration: 5700
            loops: Animation.Infinite
            easing.type: Easing.CosineCurve
        }

        NumberAnimation on rrDiff {
            from: -5
            to: 5
            duration: 6100
            loops: Animation.Infinite
            easing.type: Easing.CosineCurve
        }
    }
}
