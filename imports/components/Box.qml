import QtQuick 2.0
import utils 1.0

Item {
    id: root

    opacity: 0.8
    property color color: Style.grey
    property color border: color
    property string shadow: ""

    OutShadow {
        color: root.color
        visible: root.shadow === "out"
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        color: Style.black
        border.width: 1
        border.color: root.border
    }

    InsetShadow {
        color: root.color
        visible: root.shadow === "fill"
    }

    InShadow {
        color: root.color
        visible: root.shadow === "in"
    }

    Rectangle {
        visible: root.shadow === "fill"
        anchors.fill: parent
        color: "transparent"
        border.width: 1
        border.color: root.border
    }

}
