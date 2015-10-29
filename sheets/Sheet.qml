/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0

Rectangle {
    width: 600
    height: 800
    color: Qt.rgba(0.9, 0.9, 0.9)
    default property alias data: flickable.children
    property alias contentHeight: flickable.contentHeight
   
    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.8)
    }

    Flickable {
        id: flickable
        anchors.fill: parent
    }

    onDataChanged: {
        if (flickable.children[1] !== undefined)
            flickable.children[1].parent = flickable.contentItem
    }
}
