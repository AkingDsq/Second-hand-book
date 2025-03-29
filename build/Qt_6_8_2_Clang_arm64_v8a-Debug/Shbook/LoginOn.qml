import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {
    id: rootItem
    width: parent.width
    height: parent.height

    // 信号声明
    signal loginSuccess()
    signal registerSuccess()

    // 使用浅色主题
    Material.theme: Material.Light
    Material.accent: "#4CAF50" // 绿色主题色
    Material.primary: "#8BC34A" // 浅绿色

    // 背景
    Rectangle {
        anchors.fill: parent
        color: "#F5F5F5"

        // 背景图案 - 书本和植物装饰
        Image {
            source: "qrc:/images/books_pattern.png"
            anchors.fill: parent
            opacity: 0.05
            fillMode: Image.Tile
        }
    }

    // 主内容容器
    Item {
        anchors.fill: parent

        // 滚动视图包装内容，解决空间不足问题
        Flickable {
            id: flickable
            anchors.fill: parent
            contentHeight: contentColumn.height + tabBar.height + 30
            interactive: true
            clip: true

            // 主内容列
            Column {
                id: contentColumn
                width: parent.width
                spacing: 0

                // Logo区域
                Item {
                    id: logoArea
                    width: parent.width
                    height: rootItem.height * 0.18
                    anchors.horizontalCenter: parent.horizontalCenter

                    // Logo背景
                    Rectangle {
                        width: 100
                        height: 100
                        anchors.centerIn: parent
                        radius: width / 2
                        color: "white"
                        border.width: 2
                        border.color: "#E0E0E0"

                        // 书本图标
                        Image {
                            source: "qrc:/images/book_icon.png"
                            anchors.centerIn: parent
                            width: 50
                            height: 50
                        }
                    }
                }

                // 应用名称
                Text {
                    id: appNameText
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "书易通"
                    color: "#424242"
                    font.pixelSize: 28
                    font.bold: true
                    font.family: "Microsoft YaHei"
                }

                Text {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "二手书交易平台"
                    color: "#757575"
                    font.pixelSize: 14
                    height: 20
                }

                // 间隔
                Item {
                    width: parent.width
                    height: 20
                }

                // 主内容区域 - 登录/注册表单
                SwipeView {
                    id: swipeView
                    width: parent.width - 80
                    height: tabBar.currentIndex === 0 ? 480 : 430  // 不同高度适应不同页面
                    anchors.horizontalCenter: parent.horizontalCenter
                    currentIndex: tabBar.currentIndex
                    clip: true

                    // 登录页
                    Item {
                        id: loginPage

                        ColumnLayout {
                            anchors.fill: parent
                            spacing: 15

                            // 用户名/手机号
                            TextField {
                                id: usernameField
                                placeholderText: qsTr("用户名/手机号")
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                leftPadding: 45
                                font.pixelSize: 16
                                color: "#424242"
                                background: Rectangle {
                                    radius: 25
                                    color: "white"
                                    border.width: 1
                                    border.color: "#E0E0E0"

                                    Image {
                                        source: "qrc:/images/icon_user.png"
                                        anchors.left: parent.left
                                        anchors.leftMargin: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 20
                                        height: 20
                                    }
                                }
                            }

                            // 密码
                            TextField {
                                id: passwordField
                                placeholderText: qsTr("密码")
                                echoMode: TextInput.Password
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                leftPadding: 45
                                font.pixelSize: 16
                                color: "#424242"
                                background: Rectangle {
                                    radius: 25
                                    color: "white"
                                    border.width: 1
                                    border.color: "#E0E0E0"

                                    Image {
                                        source: "qrc:/images/icon_lock.png"
                                        anchors.left: parent.left
                                        anchors.leftMargin: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 20
                                        height: 20
                                    }

                                    // 显示/隐藏密码按钮
                                    Image {
                                        source: passwordField.echoMode === TextInput.Password ?
                                               "qrc:/images/icon_eye_closed.png" : "qrc:/images/icon_eye_open.png"
                                        anchors.right: parent.right
                                        anchors.rightMargin: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 20
                                        height: 20

                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: {
                                                passwordField.echoMode = passwordField.echoMode === TextInput.Password ?
                                                                       TextInput.Normal : TextInput.Password
                                            }
                                        }
                                    }
                                }
                            }

                            // 记住密码和忘记密码
                            RowLayout {
                                Layout.fillWidth: true

                                CheckBox {
                                    id: rememberSwitch
                                    text: qsTr("记住密码")
                                    checked: true
                                    font.pixelSize: 13
                                    Material.foreground: "#757575"
                                }

                                Item { Layout.fillWidth: true }

                                Text {
                                    text: qsTr("忘记密码?")
                                    color: Material.accent
                                    font.pixelSize: 13
                                    font.underline: true

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: console.log("忘记密码")
                                    }
                                }
                            }

                            // 登录按钮
                            Button {
                                text: qsTr("登 录")
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                font.pixelSize: 16
                                font.bold: true
                                Material.background: Material.accent
                                Material.foreground: "white"

                                background: Rectangle {
                                    radius: 25
                                    color: parent.Material.background
                                }

                                onClicked: {
                                    loginSuccess()
                                }
                            }

                            // 或分隔线
                            RowLayout {
                                Layout.fillWidth: true
                                Layout.topMargin: 10
                                Layout.bottomMargin: 5

                                Rectangle {
                                    Layout.fillWidth: true
                                    height: 1
                                    color: "#E0E0E0"
                                }

                                Text {
                                    text: qsTr("或")
                                    color: "#9E9E9E"
                                    font.pixelSize: 12
                                    Layout.leftMargin: 10
                                    Layout.rightMargin: 10
                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    height: 1
                                    color: "#E0E0E0"
                                }
                            }

                            // 第三方登录
                            Text {
                                text: qsTr("第三方账号登录")
                                color: "#757575"
                                font.pixelSize: 12
                                Layout.alignment: Qt.AlignHCenter
                                Layout.topMargin: 5
                            }

                            // 第三方登录图标
                            RowLayout {
                                Layout.alignment: Qt.AlignHCenter
                                Layout.topMargin: 15
                                Layout.preferredHeight: 50
                                spacing: 30

                                Image {
                                    source: "qrc:/images/icon_wechat.png"
                                    width: 40
                                    height: 40
                                    Layout.alignment: Qt.AlignVCenter

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: console.log("微信登录")
                                    }
                                }

                                Image {
                                    source: "qrc:/images/icon_qq.png"
                                    width: 40
                                    height: 40
                                    Layout.alignment: Qt.AlignVCenter

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: console.log("QQ登录")
                                    }
                                }

                                Image {
                                    source: "qrc:/images/icon_weibo.png"
                                    width: 40
                                    height: 40
                                    Layout.alignment: Qt.AlignVCenter

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: console.log("微博登录")
                                    }
                                }
                            }

                            // 添加额外的空白区域，确保内容完全显示
                            Item {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 20
                            }
                        }
                    }

                    // 注册页面
                    Item {
                        id: registerPage

                        ColumnLayout {
                            anchors.fill: parent
                            spacing: 15

                            // 手机号
                            TextField {
                                id: phoneField
                                placeholderText: qsTr("手机号")
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                leftPadding: 45
                                font.pixelSize: 16
                                color: "#424242"
                                inputMethodHints: Qt.ImhDigitsOnly
                                background: Rectangle {
                                    radius: 25
                                    color: "white"
                                    border.width: 1
                                    border.color: "#E0E0E0"

                                    Image {
                                        source: "qrc:/images/icon_phone.png"
                                        anchors.left: parent.left
                                        anchors.leftMargin: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 20
                                        height: 20
                                    }
                                }
                            }

                            // 验证码
                            TextField {
                                id: verificationField
                                placeholderText: qsTr("验证码")
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                leftPadding: 45
                                font.pixelSize: 16
                                color: "#424242"
                                inputMethodHints: Qt.ImhDigitsOnly
                                background: Rectangle {
                                    radius: 25
                                    color: "white"
                                    border.width: 1
                                    border.color: "#E0E0E0"

                                    Image {
                                        source: "qrc:/images/icon_code.png"
                                        anchors.left: parent.left
                                        anchors.leftMargin: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 20
                                        height: 20
                                    }
                                }

                                // 获取验证码按钮
                                Button {
                                    id: getCodeBtn
                                    anchors.right: parent.right
                                    anchors.rightMargin: 5
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 100
                                    height: 30
                                    text: qsTr("获取验证码")
                                    font.pixelSize: 12
                                    Material.background: Material.accent
                                    Material.foreground: "white"

                                    property int countdown: 60

                                    Timer {
                                        id: countdownTimer
                                        interval: 1000
                                        repeat: true
                                        onTriggered: {
                                            getCodeBtn.countdown--;
                                            if (getCodeBtn.countdown <= 0) {
                                                stop();
                                                getCodeBtn.text = qsTr("获取验证码");
                                                getCodeBtn.countdown = 60;
                                            } else {
                                                getCodeBtn.text = qsTr("重新获取(%1)").arg(getCodeBtn.countdown);
                                            }
                                        }
                                    }

                                    onClicked: {
                                        if (getCodeBtn.countdown === 60) {
                                            getCodeBtn.countdown = 59;
                                            countdownTimer.start();
                                            getCodeBtn.text = qsTr("重新获取(%1)").arg(getCodeBtn.countdown);
                                            console.log("发送验证码");
                                        }
                                    }
                                }
                            }

                            // 密码
                            TextField {
                                id: registerPasswordField
                                placeholderText: qsTr("密码")
                                echoMode: TextInput.Password
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                leftPadding: 45
                                font.pixelSize: 16
                                color: "#424242"
                                background: Rectangle {
                                    radius: 25
                                    color: "white"
                                    border.width: 1
                                    border.color: "#E0E0E0"

                                    Image {
                                        source: "qrc:/images/icon_lock.png"
                                        anchors.left: parent.left
                                        anchors.leftMargin: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 20
                                        height: 20
                                    }

                                    // 显示/隐藏密码按钮
                                    Image {
                                        source: registerPasswordField.echoMode === TextInput.Password ?
                                               "qrc:/images/icon_eye_closed.png" : "qrc:/images/icon_eye_open.png"
                                        anchors.right: parent.right
                                        anchors.rightMargin: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 20
                                        height: 20

                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: {
                                                registerPasswordField.echoMode = registerPasswordField.echoMode === TextInput.Password ?
                                                                           TextInput.Normal : TextInput.Password
                                            }
                                        }
                                    }
                                }
                            }

                            // 确认密码
                            TextField {
                                id: confirmPasswordField
                                placeholderText: qsTr("确认密码")
                                echoMode: TextInput.Password
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                leftPadding: 45
                                font.pixelSize: 16
                                color: "#424242"
                                background: Rectangle {
                                    radius: 25
                                    color: "white"
                                    border.width: 1
                                    border.color: "#E0E0E0"

                                    Image {
                                        source: "qrc:/images/icon_lock.png"
                                        anchors.left: parent.left
                                        anchors.leftMargin: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 20
                                        height: 20
                                    }

                                    // 显示/隐藏密码按钮
                                    Image {
                                        source: confirmPasswordField.echoMode === TextInput.Password ?
                                               "qrc:/images/icon_eye_closed.png" : "qrc:/images/icon_eye_open.png"
                                        anchors.right: parent.right
                                        anchors.rightMargin: 15
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 20
                                        height: 20

                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: {
                                                confirmPasswordField.echoMode = confirmPasswordField.echoMode === TextInput.Password ?
                                                                           TextInput.Normal : TextInput.Password
                                            }
                                        }
                                    }
                                }
                            }

                            // 用户协议
                            RowLayout {
                                Layout.fillWidth: true
                                Layout.topMargin: 5

                                CheckBox {
                                    id: termsCheck
                                    checked: false
                                    padding: 0
                                    Layout.preferredHeight: 30
                                    Material.foreground: "#757575"
                                }

                                Text {
                                    text: qsTr("我已阅读并同意")
                                    color: "#757575"
                                    font.pixelSize: 13
                                }

                                Text {
                                    text: qsTr("用户协议")
                                    color: Material.accent
                                    font.pixelSize: 13
                                    font.underline: true

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: console.log("打开用户协议")
                                    }
                                }

                                Text {
                                    text: qsTr("和")
                                    color: "#757575"
                                    font.pixelSize: 13
                                }

                                Text {
                                    text: qsTr("隐私政策")
                                    color: Material.accent
                                    font.pixelSize: 13
                                    font.underline: true

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: console.log("打开隐私政策")
                                    }
                                }

                                Item { Layout.fillWidth: true }
                            }

                            // 注册按钮
                            Button {
                                text: qsTr("注 册")
                                Layout.fillWidth: true
                                Layout.preferredHeight: 50
                                font.pixelSize: 16
                                font.bold: true
                                Material.background: Material.accent
                                Material.foreground: "white"

                                background: Rectangle {
                                    radius: 25
                                    color: parent.Material.background
                                }

                                onClicked: {
                                    registerSuccess()
                                }
                            }

                            // 添加额外的空白区域，确保内容完全显示
                            Item {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 20
                            }
                        }
                    }
                }
            }
        }

        // 底部标签栏 - 固定在底部
        TabBar {
            id: tabBar
            currentIndex: swipeView.currentIndex
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.6
            height: 40
            position: TabBar.Footer
            z: 10  // 确保在最上层

            background: Rectangle {
                color: "transparent"
            }

            // 自定义标签按钮
            TabButton {
                text: qsTr("登录")
                font.pixelSize: 16
                font.bold: TabBar.index === tabBar.currentIndex
                Material.foreground: TabBar.index === tabBar.currentIndex ? Material.accent : "#757575"

                background: Rectangle {
                    color: "transparent"
                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width * 0.6
                        height: 2
                        color: parent.TabBar.index === tabBar.currentIndex ? Material.accent : "transparent"
                    }
                }
            }

            TabButton {
                text: qsTr("注册")
                font.pixelSize: 16
                font.bold: TabBar.index === tabBar.currentIndex
                Material.foreground: TabBar.index === tabBar.currentIndex ? Material.accent : "#757575"

                background: Rectangle {
                    color: "transparent"
                    Rectangle {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width * 0.6
                        height: 2
                        color: parent.TabBar.index === tabBar.currentIndex ? Material.accent : "transparent"
                    }
                }
            }
        }
    }
}
