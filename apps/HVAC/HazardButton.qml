import QtQuick 2.0

Rectangle {
    id: hazardButton
    width: 624
    height: 122
    color: "#aa000000"
    border.color: "#ff53b5ce"

    property bool value: false
    property bool flash: false

    Image {
        id: image
        source: "./images/hazard_" + (value ? (flash ? "blink" : "on") : "off") + ".png"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: value = !value
    }

    Timer {
        id: timer
        interval: 500
        repeat: true
        running: value

        onTriggered: flash = !flash
    }
}
