import QtQuick 2.0
import system 1.0

Item {
    property string appId: ""
    anchors.fill: parent
    visible: System.activeApp === appId
}
