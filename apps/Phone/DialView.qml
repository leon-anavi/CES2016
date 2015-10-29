import QtQuick 2.0
import components 1.0
import utils 1.0
import "models"

Item {
    anchors.fill: parent

    ButtonLabel {
        id: contactsButton
        buttonText: "contacts"
        ucKey: "\uf0c0"
        onClicked: PhoneModel.view = "contacts"
    }

    Dialer {
        width: parent.width
        anchors.top: contactsButton.bottom
        anchors.bottom: callList.top
    }

    ListView {
        id: callList
        height: 340
        width: parent.width
        anchors.bottom: parent.bottom
        orientation: ListView.Horizontal
        visible: PhoneModel.callState === ""
        model: CallListModel

        delegate: Item {
            height: parent.height
            width: callList.width * 0.25

            Column {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 10

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "images/contact_picture_blue.png"
                }

                Rectangle {
                    width: parent.width
                    height: 2
                    color: "white"
                }

                Text {
                    width: parent.width + 20
                    elide: Text.ElideRight
                    color: Style.orangeViv
                    font.capitalization: Font.AllUppercase
                    font.pixelSize: 40
                    font.weight: Font.Bold
                    font.family: "Source Sans Pro"
                    text: model.name
                }

                Row {
                    width: parent.width
                    spacing: 8

                    Image {
                        source: "images/icon_mobile_blue.png"
                    }

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        color: Style.orangeViv
                        font.pixelSize: 30
                        font.weight: Font.Bold
                        font.family: "Source Sans Pro"
                        text: model.number
                    }
                }

                Text {
                    color: "white"
                    font.pixelSize: 25
                    font.family: "Source Sans Pro"
                    text: model.time
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: PhoneModel.dial(model.number)
            }
        }
    }

    CallInfo {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        visible: PhoneModel.callState !== ""
    }
}
