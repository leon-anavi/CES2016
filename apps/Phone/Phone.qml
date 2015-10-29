/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import components 1.0
import system 1.0
import "models"

App {
    appId: "phone"
    anchors.fill: parent

    Item {
        anchors.fill: parent
        anchors.margins: 20

        DateTime {
            id: dateTime
        }

        Item {
            width: parent.width
            anchors.top: dateTime.bottom
            anchors.bottom: parent.bottom

            DialView {
                visible: PhoneModel.view === "dial"
            }

            Contacts {
                visible: PhoneModel.view === "contacts"
            }
        }
    }
}
