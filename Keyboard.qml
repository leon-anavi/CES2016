import QtQuick 2.0
import utils 1.0

Item {
    id: root
    height: 620

    property var currentString: ""
    property bool useSymbols: false
    property bool useUppercase: false

    property var rows: [
        ["q","w","e","r","t","y","u","i","o","p"],
        ["a","s","d","f","g","h","j","k","l"],
        ["z","x","c","v","b","n","m"]
    ]
    property var symbolRows: [
        ["1","2","3","4","5","6","7","8","9","0"],
        ["(",")","-","@","*","^",":",";","~"],
        ["/","'","\"",".",",","?","!"]
    ]

    function keyPressed(text, symbol) {
        if (useSymbols)
            currentString += symbol
        else
            currentString += text
    }

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.7
    }

    Column {
        y: 20
        width: parent.width
        spacing: 20

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            Repeater {
                model: rows[0]
                Key {
                    text: useUppercase ? modelData.toUpperCase() : modelData
                    symbol: symbolRows[0][index]
                    onClicked: keyPressed(text, symbol)
                }
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            Repeater {
                model: rows[1]
                Key {
                    text: useUppercase ? modelData.toUpperCase() : modelData
                    symbol: symbolRows[1][index]
                    onClicked: keyPressed(text, symbol)
                }
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 45

            Key {
                width: 130
                color: Style.orangeLt
                fade: 0.3
                icon: "shift_" + (useUppercase ? "on" : "off") + "_icon"
                onClicked: useUppercase = !useUppercase
            }

            Row {
                spacing: 10

                Repeater {
                    model: rows[2]
                    Key {
                        text: useUppercase ? modelData.toUpperCase() : modelData
                        symbol: symbolRows[2][index]
                        onClicked: keyPressed(text, symbol)
                    }
                }
            }

            Key {
                width: 130
                color: Style.orangeLt
                fade: 0.3
                icon: "backspace_icon"
                onClicked: currentString = currentString.slice(0, -1)
            }
        }

        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Key {
                width: 150
                color: Style.orangeLt
                fade: 0.3
                icon: "symbols" + (useSymbols ? "" : "_off") + "_icon"
                onClicked: useSymbols = !useSymbols
            }

            Key {
                width: 700
                color: Style.orangeLt
                fade: 0.3
                icon: "space_bar_icon"
                onClicked: keyPressed(" ", " ")
            }

            Key {
                width: 150
                color: Style.orangeLt
                fade: 0.3
                icon: "white_return"
            }
        }
    }
}
