import QtQuick 2.0
import system 1.0
import components 1.0
import utils 1.0

Item {
    height: icon.height
    width: icon.height

    property alias iconSize: icon.font.pixelSize
    property alias ucKey: icon.text
    property alias iconColor: icon.color

    Text {
        id: icon
        font.family: "FontAwesome"
        color: "white"
    }
}

