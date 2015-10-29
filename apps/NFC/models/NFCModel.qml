pragma Singleton
import QtQuick 2.0

Item {
    property string status: "off"
    property string value: "AGL app suite"

    onStatusChanged: {
        if (status === "searching") {
            searchTimer.start()
        }
    }

    Timer {
        id: searchTimer
        running: false
        repeat: false
        interval: 3000
        onTriggered: {
            if (status === "searching") {
                status = "found"
            }
        }
    }
}
