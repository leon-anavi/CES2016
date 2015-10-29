import QtQuick 2.0
import components 1.0
import system 1.0
import "models"

App {
    appId: "phone"
    anchors.fill: parent

    Item {
        anchors.fill: parent
        anchors.margins: 20

        DateTime {
            id: dateTime
        }

        Item {
            width: parent.width
            anchors.top: dateTime.bottom
            anchors.bottom: parent.bottom

            DialView {
                visible: PhoneModel.view === "dial"
            }

            Contacts {
                visible: PhoneModel.view === "contacts"
            }
        }
    }
}
