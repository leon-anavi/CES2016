pragma Singleton
import QtQuick 2.0

Item {
    property string avatar: "male"

    property var leftHand: ListModel {
        ListElement {
            name: "thumb"
            filled: false
        }

        ListElement {
            name: "index"
            filled: false
        }

        ListElement {
            name: "middle"
            filled: false
        }

        ListElement {
            name: "ring"
            filled: false
        }

        ListElement {
            name: "pinky"
            filled: false
        }
    }

    property var rightHand: ListModel {
        ListElement {
            name: "thumb"
            filled: false
        }

        ListElement {
            name: "index"
            filled: false
        }

        ListElement {
            name: "middle"
            filled: false
        }

        ListElement {
            name: "ring"
            filled: false
        }

        ListElement {
            name: "pinky"
            filled: false
        }
    }
}
