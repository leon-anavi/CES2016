/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton

import QtQuick 2.0

Item {
    property bool fanUp: false
    property bool fanRight: false
    property bool fanDown: false

    property bool fanAC: false
    property bool fanAuto: false
    property bool fanRecirc: false

    property bool defrostMax: false
    property bool defrostFront: false
    property bool defrostRear: false

    property real leftTemperature: 0
    property real rightTemperature: 0

    property int leftSeatHeat: 0
    property int rightSeatHeat: 0
}
