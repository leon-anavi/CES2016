pragma Singleton
import QtQuick 2.0

Item {
    property string vinNumber: ""

    property var appStates: ListModel {
        ListElement { name: "HVAC"; state: false }
        ListElement { name: "FM Radio"; state: true }
    }
}
