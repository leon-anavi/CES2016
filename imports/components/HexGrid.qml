import QtQuick 2.0

Item {
    property real spacing: 0
    property int columns: 3

    width: childrenRect.width
    height: childrenRect.height

    Component.onCompleted: {
        var sizeX = childrenRect.height
        var sizeY = childrenRect.width
        var column = 0
        var row = 0

        for (var n = 0; n < children.length; n++) {
            children[n].x = column * (sizeX + spacing)
            children[n].y = row * (0.5 * sizeY + spacing)
            column += 2
            if (column >= columns) {
                row++
                column = row % 2
            }
        }
    }
}
