/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0

Item {
    width: childrenRect.width
    height: childrenRect.height

    Image {
        id: nfcIcon01
        source: "images/nfc_icon_01.png"
        width: 150
    }

    Image {
        id: nfcIcon02
        source: "images/nfc_icon_02.png"
        width: 150
        opacity: 0
    }

    Image {
        id: nfcIcon03
        source: "images/nfc_icon_03.png"
        width: 150
        opacity: 0
    }

    SequentialAnimation {
        loops: Animation.Infinite
        running: true

        NumberAnimation {
            target: nfcIcon01
            property: "opacity"
            from: 0
            to: 1
            duration: 800
        }

        NumberAnimation {
            target: nfcIcon02
            property: "opacity"
            from: 0
            to: 1
            duration: 800
        }

        NumberAnimation {
            target: nfcIcon03
            property: "opacity"
            from: 0
            to: 1
            duration: 800
        }

        NumberAnimation {
            target: nfcIcon03
            property: "opacity"
            from: 1
            to: 0
            duration: 800
        }

        NumberAnimation {
            target: nfcIcon02
            property: "opacity"
            from: 1
            to: 0
            duration: 800
        }

        NumberAnimation {
            target: nfcIcon01
            property: "opacity"
            from: 1
            to: 0
            duration: 800
        }
    }
}
