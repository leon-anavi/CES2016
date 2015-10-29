import QtQuick 2.0

Item {
    id: root
    width: image.width
    height: image.height * 0.5
    clip: true

    property string icon
    property bool active: false
    property int adjust: 0

    signal clicked()

    Image {
        id: image
        y: active ? -0.5 * height + adjust: 0
        source: "images/btn-" + icon + ".png"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
