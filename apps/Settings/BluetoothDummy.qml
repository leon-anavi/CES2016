/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0


ListModel {
    ListElement {
        deviceName:"Device Name #1"
        deviceAddress:"ab:cd:ef:01:23:45:67:89"
        paired:false
    }
    ListElement {
        deviceName:"Bob's Phone"
        deviceAddress:"aa:cc:ef:01:23:45:67:89"
        paired:false
    }
    ListElement {
        deviceName:"Frank's Phone"
        deviceAddress:"bb:cd:ff:01:23:55:67:89"
        paired:false
    }
}
