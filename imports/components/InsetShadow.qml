import QtQuick 2.0    

ShaderEffect {
    anchors.fill: parent
    property color color
    property real radius: 100
    property real border: 20

    fragmentShader: "
uniform lowp float radius;
uniform lowp float border;
uniform lowp float height;
uniform lowp float width;
uniform lowp float qt_Opacity;
uniform lowp vec4 color;
varying highp vec2 qt_TexCoord0;

void main(void) {
    lowp vec2 dist = min(qt_TexCoord0, vec2(1.0) - qt_TexCoord0);
    // Border shadow
    lowp float xval = smoothstep(0.0, border, dist.x * width);
    lowp float yval = smoothstep(0.0, border, dist.y * height);
    lowp float borderVal = sqrt(yval * xval) * 0.5 + 0.5;
    // Inner shadow
    xval = smoothstep(0.0, radius, dist.x * width);
    yval = smoothstep(0.0, radius, dist.y * width);
    lowp float innerVal = sqrt(yval * xval) * 0.5 + 0.5;

    lowp vec4 innerColor = mix(vec4(0.0, 0.0, 0.0, 0.5), color, innerVal);
    lowp vec4 borderColor = mix(vec4(0.0, 0.0, 0.0, 1.0), innerColor, borderVal);
    gl_FragColor = borderColor * qt_Opacity;
}
    "
}
