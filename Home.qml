import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "./"

ApplicationWindow {
    id: window
    visible: true
    width: 360
    height: 640
    title: "二手书交易平台"

    // Custom font loader
    FontLoader {
        id: customFont
        source: "qrc:/fonts/PingFang-SC-Regular.ttf"
    }

    // Main container
    StackLayout {
        id: pageStack
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        // Home Page
        HomePage {}

        // Publish Page
        PublishPage {}

        // Messages Page
        MessagesPage {}

        // My Profile Page
        ProfilePage {}
    }

    // Bottom navigation bar
    TabBar {
        id: tabBar
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 50
        currentIndex: pageStack.currentIndex
        background: Rectangle {
            color: "white"
            Rectangle {
                width: parent.width
                height: 1
                color: "#E0E0E0"
                anchors.top: parent.top
            }
        }

        TabButton {
            height: parent.height
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 2
                // Image {
                //     Layout.alignment: Qt.AlignHCenter
                //     source: tabBar.currentIndex === 0 ? "qrc:/images/home_active.png" : "qrc:/images/home.png"
                //     width: 24
                //     height: 24
                // }

                Item {
                    width: 24
                    height: 24
                    Text {
                        anchors.centerIn: parent
                        text: "🏡"
                    }
                }
                Label {
                    text: "主页"
                    color: tabBar.currentIndex === 0 ? "#FE7D3B" : "#999999"
                    font.pixelSize: 12
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }

        TabButton {
            height: parent.height
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 2
                // Image {
                //     Layout.alignment: Qt.AlignHCenter
                //     source: tabBar.currentIndex === 1 ? "qrc:/images/publish_active.png" : "qrc:/images/publish.png"
                //     width: 24
                //     height: 24
                // }
                Item {
                    width: 24
                    height: 24
                    Text {
                        anchors.centerIn: parent
                        text: "📤️"
                    }
                }
                Label {
                    text: "发布"
                    color: tabBar.currentIndex === 1 ? "#FE7D3B" : "#999999"
                    font.pixelSize: 12
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }

        TabButton {
            height: parent.height
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 2
                // Image {
                //     Layout.alignment: Qt.AlignHCenter
                //     source: tabBar.currentIndex === 2 ? "qrc:/images/message_active.png" : "qrc:/images/message.png"
                //     width: 24
                //     height: 24
                // }
                Item {
                    width: 24
                    height: 24
                    Text {
                        anchors.centerIn: parent
                        text: "✉️"
                    }
                }
                Label {
                    text: "消息"
                    color: tabBar.currentIndex === 2 ? "#FE7D3B" : "#999999"
                    font.pixelSize: 12
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }

        TabButton {
            height: parent.height
            ColumnLayout {
                anchors.centerIn: parent
                spacing: 2
                // Image {
                //     Layout.alignment: Qt.AlignHCenter
                //     source: tabBar.currentIndex === 3 ? "qrc:/images/profile_active.png" : "qrc:/images/profile.png"
                //     width: 24
                //     height: 24
                // }
                Item {
                    width: 24
                    height: 24
                    Text {
                        anchors.centerIn: parent
                        text: "👤"
                    }
                }
                Label {
                    text: "我的"
                    color: tabBar.currentIndex === 3 ? "#FE7D3B" : "#999999"
                    font.pixelSize: 12
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
}
