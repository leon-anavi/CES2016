import QtQuick 2.0

Rectangle {
    id: root
    border.color: "#cccccc"
    color:"#222"
    border.width: 2
    height: pairText.height + 20
    width: pairText.width + 20

    property string buttonText


    Text {
        id: pairText
        anchors.centerIn: parent
        font.family: "Source Sans Pro"
        font.pixelSize: 48
        font.weight: Font.Bold
        color: "white"
        font.capitalization: Font.AllUppercase
        text: buttonText
    }
}
