import QtQuick 2.0

Item {
    height: 100
    width: childrenRect.width

    property alias value: shader.value

    FontLoader {
        source: "fontawesome-webfont.ttf"
    }

    Row {
        spacing: 28

        Text {
            anchors.verticalCenter: parent.verticalCenter
            font.family: "FontAwesome"
            font.pixelSize: 30
            color: "white"
            text: "\uf068"

            MouseArea {
                anchors.fill: parent
                onClicked: shader.value = Math.max(shader.value - 0.1, 0.0)
            }
        }

        ShaderEffect {
            id: shader
            width: 85
            height: 100

            property color bgColor: "#333"
            property color fgColor: "#b2f0ff"
            property real value: 0.5

            fragmentShader: "
uniform lowp float qt_Opacity;
uniform lowp float value;
uniform lowp vec4 bgColor;
uniform lowp vec4 fgColor;
varying highp vec2 qt_TexCoord0;

void main(void) {
    lowp float x = min(qt_TexCoord0.x, 1.0 - qt_TexCoord0.x);
    lowp float y = min(qt_TexCoord0.y, 1.0 - qt_TexCoord0.y);
    lowp float c = y - 0.5 * (0.5 - x);
    lowp float outside = smoothstep(0.0, 0.01, c);
    lowp float rim = smoothstep(0.1, 0.11, c - step(x, 0.101));
    lowp float inside = smoothstep(0.125, 0.135, c - step(x, 0.125));

    lowp vec4 color = mix(bgColor, fgColor, step(qt_TexCoord0.x, value));
    color = mix(color, bgColor, inside * 0.8);
    color = mix(color, vec4(1.0), (rim - inside) * 0.6);

    gl_FragColor = mix(vec4(0.0), color, outside) * qt_Opacity;
}
            "

            MouseArea {
                anchors.fill: parent
                onPositionChanged: {
                    shader.value = Math.min(Math.max(mouse.x / width, 0.0), 1.0)
                }
            }

            Text {
                anchors.centerIn: parent
                font.family: "Source Sans Pro"
                font.weight: Font.Bold
                font.pixelSize: 30
                color: "white"
                text: Math.round(shader.value * 100)
            }
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            font.family: "FontAwesome"
            font.pixelSize: 30
            color: "white"
            text: "\uf067"

            MouseArea {
                anchors.fill: parent
                onClicked: shader.value = Math.min(shader.value + 0.1, 1.0)
            }
        }
    }
}
