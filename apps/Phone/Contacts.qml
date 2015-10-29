/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import QtQuick.Layouts 1.1
import components 1.0
import utils 1.0
import "models"

Item {
    anchors.fill: parent

    AwesomeIcon {
        ucKey: "\uf00d"
        iconSize: 30
        iconColor: "#66ffffff"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 10
        anchors.topMargin: -50

        MouseArea {
            anchors.fill: parent
            onClicked: PhoneModel.view = "dial"
        }
    }

    Rectangle {
        id: contactsPanel
        width: parent.width/3
        height: parent.height
        color: "#cc333333"

        Item {
            anchors.fill: parent
            anchors.margins:20

            ColumnLayout {
                spacing: 10
                width: parent.width

                Label {
                    id: sortLabel
                    text: "sorting"
                }

                Rectangle {
                    color: "black"
                    height: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                }

                ButtonLabel {
                    id: allContacts
                    buttonText: "all contacts"
                    ucKey: "\uf0c0"
                    onClicked: contactsGrid.model = ContactsModel
                }

                ButtonLabel {
                    id: favorites
                    buttonText: "favorites"
                    ucKey: "\uf005"
                    iconColor: "#53b5ce"
                    onClicked: contactsGrid.model = FavoritesModel
                }

                Label {
                    id: viewByLabel
                    text: "view by"
                }

                Rectangle {
                    color: "black"
                    height: 10
                    anchors.left: parent.left
                    anchors.right: parent.right
                }

                ButtonLabel {
                    id: listView
                    buttonText: "list"
                    ucKey: "\uf0ca"
                    iconColor: "#53b5ce"
                }

                ButtonLabel {
                    id: gridView
                    buttonText: "grid"
                    ucKey: "\uf00a"
                }
            }
        }
    }

    GridView {
        id: contactsGrid
        anchors.left: contactsPanel.right
        anchors.right: parent.right
        anchors.leftMargin: 30
        anchors.rightMargin: 10
        height: parent.height
        cellWidth: contactsGrid.width / 3
        cellHeight: 300

        model: ContactsModel

        delegate: Item {
            width: contactsGrid.cellWidth
            height: contactsGrid.cellHeight

            Column {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "images/contact_picture_blue.png"
                }

                Text {
                    height: 60
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 30
                    font.weight: Font.Bold
                    font.family: "Source Sans Pro"
                    text: model.name
                }

                ButtonLabel {
                    ucKey: "\uf095"
                    iconColor: Style.greenViv
                    fontColor: Style.blueViv
                    fontSize: 24
                    buttonText: model.phone
                }

                ButtonLabel {
                    ucKey: "\uf095"
                    iconColor: Style.greenViv
                    fontColor: Style.blueViv
                    fontSize: 24
                    buttonText: model.mobile
                }

                ButtonLabel {
                    ucKey: "\uf095"
                    iconColor: Style.greenViv
                    fontColor: Style.blueViv
                    fontSize: 24
                    buttonText: model.work
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    PhoneModel.dial(model.phone)
                }
            }
        }
    }
}
