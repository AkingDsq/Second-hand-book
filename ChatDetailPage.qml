import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: chatDetailPage
    property string contactName: "二手书爱好者"
    property string contactAvatar: "qrc:/images/avatar1.png"

    // Header with back button and contact info
    Rectangle {
        id: header
        width: parent.width
        height: 60
        color: "white"

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10

            // Back button
            Rectangle {
                width: 40
                height: 40
                color: "transparent"

                Image {
                    anchors.centerIn: parent
                    source: "qrc:/images/back_arrow.png"
                    width: 20
                    height: 20
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // Go back to messages list
                        console.log("Back to messages list")
                    }
                }
            }

            // Contact info
            RowLayout {
                Layout.fillWidth: true
                spacing: 10

                Rectangle {
                    width: 40
                    height: 40
                    radius: 20

                    Image {
                        anchors.fill: parent
                        source: contactAvatar
                        fillMode: Image.PreserveAspectCrop
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            maskSource: Rectangle {
                                width: 40
                                height: 40
                                radius: 20
                            }
                        }
                    }
                }

                Text {
                    text: contactName
                    font.pixelSize: 16
                    font.bold: true
                }
            }

            // More options
            Rectangle {
                width: 40
                height: 40
                color: "transparent"

                Image {
                    anchors.centerIn: parent
                    source: "qrc:/images/more_options.png"
                    width: 20
                    height: 20
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // Show more options
                        console.log("Show chat options")
                    }
                }
            }
        }

        // Bottom separator
        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: 1
            color: "#E5E5E5"
        }
    }

    // Chat messages area
    ListView {
        id: messagesListView
        anchors.top: header.bottom
        anchors.bottom: inputArea.top
        width: parent.width
        clip: true
        verticalLayoutDirection: ListView.BottomToTop  // Newest messages at bottom
        model: messagesModel
        delegate: MessageDelegate {}
        spacing: 10
    }

    // Input area
    Rectangle {
        id: inputArea
        anchors.bottom: parent.bottom
        width: parent.width
        height: 60
        color: "white"

        // Top separator
        Rectangle {
            anchors.top: parent.top
            width: parent.width
            height: 1
            color: "#E5E5E5"
        }

        RowLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10

            // More input options button
            Rectangle {
                width: 40
                height: 40
                color: "transparent"

                Image {
                    anchors.centerIn: parent
                    source: "qrc:/images/add_attachment.png"
                    width: 24
                    height: 24
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("Add attachment clicked")
                    }
                }
            }

            // Text input
            Rectangle {
                Layout.fillWidth: true
                height: 40
                radius: 20
                color: "#F2F2F2"

                TextInput {
                    id: messageInput
                    anchors.fill: parent
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15
                    verticalAlignment: TextInput.AlignVCenter
                    font.pixelSize: 14
                    clip: true

                    property string placeholderText: "输入消息"

                    Text {
                        text: messageInput.placeholderText
                        color: "#999999"
                        font.pixelSize: 14
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        visible: !messageInput.text && !messageInput.activeFocus
                    }
                }
            }

            // Send button
            Rectangle {
                width: 40
                height: 40
                radius: 20
                color: messageInput.text ? "#FF6633" : "#CCCCCC"

                Text {
                    anchors.centerIn: parent
                    text: "发送"
                    color: "white"
                    font.pixelSize: 12
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (messageInput.text) {
                            // Add new message to model
                            messagesModel.insert(0, {
                                text: messageInput.text,
                                isSent: true,
                                timestamp: "现在"
                            });
                            messageInput.text = "";
                        }
                    }
                }
            }
        }
    }

    // Messages model
    ListModel {
        id: messagesModel

        ListElement {
            text: "请问这本书还在吗？"
            isSent: false
            timestamp: "12:30"
        }

        ListElement {
            text: "在的，没有卖出去"
            isSent: true
            timestamp: "12:32"
        }

        ListElement {
            text: "书的品相怎么样？有破损吗？"
            isSent: false
            timestamp: "12:33"
        }

        ListElement {
            text: "书的品相很好，九成新，没有破损，只是书角有轻微磨损"
            isSent: true
            timestamp: "12:35"
        }
    }
}
