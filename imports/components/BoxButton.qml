import QtQuick 2.0
import components 1.0

Item {
    id: root

    property alias shadow: box.shadow
    property alias color: box.color
    property alias text: textItem.text

    signal clicked()

    Box {
        id: box
        anchors.fill: parent

        Text {
            id: textItem
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 28
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
