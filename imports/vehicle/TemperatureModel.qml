pragma Singleton

import QtQuick 2.0

Item {
    property bool metric: true

    function unit(value) {
        return celsiusToFahrenheit(value).toFixed(1) + "\u00b0" + (metric ? "C" : "F")
    }

    function celsiusToFahrenheit(value) {
        return (metric ? value : 1.8 * value + 32)
    }

    property real indoor: 20.4
    property string indoorString: unit(indoor)
    property real outdoor: 28.9
    property string outdoorString: unit(outdoor)
}
