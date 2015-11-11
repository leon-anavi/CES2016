/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.3
import components 1.0
import system 1.0
import utils 1.0
import "models"

SettingsView {
    id: root

    name: "rvi"
    description: "Remote Vehicle Interaction"

    property var tabMap : [
        {"title": "Setup", "qmlComponent": setup },
        { "title" : "Application", "qmlComponent" : application }
    ]

    property int selectedIndex: 0

    Item {
        y: 300
        width: parent.width
        Column {
            width: parent.width
            Row {
                spacing: 15
                width: root.width
                Item {
                    width: 25
                    height: 10
                }

                Repeater {
                    model: root.tabMap.length
                    Rectangle {
                        id: item
                        x: 40
                        implicitWidth: tabText.width + 40
                        implicitHeight: 70
                        color: root.selectedIndex === index ? "#222" : "#181818"

                        Text {
                            id: tabText
                            x: 20
                            y: 5
                            font.family: "Source Sans Pro"
                            font.pixelSize: 50
                            color: Style.orangeViv
                            text: root.tabMap[index].title
                            opacity: root.selectedIndex === index ? 1 : 0.7
                        }
                        MouseArea  {
                            anchors.fill: parent
                            onClicked: root.selectedIndex = index
                        }
                    }
                }
            }

            Loader {
                id: content
                width: parent.width
                height: item.height
                sourceComponent: root.tabMap[root.selectedIndex].qmlComponent
                onLoaded: content.item.visible = true
            }
        }
    }

    onSelectedIndexChanged: {
        if (tabMap[selectedIndex].qmlComponent === setup ) {
            if (visible) {
                System.showKeyboard = visible
                keyboard.currentString = RVIModel.vinNumber
            }
        } else {
            System.showKeyboard = false
            keyboard.currentString = RVIModel.vinNumber
        }
    }

    Component {
        id: setup

        RVITab {
            onVisibleChanged: {
                System.showKeyboard = visible
                keyboard.currentString = RVIModel.vinNumber
            }

            Item {
                y: 76
                width: parent.width
                height: childrenRect.height

                Row {
                    x: 90
                    spacing: 20

                    Text {
                        font.family: "Source Sans Pro"
                        font.pixelSize: 40
                        color: Style.orangeViv
                        text: "VIN NUMBER"
                    }

                    Rectangle {
                        y: -25
                        width: 545
                        height: 100
                        color: "#111"

                        Text {
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.family: "Source Sans Pro"
                            font.pixelSize: 30
                            font.weight: Font.Bold
                            elide: Text.ElideLeft
                            color: "white"
                            text: keyboard.currentString
                        }
                    }
                }

                Rectangle {
                    y: 120
                    anchors.right: parent.right
                    anchors.rightMargin: 60
                    height: 60
                    width: 130
                    border.width: 1
                    border.color: "white"
                    color: "#111"

                    Text {
                        anchors.centerIn: parent
                        font.family: "Source Sans Pro"
                        font.pixelSize: 30
                        font.weight: Font.Bold
                        color: "white"
                        text: "submit"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: RVIModel.vinNumber = keyboard.currentString
                    }
                }

                Column {
                    y: 120
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "Source Sans Pro"
                        font.pixelSize: 30
                        color: Style.orangeViv
                        text: "VIN NUMBER QR CODE"
                    }

                    Image {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 300
                        height: 300
                        source: "images/qrcode.png"
                    }
                }
            }
        }
    }

    Component {
        id: application
        RVITab {
            ListView {
                x: 100
                y: 50
                width: 724
                height: count * 80
                interactive: false

                model: RVIModel.appStates

                delegate: Item {
                    width: parent.width
                    height: 80

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        font.family: "Source Sans Pro"
                        font.pixelSize: 50
                        color: Style.orangeViv
                        text: model.name
                    }

                    HexSwitch {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        value: model.state
                    }
                }
            }
        }
    }
}
