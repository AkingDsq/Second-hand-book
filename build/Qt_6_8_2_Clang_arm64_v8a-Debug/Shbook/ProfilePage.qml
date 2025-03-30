import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: profilePage
    title: "我的"

    // Page background
    Rectangle {
        anchors.fill: parent
        color: "#F8F8F8"
    }

    // Scrollable content
    ScrollView {
        anchors.fill: parent
        contentWidth: parent.width
        ScrollBar.vertical.policy: ScrollBar.AsNeeded
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 0

            // User profile header section with improved styling
            Rectangle {
                Layout.fillWidth: true
                height: 180
                color: "#FF6633"

                // User info container
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 15

                    // Profile avatar with enhanced styling
                    Rectangle {
                        width: 80
                        height: 80
                        radius: 40
                        color: "white"

                        Rectangle {
                            anchors.centerIn: parent
                            width: 74
                            height: 74
                            radius: 37
                            color: "#F2F2F2"

                            Text {
                                anchors.centerIn: parent
                                text: "😊"
                                font.pixelSize: 36
                            }
                        }
                    }

                    // User details with better typography
                    Column {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        spacing: 8

                        // Username with drop shadow for better readability
                        Text {
                            text: "AkingDsq"
                            font.pixelSize: 22
                            font.bold: true
                            color: "white"

                            Rectangle {
                                z: -1
                                anchors.fill: parent
                                anchors.margins: -2
                                color: "transparent"
                                border.color: Qt.rgba(0, 0, 0, 0.1)
                                border.width: 1
                                radius: 2
                                visible: false
                            }
                        }

                        // User level with better visualization
                        Row {
                            spacing: 8

                            Rectangle {
                                width: 60
                                height: 22
                                radius: 11
                                color: Qt.rgba(1, 1, 1, 0.3)

                                Text {
                                    anchors.centerIn: parent
                                    text: "Lv.3"
                                    font.pixelSize: 12
                                    color: "white"
                                }
                            }

                            Rectangle {
                                width: 80
                                height: 22
                                radius: 11
                                color: Qt.rgba(1, 1, 1, 0.3)

                                Text {
                                    anchors.centerIn: parent
                                    text: "信用良好"
                                    font.pixelSize: 12
                                    color: "white"
                                }
                            }
                        }

                        // User bio
                        Text {
                            text: "用户简介：热爱阅读的书籍收藏家"
                            font.pixelSize: 14
                            color: "white"
                            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            width: parent.width
                        }
                    }

                    // Settings button
                    Rectangle {
                        width: 36
                        height: 36
                        radius: 18
                        color: Qt.rgba(1, 1, 1, 0.2)

                        Text {
                            anchors.centerIn: parent
                            text: "⚙️"
                            font.pixelSize: 16
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Open settings")
                            }
                        }
                    }
                }

                // User stats row with better styling
                Rectangle {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    height: 60
                    color: Qt.rgba(1, 1, 1, 0.1)

                    // Stats container with evenly distributed items
                    Row {
                        anchors.fill: parent

                        // Following
                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            color: "transparent"

                            Column {
                                anchors.centerIn: parent
                                spacing: 5

                                Text {
                                    text: "128"
                                    font.pixelSize: 18
                                    font.bold: true
                                    color: "white"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                Text {
                                    text: "关注"
                                    font.pixelSize: 14
                                    color: "white"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("View following")
                                }
                            }
                        }

                        // Vertical separator
                        Rectangle {
                            width: 1
                            height: parent.height * 0.5
                            color: Qt.rgba(1, 1, 1, 0.3)
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        // Followers
                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            color: "transparent"

                            Column {
                                anchors.centerIn: parent
                                spacing: 5

                                Text {
                                    text: "85"
                                    font.pixelSize: 18
                                    font.bold: true
                                    color: "white"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                Text {
                                    text: "粉丝"
                                    font.pixelSize: 14
                                    color: "white"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("View followers")
                                }
                            }
                        }

                        // Vertical separator
                        Rectangle {
                            width: 1
                            height: parent.height * 0.5
                            color: Qt.rgba(1, 1, 1, 0.3)
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        // Likes
                        Rectangle {
                            width: parent.width / 3
                            height: parent.height
                            color: "transparent"

                            Column {
                                anchors.centerIn: parent
                                spacing: 5

                                Text {
                                    text: "542"
                                    font.pixelSize: 18
                                    font.bold: true
                                    color: "white"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                Text {
                                    text: "获赞"
                                    font.pixelSize: 14
                                    color: "white"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("View likes")
                                }
                            }
                        }
                    }
                }
            }

            // My Trades section with fixed grid layout
            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 10
                height: 180
                color: "white"

                // Section title with improved styling
                Item {
                    id: tradesSectionTitle
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 50

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: "我的交易"
                        font.pixelSize: 18
                        font.bold: true
                        color: "#333333"
                    }

                    // Subtle bottom separator
                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 1
                        color: "#F5F5F5"
                    }
                }

                // Fixed grid using Row instead of GridLayout for even distribution
                Row {
                    anchors.top: tradesSectionTitle.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 10

                    // Published items - exactly 1/4 width
                    Item {
                        width: parent.width / 4
                        height: parent.height

                        Column {
                            anchors.centerIn: parent
                            spacing: 8

                            Rectangle {
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: 55
                                height: 55
                                radius: 27.5
                                color: "#F8F8F8"
                                border.color: "#F0F0F0"
                                border.width: 1

                                Text {
                                    anchors.centerIn: parent
                                    text: "📚"
                                    font.pixelSize: 24
                                }
                            }

                            Text {
                                text: "我发布的"
                                font.pixelSize: 14
                                color: "#666666"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Text {
                                text: "12"
                                font.pixelSize: 12
                                color: "#999999"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("View published items")
                            }
                        }
                    }

                    // Sold items - exactly 1/4 width
                    Item {
                        width: parent.width / 4
                        height: parent.height

                        Column {
                            anchors.centerIn: parent
                            spacing: 8

                            Rectangle {
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: 55
                                height: 55
                                radius: 27.5
                                color: "#F8F8F8"
                                border.color: "#F0F0F0"
                                border.width: 1

                                Text {
                                    anchors.centerIn: parent
                                    text: "💰"
                                    font.pixelSize: 24
                                }
                            }

                            Text {
                                text: "我卖出的"
                                font.pixelSize: 14
                                color: "#666666"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Text {
                                text: "8"
                                font.pixelSize: 12
                                color: "#999999"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("View sold items")
                            }
                        }
                    }

                    // Purchased items - exactly 1/4 width
                    Item {
                        width: parent.width / 4
                        height: parent.height

                        Column {
                            anchors.centerIn: parent
                            spacing: 8

                            Rectangle {
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: 55
                                height: 55
                                radius: 27.5
                                color: "#F8F8F8"
                                border.color: "#F0F0F0"
                                border.width: 1

                                Text {
                                    anchors.centerIn: parent
                                    text: "🛒"
                                    font.pixelSize: 24
                                }
                            }

                            Text {
                                text: "我买过的"
                                font.pixelSize: 14
                                color: "#666666"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Text {
                                text: "15"
                                font.pixelSize: 12
                                color: "#999999"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("View purchased items")
                            }
                        }
                    }

                    // Reviews - exactly 1/4 width
                    Item {
                        width: parent.width / 4
                        height: parent.height

                        Column {
                            anchors.centerIn: parent
                            spacing: 8

                            Rectangle {
                                anchors.horizontalCenter: parent.horizontalCenter
                                width: 55
                                height: 55
                                radius: 27.5
                                color: "#F8F8F8"
                                border.color: "#F0F0F0"
                                border.width: 1

                                Text {
                                    anchors.centerIn: parent
                                    text: "⭐"
                                    font.pixelSize: 24
                                }
                            }

                            Text {
                                text: "评价"
                                font.pixelSize: 14
                                color: "#666666"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }

                            Text {
                                text: "23"
                                font.pixelSize: 12
                                color: "#999999"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("View reviews")
                            }
                        }
                    }
                }
            }

            // Browsing history with enhanced styling
            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 10
                height: 240
                color: "white"

                // Section header with "more" option
                Item {
                    id: historySectionHeader
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 50

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: "浏览历史"
                        font.pixelSize: 18
                        font.bold: true
                        color: "#333333"
                    }

                    Text {
                        anchors.right: parent.right
                        anchors.rightMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: "更多 >"
                        font.pixelSize: 14
                        color: "#999999"

                        MouseArea {
                            anchors.fill: parent
                            anchors.margins: -5
                            onClicked: {
                                console.log("View all history")
                            }
                        }
                    }

                    // Subtle bottom separator
                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 1
                        color: "#F5F5F5"
                    }
                }

                // History items - horizontal list with improved styling
                ListView {
                    id: historyList
                    anchors.top: historySectionHeader.bottom
                    anchors.topMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 15
                    anchors.bottomMargin: 15
                    orientation: ListView.Horizontal
                    spacing: 12
                    clip: true
                    model: historyModel
                    delegate: historyDelegate

                    // Add subtle scroll indicator
                    ScrollBar.horizontal: ScrollBar {
                        policy: ScrollBar.AsNeeded
                    }
                }

                // History items model with better data
                ListModel {
                    id: historyModel

                    ListElement {
                        bookTitle: "红楼梦"
                        bookCover: ""
                        price: "¥25"
                        coverColor: "#FFE4E1"  // Light red
                    }

                    ListElement {
                        bookTitle: "Java编程思想"
                        bookCover: ""
                        price: "¥45"
                        coverColor: "#E6F3FF"  // Light blue
                    }

                    ListElement {
                        bookTitle: "哈利波特全集"
                        bookCover: ""
                        price: "¥88"
                        coverColor: "#F0FFF0"  // Light green
                    }

                    ListElement {
                        bookTitle: "深入理解计算机系统"
                        bookCover: ""
                        price: "¥69"
                        coverColor: "#E6E6FA"  // Lavender
                    }

                    ListElement {
                        bookTitle: "活着"
                        bookCover: ""
                        price: "¥18"
                        coverColor: "#FFF8DC"  // Light goldenrod
                    }

                    ListElement {
                        bookTitle: "三体"
                        bookCover: ""
                        price: "¥42"
                        coverColor: "#E0FFFF"  // Light cyan
                    }
                }

                // Enhanced history item delegate
                Component {
                    id: historyDelegate

                    Item {
                        width: 110
                        height: 170

                        Column {
                            anchors.fill: parent
                            spacing: 8

                            // Book cover with color background
                            Rectangle {
                                width: 100
                                height: 130
                                radius: 6
                                color: model.coverColor

                                Rectangle {
                                    anchors.centerIn: parent
                                    width: 50
                                    height: 70
                                    radius: 3
                                    color: Qt.lighter(model.coverColor, 1.2)
                                    border.color: Qt.darker(model.coverColor, 1.1)
                                    border.width: 1

                                    Text {
                                        anchors.centerIn: parent
                                        text: "📖"
                                        font.pixelSize: 28
                                    }
                                }
                            }

                            // Book title
                            Text {
                                width: 100
                                text: model.bookTitle
                                font.pixelSize: 13
                                color: "#333333"
                                elide: Text.ElideRight
                                maximumLineCount: 1
                            }

                            // Price
                            Text {
                                text: model.price
                                font.pixelSize: 12
                                color: "#FF6633"
                                font.bold: true
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Selected book: " + model.bookTitle)
                            }
                        }
                    }
                }
            }

            // Tools and settings section with fixed grid layout
            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 10
                height: 280
                color: "white"

                // Section title with improved styling
                Item {
                    id: toolsSectionTitle
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 50

                    Text {
                        anchors.left: parent.left
                        anchors.leftMargin: 15
                        anchors.verticalCenter: parent.verticalCenter
                        text: "工具与设置"
                        font.pixelSize: 18
                        font.bold: true
                        color: "#333333"
                    }

                    // Subtle bottom separator
                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: 1
                        color: "#F5F5F5"
                    }
                }

                // Fixed grid using flow layout for even distribution across multiple rows
                Flow {
                    anchors.top: toolsSectionTitle.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.margins: 10
                    spacing: 0

                    // Tool item template - reused for all tools to ensure consistent sizing
                    // Each is exactly 1/4 of the parent width
                    Repeater {
                        model: [
                            { icon: "👛", name: "我的钱包" },
                            { icon: "❤️", name: "收藏夹" },
                            { icon: "📍", name: "地址管理" },
                            { icon: "🎫", name: "优惠券" },
                            { icon: "⚙️", name: "设置" },
                            { icon: "❓", name: "帮助中心" },
                            { icon: "📝", name: "意见反馈" },
                            { icon: "ℹ️", name: "关于" }
                        ]

                        delegate: Item {
                            width: parent.width / 4
                            height: 105

                            Column {
                                anchors.centerIn: parent
                                spacing: 8

                                Rectangle {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    width: 55
                                    height: 55
                                    radius: 27.5
                                    color: "#F8F8F8"
                                    border.color: "#F0F0F0"
                                    border.width: 1

                                    Text {
                                        anchors.centerIn: parent
                                        text: modelData.icon
                                        font.pixelSize: 24
                                    }
                                }

                                Text {
                                    text: modelData.name
                                    font.pixelSize: 14
                                    color: "#666666"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Selected: " + modelData.name)
                                }
                            }
                        }
                    }
                }
            }

            // Bottom spacing for scrolling
            Item {
                Layout.fillWidth: true
                height: 20
            }
        }
    }
}
