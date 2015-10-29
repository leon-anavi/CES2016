import QtQuick 2.0
import system 1.0

SettingsView {
    name: "volume"
    description: "Master Volume"

    Text {
        anchors.centerIn: parent
        font.pixelSize: 40
        color: "white"
        text: "Volume TBD"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: System.activeSetting = "settings"
    }
}
