import QtQuick 2.0
import components 1.0

Item {
    id: root

    property alias buttonText: text.text
    property alias buttonIcon: awesomeIcon
    property alias ucKey: awesomeIcon.ucKey
    property alias iconColor: awesomeIcon.iconColor
    property alias fontColor: text.fontColor
    property alias fontSize: text.fontSize

    width: childrenRect.width
    height: awesomeIcon.height

    signal clicked()

    AwesomeIcon {
        id: awesomeIcon
        iconColor: "#fe9c00"
        iconSize: text.fontSize*1.1
    }

    Label {
        // Contacts Label
        id: text
        anchors.verticalCenter: awesomeIcon.verticalCenter
        anchors.left: awesomeIcon.right
        anchors.leftMargin: 10
        fontColor: "white"
        fontSize: 30
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
