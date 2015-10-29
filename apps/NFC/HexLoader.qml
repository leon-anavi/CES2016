import QtQuick 2.0

Item {
    id: hexLoader
    width: 504
    height: 437

    onVisibleChanged: animation.restart()

    Image {
        id: hexLoaderGraphic1
        source: "images/hex-loader-green.png"
        width: 504
        height: 437
    }

    Image {
        id: hexLoaderGraphic2
        source: "images/hex-loader-blue.png"
        width: 504
        height: 437
    }

    Image {
        id: hexLoaderGraphic3
        source: "images/hex-loader-green.png"
        width: 504
        height: 437
    }

    Image {
        id: hexLoaderGraphic4
        source: "images/hex-loader-green.png"
        width: 504
        height: 437
    }

    ParallelAnimation {
        id: animation
        loops: Animation.Infinite
        running: true

        NumberAnimation {
            target: hexLoaderGraphic1
            property: "scale"
            from: 0
            to: 0.8
            duration: 1200
        }

        NumberAnimation {
            target: hexLoaderGraphic1
            property: "opacity"
            from: 0
            to: 0.7
            duration: 1200
        }

        NumberAnimation {
            target: hexLoaderGraphic1
            property: "opacity"
            from: 0.7
            to: 0
            duration: 1200
        }

        NumberAnimation {
            target: hexLoaderGraphic2
            property: "scale"
            from: 0
            to: 0.8
            duration: 800
        }

        NumberAnimation {
            target: hexLoaderGraphic2
            property: "opacity"
            from: 0
            to: 0.5
            duration: 800
        }

        NumberAnimation {
            target: hexLoaderGraphic2
            property: "opacity"
            from: 0.5
            to: 0
            duration: 800
        }

        NumberAnimation {
            target: hexLoaderGraphic3
            property: "scale"
            from: 0
            to: 0.2
            duration: 700
        }

        NumberAnimation {
            target: hexLoaderGraphic3
            property: "opacity"
            from: 0
            to: 1
            duration: 700
        }

        NumberAnimation {
            target: hexLoaderGraphic3
            property: "opacity"
            from: 1
            to: 0
            duration: 700
        }

        NumberAnimation {
            target: hexLoaderGraphic4
            property: "scale"
            from: 0
            to: 1
            duration: 900
        }

        NumberAnimation {
            target: hexLoaderGraphic4
            property: "opacity"
            from: 0
            to: 0.2
            duration: 900
        }

        NumberAnimation {
            target: hexLoaderGraphic4
            property: "opacity"
            from: 0.2
            to: 0
            duration: 900
        }

    }

    Text {
        id: searchingText
        text: qsTr("Searching")
        font.family: "Source Sans Pro"
        font.pointSize: 30
        color: "#FFFFFF"
        font.letterSpacing: -0.5
        anchors.centerIn: parent

        SequentialAnimation {
            loops: Animation.Infinite
            running: true

            NumberAnimation {
                target: searchingText
                property: "opacity"
                from: 0.2
                to: 1
                duration: 1000
            }

            NumberAnimation {
                target: searchingText
                property: "opacity"
                from: 1
                to: 0.2
                duration: 1000
            }
        }
    }
}
