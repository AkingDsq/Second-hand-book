import QtQuick 2.15

// Navigation button component for the tab bar
Rectangle {
    id: navButton
    property string iconSource
    property string text
    property bool isActive: false
    signal clicked

    color: "transparent"

    Column {
        anchors.centerIn: parent
        spacing: 2

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            source: iconSource
            width: 24
            height: 24
            sourceSize: Qt.size(24, 24)
            opacity: isActive ? 1.0 : 0.7
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: navButton.text
            font.pixelSize: 12
            color: isActive ? "#FF5000" : "#999999"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: navButton.clicked()
    }
}
