import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs

Page {
    id: publishPage
    title: "发布"

    property var selectedImages: []
    property int maxImages: 9

    // Page header with improved styling
    Rectangle {
        id: header
        width: parent.width
        height: 60
        color: "white"

        // Bottom border
        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: 1
            color: "#EEEEEE"
        }

        Text {
            anchors.centerIn: parent
            text: "发布二手书"
            font.pixelSize: 18
            font.bold: true
            color: "#333333"
        }

        // Cancel button with enhanced styling
        Rectangle {
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            width: 60
            height: 40
            color: "transparent"

            Text {
                anchors.centerIn: parent
                text: "取消"
                font.pixelSize: 16
                color: "#666666"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Cancel publish")
                }
            }
        }

        // Publish button with improved styling
        Rectangle {
            anchors.right: parent.right
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            width: 60
            height: 40
            color: "transparent"

            Text {
                anchors.centerIn: parent
                text: "发布"
                font.pixelSize: 16
                color: "#FF6633"
                font.bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (titleInput.text && priceInput.text && selectedImages.length > 0) {
                        console.log("Publish item")
                    } else {
                        // Show error message
                        publishErrorDialog.open()
                    }
                }
            }
        }
    }

    // Scrollable content with improved styling
    ScrollView {
        anchors.top: header.bottom
        width: parent.width
        height: parent.height - header.height
        contentWidth: parent.width
        ScrollBar.vertical.policy: ScrollBar.AsNeeded
        clip: true

        ColumnLayout {
            width: parent.width
            spacing: 10

            // Photo upload section with enhanced styling
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 180
                color: "white"

                // Top and bottom borders
                Rectangle {
                    anchors.top: parent.top
                    width: parent.width
                    height: 1
                    color: "#F0F0F0"
                }

                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: "#F0F0F0"
                }

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 10

                    // Section title with counter
                    Row {
                        spacing: 5

                        Text {
                            text: "上传图片"
                            font.pixelSize: 16
                            color: "#333333"
                            font.bold: true
                        }

                        Text {
                            text: "(" + selectedImages.length + "/" + maxImages + ")"
                            font.pixelSize: 16
                            color: "#999999"
                        }
                    }

                    // More descriptive helper text
                    Text {
                        text: "上传清晰的书籍照片可以提高成交率"
                        font.pixelSize: 12
                        color: "#999999"
                    }

                    // Images grid with improved styling
                    GridView {
                        id: photosGrid
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        cellWidth: 90
                        cellHeight: 90
                        model: Math.min(selectedImages.length + 1, maxImages)
                        clip: true

                        delegate: Item {
                            width: 85
                            height: 85

                            // Photo item (empty or filled)
                            Rectangle {
                                anchors.centerIn: parent
                                width: 80
                                height: 80
                                radius: 6
                                border.color: index === selectedImages.length ? "#DDDDDD" : "#E5E5E5"
                                border.width: 1
                                color: index === selectedImages.length ? "#F8F8F8" : "white"

                                // Add photo button or photo preview
                                Item {
                                    anchors.fill: parent

                                    // Add button
                                    Column {
                                        anchors.centerIn: parent
                                        spacing: 5
                                        visible: index === selectedImages.length

                                        Text {
                                            text: "+"
                                            font.pixelSize: 26
                                            color: "#AAAAAA"
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }

                                        Text {
                                            text: "添加图片"
                                            font.pixelSize: 12
                                            color: "#999999"
                                            anchors.horizontalCenter: parent.horizontalCenter
                                        }
                                    }

                                    // Photo preview
                                    Rectangle {
                                        anchors.fill: parent
                                        visible: index < selectedImages.length
                                        color: "transparent"
                                        radius: 6
                                        clip: true

                                        // Sample book image
                                        Rectangle {
                                            anchors.fill: parent
                                            color: Qt.rgba(Math.random(), Math.random(), Math.random(), 0.2)

                                            Text {
                                                anchors.centerIn: parent
                                                text: "📚"
                                                font.pixelSize: 32
                                            }
                                        }

                                        // Remove button
                                        Rectangle {
                                            anchors.top: parent.top
                                            anchors.right: parent.right
                                            anchors.topMargin: -8
                                            anchors.rightMargin: -8
                                            width: 22
                                            height: 22
                                            radius: 11
                                            color: "#FF6633"

                                            Text {
                                                anchors.centerIn: parent
                                                text: "×"
                                                color: "white"
                                                font.pixelSize: 16
                                                font.bold: true
                                            }

                                            MouseArea {
                                                anchors.fill: parent
                                                onClicked: {
                                                    // Remove this photo
                                                    var newArray = []
                                                    for (var i = 0; i < selectedImages.length; i++) {
                                                        if (i !== index) {
                                                            newArray.push(selectedImages[i])
                                                        }
                                                    }
                                                    selectedImages = newArray
                                                }
                                            }
                                        }
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    visible: index === selectedImages.length
                                    onClicked: {
                                        // Open image picker
                                        if (selectedImages.length < maxImages) {
                                            imageDialog.open()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // Book title section with better styling
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 85
                color: "white"

                // Bottom border
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: "#F0F0F0"
                }

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 8

                    // Section title
                    Text {
                        text: "书名"
                        font.pixelSize: 16
                        font.bold: true
                        color: "#333333"
                    }

                    // Input field with better styling
                    Rectangle {
                        Layout.fillWidth: true
                        height: 45
                        color: "#F8F8F8"
                        radius: 6
                        border.color: titleInput.activeFocus ? "#FF6633" : "transparent"
                        border.width: 1

                        TextInput {
                            id: titleInput
                            anchors.fill: parent
                            anchors.margins: 12
                            font.pixelSize: 16
                            verticalAlignment: TextInput.AlignVCenter
                            maximumLength: 50
                            clip: true

                            Text {
                                text: "请输入书名（必填）"
                                color: "#AAAAAA"
                                font.pixelSize: 16
                                anchors.verticalCenter: parent.verticalCenter
                                visible: !titleInput.text && !titleInput.activeFocus
                            }
                        }
                    }
                }
            }

            // Book description section with better styling
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 160
                color: "white"

                // Bottom border
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: "#F0F0F0"
                }

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 8

                    // Section title
                    Text {
                        text: "描述"
                        font.pixelSize: 16
                        font.bold: true
                        color: "#333333"
                    }

                    // Text area with better styling
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#F8F8F8"
                        radius: 6
                        border.color: descriptionInput.activeFocus ? "#FF6633" : "transparent"
                        border.width: 1

                        TextArea {
                            id: descriptionInput
                            anchors.fill: parent
                            anchors.margins: 12
                            font.pixelSize: 15
                            wrapMode: TextArea.Wrap
                            verticalAlignment: TextArea.AlignTop

                            Text {
                                text: "描述一下书的新旧程度，版本，有无笔记等情况（选填）"
                                color: "#AAAAAA"
                                font.pixelSize: 15
                                anchors.top: parent.top
                                anchors.left: parent.left
                                visible: !descriptionInput.text && !descriptionInput.activeFocus
                            }

                            // Character count
                            Text {
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                text: descriptionInput.text.length + "/500"
                                font.pixelSize: 12
                                color: descriptionInput.text.length > 450 ? "#FF6633" : "#AAAAAA"
                            }
                        }
                    }
                }
            }

            // Book details section with better styling
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 240
                color: "white"

                // Bottom border
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: "#F0F0F0"
                }

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 15

                    Text {
                        text: "详细信息"
                        font.pixelSize: 16
                        font.bold: true
                        color: "#333333"
                    }

                    // Category selector with better styling
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 15

                        Text {
                            text: "分类"
                            font.pixelSize: 15
                            color: "#666666"
                            Layout.preferredWidth: 70
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 45
                            color: "#F8F8F8"
                            radius: 6

                            Text {
                                id: categoryText
                                anchors.fill: parent
                                anchors.margins: 12
                                font.pixelSize: 15
                                verticalAlignment: Text.AlignVCenter
                                text: "请选择分类"
                                color: "#AAAAAA"
                            }

                            Text {
                                anchors.right: parent.right
                                anchors.rightMargin: 12
                                anchors.verticalCenter: parent.verticalCenter
                                text: "▼"
                                font.pixelSize: 12
                                color: "#999999"
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    categoryMenu.open()
                                }
                            }

                            Menu {
                                id: categoryMenu

                                MenuItem {
                                    text: "文学小说"
                                    onTriggered: {
                                        categoryText.text = text
                                        categoryText.color = "#333333"
                                    }
                                }

                                MenuItem {
                                    text: "教育教材"
                                    onTriggered: {
                                        categoryText.text = text
                                        categoryText.color = "#333333"
                                    }
                                }

                                MenuItem {
                                    text: "计算机/科学"
                                    onTriggered: {
                                        categoryText.text = text
                                        categoryText.color = "#333333"
                                    }
                                }

                                MenuItem {
                                    text: "艺术设计"
                                    onTriggered: {
                                        categoryText.text = text
                                        categoryText.color = "#333333"
                                    }
                                }

                                MenuItem {
                                    text: "外语学习"
                                    onTriggered: {
                                        categoryText.text = text
                                        categoryText.color = "#333333"
                                    }
                                }

                                MenuItem {
                                    text: "人文社科"
                                    onTriggered: {
                                        categoryText.text = text
                                        categoryText.color = "#333333"
                                    }
                                }

                                MenuItem {
                                    text: "生活/保健"
                                    onTriggered: {
                                        categoryText.text = text
                                        categoryText.color = "#333333"
                                    }
                                }

                                MenuItem {
                                    text: "其他类别"
                                    onTriggered: {
                                        categoryText.text = text
                                        categoryText.color = "#333333"
                                    }
                                }
                            }
                        }
                    }

                    // Condition selector with better styling
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 15

                        Text {
                            text: "新旧程度"
                            font.pixelSize: 15
                            color: "#666666"
                            Layout.preferredWidth: 70
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 45
                            color: "#F8F8F8"
                            radius: 6

                            Text {
                                id: conditionText
                                anchors.fill: parent
                                anchors.margins: 12
                                font.pixelSize: 15
                                verticalAlignment: Text.AlignVCenter
                                text: "请选择新旧程度"
                                color: "#AAAAAA"
                            }

                            Text {
                                anchors.right: parent.right
                                anchors.rightMargin: 12
                                anchors.verticalCenter: parent.verticalCenter
                                text: "▼"
                                font.pixelSize: 12
                                color: "#999999"
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    conditionMenu.open()
                                }
                            }

                            Menu {
                                id: conditionMenu

                                MenuItem {
                                    text: "全新"
                                    onTriggered: {
                                        conditionText.text = text
                                        conditionText.color = "#333333"
                                    }
                                }

                                MenuItem {
                                    text: "九成新"
                                    onTriggered: {
                                        conditionText.text = text
                                        conditionText.color = "#333333"
                                    }
                                }

                                MenuItem {
                                    text: "八成新"
                                    onTriggered: {
                                        conditionText.text = text
                                        conditionText.color = "#333333"
                                    }
                                }

                                MenuItem {
                                    text: "七成新"
                                    onTriggered: {
                                        conditionText.text = text
                                        conditionText.color = "#333333"
                                    }
                                }

                                MenuItem {
                                    text: "六成新及以下"
                                    onTriggered: {
                                        conditionText.text = text
                                        conditionText.color = "#333333"
                                    }
                                }
                            }
                        }
                    }

                    // Price input with better styling
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 15

                        Text {
                            text: "价格"
                            font.pixelSize: 15
                            color: "#666666"
                            Layout.preferredWidth: 70
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 45
                            color: "#F8F8F8"
                            radius: 6
                            border.color: priceInput.activeFocus ? "#FF6633" : "transparent"
                            border.width: 1

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 12
                                spacing: 5

                                Text {
                                    text: "¥"
                                    font.pixelSize: 16
                                    font.bold: true
                                    color: "#FF6633"
                                }

                                TextInput {
                                    id: priceInput
                                    Layout.fillWidth: true
                                    font.pixelSize: 16
                                    verticalAlignment: TextInput.AlignVCenter
                                    validator: DoubleValidator {
                                        bottom: 0
                                        decimals: 2
                                        notation: DoubleValidator.StandardNotation
                                    }
                                    inputMethodHints: Qt.ImhFormattedNumbersOnly

                                    Text {
                                        text: "输入价格（必填）"
                                        color: "#AAAAAA"
                                        font.pixelSize: 16
                                        anchors.verticalCenter: parent.verticalCenter
                                        visible: !priceInput.text && !priceInput.activeFocus
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // Location section with better styling
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                color: "white"

                // Bottom border
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: "#F0F0F0"
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 15

                    Text {
                        text: "交易地点"
                        font.pixelSize: 15
                        color: "#666666"
                        Layout.preferredWidth: 70
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 45
                        color: "#F8F8F8"
                        radius: 6

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 12
                            spacing: 5

                            Text {
                                text: "📍"
                                font.pixelSize: 15
                            }

                            Text {
                                id: locationText
                                Layout.fillWidth: true
                                font.pixelSize: 15
                                verticalAlignment: Text.AlignVCenter
                                text: "北京市海淀区"  // Default location
                                color: "#333333"
                            }

                            Text {
                                text: "▼"
                                font.pixelSize: 12
                                color: "#999999"
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                // Open location selector
                                console.log("Select location")
                            }
                        }
                    }
                }
            }

            // "Optional Information" section
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                color: "#F8F8F8"

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    text: "选填信息（提供更多信息以提高成交率）"
                    font.pixelSize: 14
                    color: "#666666"
                }
            }

            // Original price section
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                color: "white"

                // Bottom border
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: "#F0F0F0"
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 15

                    Text {
                        text: "原价"
                        font.pixelSize: 15
                        color: "#666666"
                        Layout.preferredWidth: 70
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 45
                        color: "#F8F8F8"
                        radius: 6
                        border.color: originalPriceInput.activeFocus ? "#FF6633" : "transparent"
                        border.width: 1

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 12
                            spacing: 5

                            Text {
                                text: "¥"
                                font.pixelSize: 16
                                color: "#999999"
                            }

                            TextInput {
                                id: originalPriceInput
                                Layout.fillWidth: true
                                font.pixelSize: 16
                                verticalAlignment: TextInput.AlignVCenter
                                validator: DoubleValidator {
                                    bottom: 0
                                    decimals: 2
                                    notation: DoubleValidator.StandardNotation
                                }
                                inputMethodHints: Qt.ImhFormattedNumbersOnly

                                Text {
                                    text: "输入原价（选填）"
                                    color: "#AAAAAA"
                                    font.pixelSize: 16
                                    anchors.verticalCenter: parent.verticalCenter
                                    visible: !originalPriceInput.text && !originalPriceInput.activeFocus
                                }
                            }
                        }
                    }
                }
            }

            // Author section
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                color: "white"

                // Bottom border
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: "#F0F0F0"
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 15

                    Text {
                        text: "作者"
                        font.pixelSize: 15
                        color: "#666666"
                        Layout.preferredWidth: 70
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 45
                        color: "#F8F8F8"
                        radius: 6
                        border.color: authorInput.activeFocus ? "#FF6633" : "transparent"
                        border.width: 1

                        TextInput {
                            id: authorInput
                            anchors.fill: parent
                            anchors.margins: 12
                            font.pixelSize: 16
                            verticalAlignment: TextInput.AlignVCenter

                            Text {
                                text: "输入作者（选填）"
                                color: "#AAAAAA"
                                font.pixelSize: 16
                                anchors.verticalCenter: parent.verticalCenter
                                visible: !authorInput.text && !authorInput.activeFocus
                            }
                        }
                    }
                }
            }

            // Publisher section
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                color: "white"

                // Bottom border
                Rectangle {
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 1
                    color: "#F0F0F0"
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 15

                    Text {
                        text: "出版社"
                        font.pixelSize: 15
                        color: "#666666"
                        Layout.preferredWidth: 70
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 45
                        color: "#F8F8F8"
                        radius: 6
                        border.color: publisherInput.activeFocus ? "#FF6633" : "transparent"
                        border.width: 1

                        TextInput {
                            id: publisherInput
                            anchors.fill: parent
                            anchors.margins: 12
                            font.pixelSize: 16
                            verticalAlignment: TextInput.AlignVCenter

                            Text {
                                text: "输入出版社（选填）"
                                color: "#AAAAAA"
                                font.pixelSize: 16
                                anchors.verticalCenter: parent.verticalCenter
                                visible: !publisherInput.text && !publisherInput.activeFocus
                            }
                        }
                    }
                }
            }

            // ISBN section
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                color: "white"

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 15

                    Text {
                        text: "ISBN"
                        font.pixelSize: 15
                        color: "#666666"
                        Layout.preferredWidth: 70
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        height: 45
                        color: "#F8F8F8"
                        radius: 6
                        border.color: isbnInput.activeFocus ? "#FF6633" : "transparent"
                        border.width: 1

                        TextInput {
                            id: isbnInput
                            anchors.fill: parent
                            anchors.margins: 12
                            font.pixelSize: 16
                            verticalAlignment: TextInput.AlignVCenter
                            inputMethodHints: Qt.ImhDigitsOnly

                            Text {
                                text: "输入ISBN编号（选填）"
                                color: "#AAAAAA"
                                font.pixelSize: 16
                                anchors.verticalCenter: parent.verticalCenter
                                visible: !isbnInput.text && !isbnInput.activeFocus
                            }
                        }
                    }
                }
            }

            // Bottom spacing with nice publishing tips
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 100
                color: "#F8F8F8"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 10

                    Text {
                        text: "📝 发布小贴士"
                        font.pixelSize: 14
                        font.bold: true
                        color: "#666666"
                    }

                    Text {
                        text: "• 真实完整的信息更容易获得买家信任\n• 上传多角度清晰的图片可提高成交率\n• 合理定价能让您的书籍更快售出"
                        font.pixelSize: 13
                        color: "#999999"
                        lineHeight: 1.3
                    }
                }
            }

            // Additional bottom spacing
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: 30
            }
        }
    }

    // Mock image picker dialog
    FileDialog {
        id: imageDialog
        title: "选择图片"
        nameFilters: ["Image files (*.jpg *.png)"]
        currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0] // 安卓图片目录
        fileMode: FileDialog.OpenFiles // 允许多选
        onAccepted: {
            // 安卓返回的是 content:// URI，需用 FileReader 或 C++ 处理
            for (let url of selectedFiles) {
                selectedImages.push(url.toString())
                console.log("选中文件URI:", url)
            }
        }
    }

    // Error dialog with improved styling
    Dialog {
        id: publishErrorDialog
        title: "发布提示"
        standardButtons: StandardButton.Ok

        Rectangle {
            width: parent.width
            height: 100
            color: "white"

            ColumnLayout {
                anchors.centerIn: parent
                spacing: 15

                Text {
                    text: "⚠️"
                    font.pixelSize: 24
                    Layout.alignment: Qt.AlignHCenter
                }

                Text {
                    text: "请至少填写书名、价格，并上传一张图片"
                    font.pixelSize: 14
                    color: "#666666"
                    Layout.alignment: Qt.AlignHCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}
