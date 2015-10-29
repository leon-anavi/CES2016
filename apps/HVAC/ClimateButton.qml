import QtQuick 2.0
import "models"

Rectangle {
    id: root

    width: imageItem.width
    height: imageItem.height
    color: "#aa000000"

    property string target: ""
    property string image: ""
    property bool value: HVACModel[target]

    Image {
        id: imageItem
        source: "images/" + image + "_" + (value ? "on" : "off") + ".png"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: HVACModel[target] = !HVACModel[target]
    } 
}
