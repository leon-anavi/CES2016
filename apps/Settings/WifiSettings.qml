/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
//import QtQuick.Controls 1.3
//import QtQuick.Controls.Styles 1.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import system 1.0
import components 1.0


SettingsView {
    name: "wifi"
    showTechnologyToggle: true

    onTechnologyEnabledChanged: {
        console.log("Wifi set to", technologyEnabled)
    }

    Text {
        anchors.centerIn: parent
        font.pixelSize: 40
        color: "white"
        text: "Wifi TB"
    }

    function listWifiNetworks(){
        console.log("test #4");
    }
}

