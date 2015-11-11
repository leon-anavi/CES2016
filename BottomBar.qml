/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0
import system 1.0
//import com.pelagicore.qmldevinfo 0.1

Item {
    height: 120

    ShaderEffect {
        anchors.fill: parent
        property color color: "#777"
        property real radius: 40
        opacity: 0.24

        fragmentShader: "
uniform lowp float radius;
uniform lowp float height;
uniform lowp float width;
uniform lowp float qt_Opacity;
uniform lowp vec4 color;
varying highp vec2 qt_TexCoord0;

void main(void) {
    lowp vec2 dist = min(qt_TexCoord0, vec2(1.0) - qt_TexCoord0);
    lowp float xval = smoothstep(0.0, radius, dist.x * width);
    lowp float yval = smoothstep(0.0, radius, dist.y * height);
    gl_FragColor = mix(color, vec4(1.0), sqrt(yval * xval)) * qt_Opacity;
}
        "
    }

    Image {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        source: "images/settings_icon.png"

        MouseArea {
            anchors.fill: parent
            onClicked: System.showSettings = !System.showSettings
        }
    }

//    DevInfo {
//        id: devinfo
//    }

    Image {
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -15
        source: "images/AGL-Logo.png"
        height: 80
        fillMode: Image.PreserveAspectFit

        MouseArea {
            anchors.fill: parent
            onClicked: ipaddr.visible = !ipaddr.visible
        }

        Rectangle {
            id: ipaddr
            color: "#FFFFFF"
            visible: false
            anchors.fill: parent

//            Text {
//                text: "IP: " + (devinfo.ipAddresses.length ? devinfo.ipAddresses.join("\n") : " ")
//                anchors.fill: parent
//            }
        }
    }

    VolumeControl {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 40
    }
}
