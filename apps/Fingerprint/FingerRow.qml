/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import "models"

Item {
    width: childrenRect.width
    height: childrenRect.height

    property string hand: "left"
    property var model: FingerprintModel[hand + "Hand"]

    FingerHex {
        x: hand === "left" ? 800 : 0
        y: 150
        name: "Thumb"
        filled: model.get(0).filled
        onClicked: model.setProperty(0, "filled", !filled)
    }

    FingerHex {
        x: hand === "left" ? 630 : 170
        y: 30
        name: "Index"
        filled: model.get(1).filled
        onClicked: model.setProperty(1, "filled", !filled)
    }

    FingerHex {
        x: hand === "left" ? 425 : 375
        name: "Middle"
        filled: model.get(2).filled
        onClicked: model.setProperty(2, "filled", !filled)
    }

    FingerHex {
        x: hand === "left" ? 220 : 580
        y: 10
        name: "Ring"
        filled: model.get(3).filled
        onClicked: model.setProperty(3, "filled", !filled)
    }

    FingerHex {
        x: hand === "left" ? 0 : 800
        y: 55
        name: "Pinky"
        filled: model.get(4).filled
        onClicked: model.setProperty(4, "filled", !filled)
    }
}
