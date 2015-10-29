import QtQuick 2.0
import system 1.0

SettingsView {
    name: "hotspot"
    description: "Wifi Tethering/Hotspot"

    Text {
        anchors.centerIn: parent
        font.pixelSize: 40
        color: "white"
        text: "Hotspot TBD"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: System.activeSetting = "settings"
    }
}
