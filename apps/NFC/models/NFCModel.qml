/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton
import QtQuick 2.0

Item {
    property string status: "off"
    property string value: "AGL app suite"

    onStatusChanged: {
        if (status === "searching") {
            searchTimer.start()
        }
    }

    Timer {
        id: searchTimer
        running: false
        repeat: false
        interval: 3000
        onTriggered: {
            if (status === "searching") {
                status = "found"
            }
        }
    }
}
