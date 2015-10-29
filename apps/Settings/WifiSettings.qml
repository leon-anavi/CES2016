import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import system 1.0
import components 1.0


SettingsView {
    name: "wifi"
    showTechnologyToggle: true

    onTechnologyEnabledChanged: {
        console.log("Wifi set to", technologyEnabled)
    }

    Text {
        anchors.centerIn: parent
        font.pixelSize: 40
        color: "white"
        text: "Wifi TB"
    }

    function listWifiNetworks(){
        console.log("test #4");
    }
}

