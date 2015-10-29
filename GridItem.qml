import QtQuick 2.0

Item {
    id: root

    width: background.width
    height: background.height

    property string name
    property string icon

    signal clicked()

    Image {
        id: background
        source: "images/AppHex.png"
    }

    Column {
        y: 10
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: -10

        AppIcon {
            name: root.icon
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            text: root.name
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
