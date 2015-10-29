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
