import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// Custom component for chat list items
Rectangle {
    id: chatItem
    width: ListView.view.width
    height: 80
    color: "white"

    // Bottom separator
    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 1
        color: "#F2F2F2"
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 15

        // Avatar
        Rectangle {
            id: avatarContainer
            width: 60
            height: 60
            radius: 30
            Layout.alignment: Qt.AlignVCenter

            Image {
                id: avatar
                source: model.avatar
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                layer.enabled: true
                // layer.effect: OpacityMask {
                //     maskSource: Rectangle {
                //         width: avatarContainer.width
                //         height: avatarContainer.height
                //         radius: avatarContainer.radius
                //     }
                // }
            }
        }

        // Message content
        ColumnLayout {
            spacing: 5
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter

            // Name and time row
            RowLayout {
                Layout.fillWidth: true
                spacing: 5

                Text {
                    id: nameText
                    text: model.name
                    font.pixelSize: 16
                    font.bold: true
                    Layout.fillWidth: true
                    elide: Text.ElideRight
                    maximumLineCount: 1
                }

                Text {
                    id: timeText
                    text: model.time
                    font.pixelSize: 12
                    color: "#999999"
                    horizontalAlignment: Text.AlignRight
                }
            }

            // Message preview
            Text {
                id: messageText
                text: model.lastMessage
                font.pixelSize: 14
                color: "#666666"
                Layout.fillWidth: true
                elide: Text.ElideRight
                maximumLineCount: 1
            }
        }

        // Unread badge
        Rectangle {
            id: unreadBadge
            visible: model.unreadCount > 0
            width: 20
            height: 20
            radius: 10
            color: "red"
            Layout.alignment: Qt.AlignTop | Qt.AlignRight

            Text {
                anchors.centerIn: parent
                text: model.unreadCount
                color: "white"
                font.pixelSize: 12
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            // Open chat conversation
            console.log("Chat with " + model.name + " clicked")
            // Navigate to chat detail page could be implemented here
        }
    }
}
