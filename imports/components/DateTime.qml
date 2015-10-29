import QtQuick 2.0
import utils 1.0

Item {
    id: dateTime
    anchors.left: parent.left
    anchors.right: parent.right
    height: 120
    property var timeStamp: new Date()

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: timeStamp = new Date()
    }

    Label {
        fontColor: Style.grey
        text: Qt.formatDate(timeStamp, "ddd MMM d")
    }

    Label {
        anchors.right: parent.right
        fontColor: Style.grey
        text: Qt.formatTime(timeStamp, "h:mm AP")
    }
}

