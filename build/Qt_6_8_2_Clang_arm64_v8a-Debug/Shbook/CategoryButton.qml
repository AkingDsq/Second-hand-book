import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true

    property string icon: ""
    property string text: ""

    ColumnLayout {
        anchors.fill: parent
        spacing: 5

        Rectangle {
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            Layout.alignment: Qt.AlignHCenter
            radius: 20
            color: "#F5F5F5"

            Image {
                anchors.centerIn: parent
                source: root.icon
                width: 24
                height: 24
            }
        }

        Text {
            Layout.alignment: Qt.AlignHCenter
            text: root.text
            font.pixelSize: 12
            color: "#333333"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Category clicked:", root.text)
        }
    }
}
