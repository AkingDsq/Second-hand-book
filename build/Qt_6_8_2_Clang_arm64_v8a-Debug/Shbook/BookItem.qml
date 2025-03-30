import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    Layout.fillWidth: true
    Layout.preferredHeight: 220
    radius: 8
    color: "white"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 8

        // Book image
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 130
            color: "#F5F5F5"

            Image {
                id: bookImage
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                source: "qrc:/images/book_placeholder.png"
            }
        }

        // Book title
        Text {
            Layout.fillWidth: true
            text: "高等数学第七版同济大学"
            font.pixelSize: 14
            elide: Text.ElideRight
            maximumLineCount: 1
        }

        // Book description
        Text {
            Layout.fillWidth: true
            text: "全新 有笔记 包邮"
            font.pixelSize: 12
            color: "#666666"
            elide: Text.ElideRight
            maximumLineCount: 1
        }

        // Price and seller info
        RowLayout {
            Layout.fillWidth: true

            Text {
                text: "¥35"
                font.pixelSize: 16
                font.bold: true
                color: "#FF5000"
            }

            Item { Layout.fillWidth: true }

            Text {
                text: "北京"
                font.pixelSize: 12
                color: "#999999"
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Book clicked")
        }
    }
}
