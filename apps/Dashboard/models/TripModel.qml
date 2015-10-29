pragma Singleton

import QtQuick 2.0

Item {
    property bool metric: false

    function milesToKm(value) {
        return (metric ? 1.60934 : 1) * value
    }

    property real distance: milesToKm(100000.5)
}
