import QtQuick 2.0
import components 1.0
import system 1.0

HexGrid {
    id: root

    columns: 5
    spacing: 10

    Repeater {
        model: ListModel {
            ListElement { icon: "hvac"; name: "HVAC" }
            ListElement { icon: "browser"; name: "DNA Browser" }
            ListElement { icon: "dashboard"; name: "Dashboard" }
            ListElement { icon: "googlemaps"; name: "Google Maps" }
            ListElement { icon: "news"; name: "News" }
            ListElement { icon: "nfc"; name: "NFC" }
            ListElement { icon: "fmradio"; name: "FM Radio" }
            ListElement { icon: "phone"; name: "Phone" }
            ListElement { icon: "weather"; name: "Weather" }
            ListElement { icon: "media_player"; name: "Media Manager" }
            ListElement { icon: "cameras"; name: "Cameras" }
            ListElement { icon: "fingerprint"; name: "Fingerprint" }
            ListElement { icon: "wayland"; name: "Wayland" }
        }
        delegate: GridItem {
            name: model.name
            icon: model.icon
            onClicked: System.activeApp = model.icon
        }
    }
}
