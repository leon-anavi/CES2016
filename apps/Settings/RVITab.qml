/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import QtQuick.Controls 1.3

Tab {
    id: root
    default property var contents
    property int margin: 38
    property int renderedHeight: 0

    Item {
        width: parent.width

        Rectangle {
            id: outerRect
            height: childrenRect.height + 3.2 * margin
            width: parent.width
            color: "#222"

            Rectangle {
                x: margin
                y: margin * 1.6
                height: childrenRect.height + childrenRect.y
                width: parent.width - 2 * margin
                border.width: 2
                border.color: "#555"
                color: "transparent"

                Item {
                    width: parent.width
                    height: childrenRect.height + childrenRect.y + margin

                    data: root.contents
                }
            }
        }
        Component.onCompleted: root.renderedHeight = outerRect.height
    }
}
