import QtQuick 2.0    
import QtGraphicalEffects 1.0

Item {
    id: root

    anchors.fill: parent
    property alias color: shadow.color
    property alias radius: shadow.radius

    Item {
        id: shadowTarget
        x: -radius
        y: -radius
        width: parent.width + 2 * radius
        height: parent.height + 2 * radius

        Rectangle {
            anchors.centerIn: parent
            width: root.width
            height: root.height
            color: "black"
        }
    }

    DropShadow {
        id: shadow
        anchors.fill: shadowTarget
        horizontalOffset: 0
        verticalOffset: 0
        radius: 16
        samples: 32
        source: shadowTarget
    }
}
