import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// Custom component for individual chat messages
Item {
    id: messageDelegate
    width: ListView.view.width
    height: messageBubble.height + 30  // Extra space for timestamp

    // Property to determine message alignment
    property bool alignRight: model.isSent

    // Timestamp text
    Text {
        id: timestampText
        text: model.timestamp
        font.pixelSize: 12
        color: "#999999"
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
    }

    // Message bubble
    Rectangle {
        id: messageBubble
        width: Math.min(messageText.implicitWidth + 30, parent.width * 0.7)  // Max width with padding
        height: messageText.implicitHeight + 20  // Height based on content
        radius: 15
        color: alignRight ? "#C8EBC5" : "white"  // Green for sent, white for received
        border.color: alignRight ? "transparent" : "#E5E5E5"
        anchors.top: timestampText.bottom
        anchors.topMargin: 5
        anchors.right: alignRight ? parent.right : undefined
        anchors.rightMargin: alignRight ? 15 : 0
        anchors.left: alignRight ? undefined : parent.left
        anchors.leftMargin: alignRight ? 0 : 15

        // Message text
        Text {
            id: messageText
            text: model.text
            font.pixelSize: 16
            color: "#333333"
            anchors.centerIn: parent
            width: parent.width - 20  // Padding
            wrapMode: Text.Wrap
        }

        // Message status (for sent messages)
        Row {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.bottomMargin: 5
            spacing: 2
            visible: alignRight

            Text {
                text: "已读"  // "Read" status
                font.pixelSize: 10
                color: "#999999"
                anchors.bottom: parent.bottom
                visible: alignRight
            }
        }
    }
}
