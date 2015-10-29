import QtQuick 2.0
import QtMultimedia 5.0 as Media

Item {
    width: 900
    height: childrenRect.height

    property alias source: player.source

    Media.MediaPlayer {
        id: player
    }
    
    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20

        SongInfo {
            anchors.left: parent.left
            metadata: player.metaData
        }

        PositionSlider {
            width: parent.width
            value: player.position
            max: player.duration
        }

        PlayerControls {
            anchors.horizontalCenter: parent.horizontalCenter
            player: player
        }
    }
}
