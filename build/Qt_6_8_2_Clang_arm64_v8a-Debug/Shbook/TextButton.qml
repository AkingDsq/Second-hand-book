import QtQuick 2.15

Item{
    // Text button component
    Rectangle {
        id: textButton
        property string text: ""
        property bool isHighlighted: false
        signal clicked

        height: 36
        width: text.length * 15
        color: "transparent"

        Text {
            anchors.centerIn: parent
            text: textButton.text
            font.pixelSize: 16
            color: isHighlighted ? "#FF5000" : "#666666"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: textButton.clicked()
        }
    }
}
