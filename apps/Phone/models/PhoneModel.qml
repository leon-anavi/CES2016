pragma Singleton

import QtQuick 2.0
import "."

Item {
    property string view: "dial"

    property string callState: ""
    property string callName: "Unknown number"
    property string callNumber: "12347618"
    property string callTime: ""

    function dial(number) {
        view = "dial"
        callNumber = number
        callState = "dialing"
        callName = ContactsModel.findName(number)
        callTime = Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm")
    }

    function hangUp() {
        callState = ""
        CallListModel.insert(0, {
            "number": callNumber,
            "name": callName,
            "time": callTime
        })
    }
}
