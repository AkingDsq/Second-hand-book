import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: messagesPage
    title: "消息"

    // Background color
    Rectangle {
        anchors.fill: parent
        color: "#F8F8F8"
    }

    // Search box at the top
    Rectangle {
        id: searchBox
        width: parent.width
        height: 50
        color: "white"

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 0.9
            height: 36
            radius: 18
            color: "#F2F2F2"

            Row {
                anchors.centerIn: parent
                spacing: 10

                Image {
                    id: searchIcon
                    source: "qrc:/images/search_icon.png"  // Search icon
                    width: 20
                    height: 20
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    text: "搜索聊天记录"
                    font.pixelSize: 14
                    color: "#999999"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // Open search functionality
                    console.log("Search clicked")
                }
            }
        }
    }

    // System notifications
    Rectangle {
        id: systemNotifications
        anchors.top: searchBox.bottom
        width: parent.width
        height: 60
        color: "white"

        Row {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            spacing: 15

            Rectangle {
                width: 45
                height: 45
                radius: 22.5
                color: "#FFE4B5"

                Image {
                    anchors.centerIn: parent
                    source: "qrc:/images/system_notification.png"
                    width: 25
                    height: 25
                }
            }

            Column {
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    text: "系统通知"
                    font.pixelSize: 16
                    font.bold: true
                }

                Text {
                    text: "请及时查看交易通知"
                    font.pixelSize: 12
                    color: "#999999"
                }
            }
        }

        // Notification badge
        Rectangle {
            visible: true  // Set to false when no notifications
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            width: 20
            height: 20
            radius: 10
            color: "red"

            Text {
                anchors.centerIn: parent
                text: "2"
                color: "white"
                font.pixelSize: 12
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("System notifications clicked")
            }
        }
    }

    // Chat list
    ListView {
        id: chatListView
        anchors.top: systemNotifications.bottom
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        width: parent.width
        clip: true
        model: chatModel
        delegate: ChatItemDelegate {}

        // Separator line between items
        section.property: "date"
        section.delegate: Rectangle {
            width: parent.width
            height: 30
            color: "#F8F8F8"

            Text {
                anchors.centerIn: parent
                text: section
                font.pixelSize: 12
                color: "#999999"
            }
        }
    }

    ListModel {
        id: chatModel

        ListElement {
            name: "二手书爱好者"
            avatar: "qrc:/images/avatar1.png"
            lastMessage: "请问这本书还在吗？"
            time: "12:30"
            unreadCount: 1
            date: "今天"
        }

        ListElement {
            name: "文学书籍爱好者"
            avatar: "qrc:/images/avatar2.png"
            lastMessage: "好的，我明天可以去拿书。"
            time: "11:45"
            unreadCount: 0
            date: "今天"
        }

        ListElement {
            name: "古典文学收藏"
            avatar: "qrc:/images/avatar3.png"
            lastMessage: "价格可以再优惠一点吗？"
            time: "昨天"
            unreadCount: 2
            date: "昨天"
        }

        ListElement {
            name: "教科书交易"
            avatar: "qrc:/images/avatar4.png"
            lastMessage: "我对这本计算机科学书感兴趣"
            time: "昨天"
            unreadCount: 0
            date: "昨天"
        }

        ListElement {
            name: "外语书籍"
            avatar: "qrc:/images/avatar5.png"
            lastMessage: "这本英语原版还有库存吗？"
            time: "前天"
            unreadCount: 0
            date: "前天"
        }
    }
}
