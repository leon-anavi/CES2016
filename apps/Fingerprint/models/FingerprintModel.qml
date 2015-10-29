/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton
import QtQuick 2.0

Item {
    property string avatar: "male"

    property var leftHand: ListModel {
        ListElement {
            name: "thumb"
            filled: false
        }

        ListElement {
            name: "index"
            filled: false
        }

        ListElement {
            name: "middle"
            filled: false
        }

        ListElement {
            name: "ring"
            filled: false
        }

        ListElement {
            name: "pinky"
            filled: false
        }
    }

    property var rightHand: ListModel {
        ListElement {
            name: "thumb"
            filled: false
        }

        ListElement {
            name: "index"
            filled: false
        }

        ListElement {
            name: "middle"
            filled: false
        }

        ListElement {
            name: "ring"
            filled: false
        }

        ListElement {
            name: "pinky"
            filled: false
        }
    }
}
