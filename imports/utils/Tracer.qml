/*
 *   Copyright (C) 2015 Pelagicore AB
 *   All rights reserved.
 */

import QtQuick 2.0

Item {
    id: root
    anchors.fill: parent
    property color color: 'red'
    visible: true

    Rectangle {
        id: frame
        anchors.fill: parent
        anchors.margins: 0
        color: 'transparent'
        border.color: root.color
        border.width: 2
    }
}
