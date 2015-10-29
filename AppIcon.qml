import QtQuick 2.0

Item {
    id: root

    width: 90
    height: 90

    property string name

    signal clicked()

    Image {
        id: icon
        anchors.centerIn: parent
        source: "images/" + name + "_app_icon.png"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
