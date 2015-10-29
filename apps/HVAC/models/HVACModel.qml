pragma Singleton

import QtQuick 2.0

Item {
    property bool fanUp: false
    property bool fanRight: false
    property bool fanDown: false

    property bool fanAC: false
    property bool fanAuto: false
    property bool fanRecirc: false

    property bool defrostMax: false
    property bool defrostFront: false
    property bool defrostRear: false

    property real leftTemperature: 0
    property real rightTemperature: 0

    property int leftSeatHeat: 0
    property int rightSeatHeat: 0
}
