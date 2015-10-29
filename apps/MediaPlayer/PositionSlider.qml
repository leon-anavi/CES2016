import QtQuick 2.0
import utils 1.0

Item {
    height: 200

    property real value
    property real max

    function formatDuration(v) {
        var s = Math.floor(v % 60)
        var m = Math.floor(v / 60)
        return m + ":" + ("00" + s).slice(-2)
    }

    Image {
        id: handle
        anchors.top: parent.top
        anchors.topMargin: 80
        x: (parent.width - width + 60) * value / max - 30
        source: "images/handle_blue.png"
    }

    Rectangle {
        id: line
        anchors.top: handle.bottom
        anchors.topMargin: -22
        width: parent.width
        height: 2
        y: -30
        color: Style.blueViv
    }

    Text {
        anchors.top: line.bottom
        anchors.topMargin: 5
        color: Style.blueViv
        font.pixelSize: 30
        text: formatDuration(value / 1000)
    }
}
