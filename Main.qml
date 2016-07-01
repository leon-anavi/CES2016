/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.3
import "apps/Browser"
import "apps/Cameras"
import "apps/Dashboard"
import "apps/Fingerprint"
import "apps/FMRadio"
import "apps/GoogleMaps"
import "apps/Home"
import "apps/HVAC"
import "apps/MediaPlayer"
import "apps/News"
import "apps/NFC"
import "apps/Phone"
import "apps/Settings"
import "apps/Weather"
import "apps/WaylandView"
import system 1.0

Item {
    width: 640
    height: 480

    Image {
        anchors.centerIn: parent
        source: "images/Hex-Background.jpg"
    }

    Item {
        id: appSurface

        anchors.top: topbar.bottom
        anchors.bottom: bottombar.top
        anchors.left: parent.left
        anchors.right: parent.right

        AppGrid {
            anchors.centerIn: parent
            visible: System.activeApp === "appgrid"
        }

        Browser {}
        Cameras {}
        Dashboard {}
        Fingerprint {}
        FMRadio {}
        GoogleMaps {}
        Home {}
        HVAC {}
        MediaPlayer {}
        News {}
        NFC {}
        Phone {}
        Weather {}
        WaylandView {}
    }

    TopBar {
        id: topbar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    BottomBar {
        id: bottombar
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }

    Settings {
        id: settings
        visible: System.showSettings
        anchors.fill: parent
        anchors.topMargin: 120
        anchors.bottomMargin: 120
    }

    Keyboard {
        id: keyboard
        y: System.showKeyboard ? parent.height - height : parent.height
        width: parent.width

        Behavior on y { YAnimator { duration: 300; easing.type: Easing.OutQuad }}
    }
}
