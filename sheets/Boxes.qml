import QtQuick 2.0
import components 1.0
import utils 1.0

Sheet {
    contentHeight: grid.height + grid.y*2

    Grid {
        id: grid

        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        columns: 2
        y: 20

        Box {
            width: 200
            height: 100
        }

        Box {
            width: 200
            height: 100
            shadow: "fill"
        }

        Box {
            width: 200
            height: 100
            shadow: "in"
        }

        Box {
            width: 200
            height: 100
            shadow: "out"
        }

        // Outline
        Box {
            width: 200
            height: 100
            color: Style.yellowViv
        }

        Box {
            width: 200
            height: 100
            color: Style.orangeViv
        }

        Box {
            width: 200
            height: 100
            color: Style.blueLt
        }

        Box {
            width: 200
            height: 100
            color: Style.greenLt
        }

        // Infill
        Box {
            width: 200
            height: 100
            shadow: "fill"
            border: Style.yellowLt
            color: Style.yellowViv
        }

        Box {
            width: 200
            height: 100
            shadow: "fill"
            border: Style.orangeLt
            color: Style.orangeViv
        }

        Box {
            width: 200
            height: 100
            shadow: "fill"
            border: Style.blueLt
            color: Style.blueViv
        }

        Box {
            width: 200
            height: 100
            shadow: "fill"
            border: Style.greenLt
            color: Style.greenViv
        }

        // Inshadow
        Box {
            width: 200
            height: 100
            shadow: "in"
            color: Style.yellowLt
        }

        Box {
            width: 200
            height: 100
            shadow: "in"
            color: Style.orangeViv
        }

        Box {
            width: 200
            height: 100
            shadow: "in"
            color: Style.blueLt
        }

        Box {
            width: 200
            height: 100
            shadow: "in"
            color: Style.greenLt
        }

        // Outshadow
        Box {
            width: 200
            height: 100
            shadow: "out"
            color: Style.yellowLt
        }

        Box {
            width: 200
            height: 100
            shadow: "out"
            color: Style.orangeViv
        }

        Box {
            width: 200
            height: 100
            shadow: "out"
            color: Style.blueLt
        }

        Box {
            width: 200
            height: 100
            shadow: "out"
            color: Style.greenLt
        }
    }
}
