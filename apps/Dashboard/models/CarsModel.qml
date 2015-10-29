/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton

import QtQuick 2.0

ListModel {
    ListElement {
        name: "F-Type"
        mpg: 25
        tank: 18.5
        speed: 171
        image: "images/F-Type_Call_Outs.png"
    }

    ListElement {
        name: "Range Rover"
        mpg: 22
        tank: 27.7
        speed: 162
        image: "images/Range_Rover_Outline_Call_Outs.png"
    }

    ListElement {
        name: "Land Rover LR4"
        mpg: 18
        tank: 22.8
        speed: 121
        image: "images/LR4_Outline_Call_Outs.png"
    }
}
