/* Copyright (C) 2015, Pioneer Corporation. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import utils 1.0

ListView {
    id: listView

    property var listTop: currentIndex === -1 ? songsModel.get(0) : songsModel.get(currentIndex)
    property string file: listTop.filepath ? listTop.filepath : "song.mp3"
    property string image: listTop.albumart ? listTop.albumart : "images/cover_album.png"

    function listControl(cmd) {
        if("PREVIOUS" === cmd){
            listView.decrementCurrentIndex()
        }else if("NEXT" === cmd){
            listView.incrementCurrentIndex()
        }
        listView.currentItem.clicked()
    }

    Rectangle {
        anchors.top: parent.top
        anchors.right: parent.right
        width: songsList.width - 102
        height: 2
        color: Style.blueViv
    }

    width:800
    height: 102*7+spacing*6
    spacing: 5
    snapMode: ListView.SnapToItem
    model: SongsModel {id:songsModel}
    delegate:
        ListItem {
        width: parent.width
        onClicked: listView.currentIndex = index
    }
}
