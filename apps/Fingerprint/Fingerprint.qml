/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0
import system 1.0
import utils 1.0

App {
    appId: "fingerprint"
    property string appState: ""

    DateTime {
        y: 10
        anchors.leftMargin: 40
        anchors.rightMargin: 40
    }

    FingerprintMenu {
        visible: appState === ""
        onCreateProfile: appState = "createProfile"
        onOpenProfile: appState = "createRecord"
    }

    CreateProfile {
        visible: appState == "createProfile"
        onMenu: appState = ""
        onCreateProfile: appState = "createRecord"
    }

    CreateFingerRecord {
        visible: appState === "createRecord"
        onMenu: appState = ""
    }
}
