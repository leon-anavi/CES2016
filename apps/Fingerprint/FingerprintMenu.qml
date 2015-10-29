/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0
import system 1.0
import utils 1.0

Item {
    anchors.fill: parent

    signal openProfile()
    signal createProfile()
    signal deleteProfile()

    Text {
        y: 90
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 55
        color: Style.orangeViv
        text: "Fingerprint Options"
    }

    Column {
        y: 320
        spacing: 110
        anchors.horizontalCenter: parent.horizontalCenter

        BoxButton {
            height: 70
            width: 360
            shadow: "in"
            color: Style.greenViv
            text: "Open Profile"
            onClicked: openProfile()
        }

        BoxButton {
            height: 70
            width: 360
            shadow: "in"
            color: Style.yellowViv
            text: "Create New Profile"
            onClicked: createProfile()
        }

        BoxButton {
            height: 70
            width: 360
            shadow: "in"
            color: Style.orangeViv
            text: "Delete Profile"
            onClicked: deleteProfile()
        }
    }
}
