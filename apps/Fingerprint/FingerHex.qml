import QtQuick 2.0

Item {
    id: root

    width: childrenRect.width
    height: childrenRect.height

    property alias name: text.text
    property bool filled

    signal clicked()

    Column {
        Image {
            source: "images/print-record-" + (filled ? "filled" : "empty") + ".png"

            MouseArea {
                anchors.fill: parent
                onClicked: root.clicked()
            }
        }

        Text {
            id: text
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 30
            color: "white"
        }   
    }
}
