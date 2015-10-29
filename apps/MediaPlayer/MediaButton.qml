/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0

Item {
    id: root
    width: image.width
    height: image.height * 0.5
    clip: true

    property string icon
    property bool active: false
    property int adjust: 0

    signal clicked()

    Image {
        id: image
        y: active ? -0.5 * height + adjust: 0
        source: "images/btn-" + icon + ".png"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
