import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: homePage
    title: "二手书交易"

    // Background color
    Rectangle {
        anchors.fill: parent
        color: "#F8F8F8"
    }

    // Scrollable content
    ScrollView {
        id: mainScrollView
        anchors.fill: parent
        ScrollBar.vertical.policy: ScrollBar.AsNeeded
        contentWidth: parent.width
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 0

            // Search header with prettier design
            Rectangle {
                Layout.fillWidth: true
                height: 70
                color: "#FF6633"

                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width * 0.9
                    height: 45
                    radius: 23
                    color: "white"

                    // Subtle inner border
                    Rectangle {
                        anchors.fill: parent
                        radius: 23
                        color: "transparent"
                        border.color: "#E0E0E0"
                        border.width: 1
                    }

                    Row {
                        anchors.centerIn: parent
                        spacing: 10

                        Text {
                            text: "🔍"
                            font.pixelSize: 18
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: "搜索二手书"
                            font.pixelSize: 15
                            color: "#999999"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("Search clicked")
                        }
                    }
                }
            }

            // Enhanced category display - MORE COMPACT
            Rectangle {
                Layout.fillWidth: true
                height: 90  // Reduced height from 120 to 90
                color: "white"

                // Pretty top border
                Rectangle {
                    anchors.top: parent.top
                    width: parent.width
                    height: 1
                    color: "#F0F0F0"
                }

                // Categories title
                Text {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.margins: 10  // Reduced margins from 15 to 10
                    text: "分类浏览"
                    font.pixelSize: 15  // Slightly smaller font
                    font.bold: true
                    color: "#333333"
                }

                ListView {
                    id: categoriesView
                    anchors.top: parent.top
                    anchors.topMargin: 35  // Reduced top margin
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 5  // Smaller margin
                    anchors.rightMargin: 5  // Smaller margin
                    orientation: ListView.Horizontal
                    clip: true
                    model: categoryModel
                    delegate: categoryDelegate
                    spacing: 8  // Reduced spacing from 15 to 8
                }

                // Category data model
                ListModel {
                    id: categoryModel

                    ListElement {
                        name: "文学小说"
                        icon: "📚"
                        color: "#FFE4E1" // Light red
                    }

                    ListElement {
                        name: "教育教材"
                        icon: "🎓"
                        color: "#E6F3FF" // Light blue
                    }

                    ListElement {
                        name: "计算机"
                        icon: "💻"
                        color: "#E0FFFF" // Light cyan
                    }

                    ListElement {
                        name: "艺术设计"
                        icon: "🎨"
                        color: "#F0FFF0" // Light green
                    }

                    ListElement {
                        name: "外语学习"
                        icon: "🌏"
                        color: "#FFF8DC" // Light goldenrod
                    }

                    ListElement {
                        name: "人文社科"
                        icon: "🏛️"
                        color: "#E6E6FA" // Lavender
                    }

                    ListElement {
                        name: "生活/保健"
                        icon: "🍃"
                        color: "#F0FFFF" // Azure
                    }

                    ListElement {
                        name: "其他类别"
                        icon: "📑"
                        color: "#F5F5F5" // White smoke
                    }
                }

                // Enhanced category delegate with color backgrounds - MORE COMPACT
                Component {
                    id: categoryDelegate

                    Item {
                        width: 70  // Reduced width from 85 to 70
                        height: categoriesView.height - 15  // Reduced height

                        Column {
                            anchors.centerIn: parent
                            spacing: 5  // Reduced spacing from 8 to 5

                            Rectangle {
                                width: 45  // Reduced size from 55 to 45
                                height: 45  // Reduced size from 55 to 45
                                radius: 22.5
                                color: model.color
                                border.color: Qt.darker(model.color, 1.05)
                                border.width: 1
                                anchors.horizontalCenter: parent.horizontalCenter

                                Text {
                                    anchors.centerIn: parent
                                    text: model.icon
                                    font.pixelSize: 20  // Reduced size from 24 to 20
                                }
                            }

                            Text {
                                text: model.name
                                font.pixelSize: 11  // Smaller text from 12 to 11
                                color: "#333333"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("Category selected: " + model.name)
                            }
                        }
                    }
                }
            }

            // Banner section with improved design
            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 10
                height: 130
                color: "white"

                SwipeView {
                    id: bannerSwipeView
                    anchors.fill: parent
                    anchors.margins: 15
                    clip: true

                    Rectangle {
                        color: "#FFF1E6"
                        radius: 12
                        border.color: "#FFE0CC"
                        border.width: 1

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            spacing: 10

                            Column {
                                Layout.fillHeight: true
                                Layout.preferredWidth: parent.width * 0.6
                                spacing: 8

                                Text {
                                    text: "特价书籍专区"
                                    font.pixelSize: 19
                                    font.bold: true
                                }

                                Text {
                                    text: "精选二手书籍，低至3折"
                                    font.pixelSize: 14
                                    color: "#666666"
                                }

                                Rectangle {
                                    width: 85
                                    height: 32
                                    radius: 16
                                    color: "#FF6633"

                                    Text {
                                        anchors.centerIn: parent
                                        text: "立即查看"
                                        color: "white"
                                        font.pixelSize: 13
                                        font.bold: true
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            console.log("View special offers")
                                        }
                                    }
                                }
                            }

                            Rectangle {
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                color: "transparent"

                                Text {
                                    anchors.centerIn: parent
                                    text: "📚"
                                    font.pixelSize: 48
                                }
                            }
                        }
                    }

                    Rectangle {
                        color: "#E6F3FF"
                        radius: 12
                        border.color: "#CCE6FF"
                        border.width: 1

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 15
                            spacing: 10

                            Column {
                                Layout.fillHeight: true
                                Layout.preferredWidth: parent.width * 0.6
                                spacing: 8

                                Text {
                                    text: "考研资料专区"
                                    font.pixelSize: 19
                                    font.bold: true
                                }

                                Text {
                                    text: "往年考研资料，助你备考"
                                    font.pixelSize: 14
                                    color: "#666666"
                                }

                                Rectangle {
                                    width: 85
                                    height: 32
                                    radius: 16
                                    color: "#3399FF"

                                    Text {
                                        anchors.centerIn: parent
                                        text: "立即查看"
                                        color: "white"
                                        font.pixelSize: 13
                                        font.bold: true
                                    }

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            console.log("View exam materials")
                                        }
                                    }
                                }
                            }

                            Rectangle {
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                color: "transparent"

                                Text {
                                    anchors.centerIn: parent
                                    text: "🎓"
                                    font.pixelSize: 48
                                }
                            }
                        }
                    }
                }

                PageIndicator {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 8
                    count: bannerSwipeView.count
                    currentIndex: bannerSwipeView.currentIndex

                    delegate: Rectangle {
                        implicitWidth: 8
                        implicitHeight: 8
                        radius: 4
                        color: index === bannerSwipeView.currentIndex ? "#FF6633" : "#CCCCCC"

                        Behavior on color {
                            ColorAnimation {
                                duration: 200
                            }
                        }
                    }
                }
            }

            // Recommended books section header
            Rectangle {
                Layout.fillWidth: true
                Layout.topMargin: 10
                height: 50
                color: "white"

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 10

                    Text {
                        text: "推荐"
                        font.pixelSize: 18
                        font.bold: true
                        color: "#333333"
                        Layout.fillWidth: true
                    }

                    Row {
                        spacing: 15

                        Row {
                            spacing: 3

                            Text {
                                text: "价格"
                                font.pixelSize: 14
                                color: "#666666"
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Text {
                                text: "↓"
                                font.pixelSize: 12
                                color: "#999999"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Rectangle {
                            width: 1
                            height: 14
                            color: "#E5E5E5"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Row {
                            spacing: 3

                            Text {
                                text: "新旧"
                                font.pixelSize: 14
                                color: "#666666"
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            Text {
                                text: "↓"
                                font.pixelSize: 12
                                color: "#999999"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }

                // Bottom separator
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: "#F0F0F0"
                }
            }

            // Recommended books container - using Flow layout for alternating left-right display
            Rectangle {
                Layout.fillWidth: true
                height: 880 // Fixed height calculated to fit all items
                color: "white"
                clip: true // Important: clip the content to stay within this container

                Flow {
                    id: recommendedBooksFlow
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10
                    layoutDirection: Flow.LeftToRight
                    flow: Flow.LeftToRight

                    // Generate book items with Repeater for alternating layout
                    Repeater {
                        model: recommendedBooksModel

                        // Delegate contains different layouts for odd and even indices
                        Rectangle {
                            width: (parent.width - 10) / 2
                            height: 250  // Increased height to give more space for the image
                            radius: 8
                            color: "white"
                            border.color: "#EEEEEE"
                            border.width: 1

                            // For odd indices, layout is reversed
                            property bool isOdd: index % 2 === 1

                            Column {
                                anchors.fill: parent
                                anchors.margins: 8
                                spacing: 8

                                // Book cover with colored background
                                Rectangle {
                                    id: coverRect
                                    width: parent.width
                                    height: 170
                                    radius: 6
                                    color: model.coverColor

                                    // Book image directly in the colored background
                                    Image {
                                        id: bookCover
                                        anchors.centerIn: parent
                                        width: parent.width * 0.85
                                        height: parent.height * 0.85
                                        source: model.imagePath  // Use the path directly without modification
                                        fillMode: Image.PreserveAspectFit
                                        asynchronous: true
                                        cache: true

                                        // 更强的调试输出
                                        Component.onCompleted: {
                                            console.log("尝试加载图片:", source)
                                            console.log("当前应用目录:", Qt.application.directory)  // 这个属性在多数 Qt 版本中可用
                                        }

                                        onStatusChanged: {
                                            if (status === Image.Ready) {
                                                console.log("图片加载成功:", source)
                                            } else if (status === Image.Error) {
                                                console.log("图片加载失败:", source, "错误原因可能是路径错误或资源未正确打包")
                                            } else if (status === Image.Loading) {
                                                console.log("图片正在加载中:", source)
                                            }
                                        }

                                        // Loading indicator
                                        BusyIndicator {
                                            anchors.centerIn: parent
                                            running: bookCover.status === Image.Loading
                                            width: 24
                                            height: 24
                                        }

                                        // Error state handler
                                        Rectangle {
                                            anchors.fill: parent
                                            color: "#F0F0F0"
                                            visible: bookCover.status === Image.Error

                                            Column {
                                                anchors.centerIn: parent
                                                spacing: 4

                                                Text {
                                                    anchors.horizontalCenter: parent.horizontalCenter
                                                    text: "封面加载失败"
                                                    color: "#666666"
                                                }

                                                Text {
                                                    anchors.horizontalCenter: parent.horizontalCenter
                                                    text: bookCover.source.toString()
                                                    color: "#999999"
                                                    font.pixelSize: 10
                                                    width: parent.width - 10
                                                    wrapMode: Text.WrapAnywhere
                                                    horizontalAlignment: Text.AlignHCenter
                                                }
                                            }
                                        }
                                    }

                                    // Fallback icon if no image or while loading
                                    Text {
                                        anchors.centerIn: parent
                                        text: "📚"
                                        font.pixelSize: 40
                                        visible: bookCover.status !== Image.Ready
                                    }
                                }

                                // Book title with better typography
                                Text {
                                    width: parent.width
                                    text: model.title
                                    font.pixelSize: 15
                                    elide: Text.ElideRight
                                    maximumLineCount: 1
                                    color: "#333333"
                                }

                                // Price and condition row with better spacing
                                Row {
                                    width: parent.width
                                    spacing: 8

                                    Text {
                                        text: model.price
                                        font.pixelSize: 16
                                        font.bold: true
                                        color: "#FF6633"
                                    }

                                    Text {
                                        text: model.condition
                                        font.pixelSize: 13
                                        color: "#666666"
                                    }
                                }

                                // Location with icon
                                Row {
                                    spacing: 4

                                    Text {
                                        text: "📍"
                                        font.pixelSize: 12
                                    }

                                    Text {
                                        text: model.location
                                        font.pixelSize: 12
                                        color: "#999999"
                                    }
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    console.log("Book selected: " + model.title)
                                }
                            }
                        }
                    }
                }

                // Recommended books model
                ListModel {
                    id: recommendedBooksModel

                    ListElement {
                        title: "微机原理"
                        price: "¥25"
                        condition: "九成新"
                        location: "北京海淀"
                        coverColor: "#FFE4E1"
                        imagePath: ":/images/computer_principle.png"  // Try with explicit qrc: prefix
                    }

                    ListElement {
                        title: "离散数学"
                        price: "¥38"
                        condition: "八成新"
                        location: "上海闵行"
                        coverColor: "#E6F3FF"
                        imagePath: ":/images/discrete_math.png"  // Try with explicit qrc: prefix
                    }

                    ListElement {
                        title: "万历十五年"
                        price: "¥18"
                        condition: "七成新"
                        location: "广州天河"
                        coverColor: "#F0FFF0"
                    }

                    ListElement {
                        title: "C++ Primer Plus"
                        price: "¥45"
                        condition: "全新"
                        location: "杭州西湖"
                        coverColor: "#E6E6FA"
                    }

                    ListElement {
                        title: "小王子"
                        price: "¥15"
                        condition: "九成新"
                        location: "深圳南山"
                        coverColor: "#FFF8DC"
                    }

                    ListElement {
                        title: "Python编程：从入门到实践"
                        price: "¥35"
                        condition: "全新"
                        location: "成都武侯"
                        coverColor: "#E0FFFF"
                    }

                    ListElement {
                        title: "人类简史"
                        price: "¥42"
                        condition: "九成新"
                        location: "南京鼓楼"
                        coverColor: "#FFE4B5"
                    }

                    ListElement {
                        title: "红楼梦"
                        price: "¥22"
                        condition: "八成新"
                        location: "武汉洪山"
                        coverColor: "#FAFAD2"
                    }
                }
            }

            // Load more button with improved styling
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 60
                color: "white"

                Rectangle {
                    anchors.centerIn: parent
                    width: 140
                    height: 40
                    radius: 20
                    color: "#F8F8F8"
                    border.color: "#E5E5E5"
                    border.width: 1

                    Row {
                        anchors.centerIn: parent
                        spacing: 8

                        Text {
                            text: "加载更多"
                            font.pixelSize: 14
                            color: "#666666"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: "↓"
                            font.pixelSize: 12
                            color: "#666666"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("Loading more books")
                            // Here you would add more items to the recommendedBooksModel
                        }
                    }
                }
            }

            // Bottom spacing for scrolling
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 20
            }
        }
    }
}
