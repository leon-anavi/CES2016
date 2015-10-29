import QtQuick 2.0
import "models"

Rectangle {
    width: 239
    height: 194
    color: "#aa000000"
    border.color: "#ff53b5ce"

    property string side: "left"
    property string propertyName: side + "SeatHeat"
    property int seatHeat: HVACModel[propertyName]

    Image {
        source: "./images/" + side + "_heat_seat_off.png"
    }

    Image {
        y: 150 - seatHeat*40
        height: implicitHeight - y
        fillMode: Image.Tile
        verticalAlignment: Image.AlignBottom
        source: "./images/" + side + "_heat_seat_on.png"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            var value = HVACModel[propertyName]
            HVACModel[propertyName] = value > 0 ? value - 1 : 3
        }
    }
}
