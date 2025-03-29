import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Effects
import QtQuick.Controls.Material

ApplicationWindow {
    id: window
    visible: true
    width: 618
    height: 1338
    title: qsTr("Hello World")

    // 系统信息 - 当前日期和用户信息
    readonly property string currentDateTime: "2025-03-25 08:45:57"
    readonly property string currentUser: "AkingDsq"

    // 使用浅色主题
    Material.theme: Material.Light
    Material.accent: "#4CAF50" // 绿色作为主色调
    Material.primary: "#8BC34A" // 浅绿色

    // 使用Loader加载页面
    Loader {
        id: pageLoader
        anchors.fill: parent
        source: "./LoginOn.qml"

        // 页面切换动画
        onSourceChanged: {
            fadeAnimation.start()
        }
    }

    // 淡入淡出动画
    SequentialAnimation {
        id: fadeAnimation

        NumberAnimation {
            target: pageLoader
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: 400
            easing.type: Easing.OutCubic
        }
    }

    // 设置Android全屏显示
    Component.onCompleted: {
        if (Qt.platform.os === "android") {
            try {
                window.flags = Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint
            } catch (e) {
                console.log("设置全屏模式失败: " + e)
            }
        }
    }

    // 连接信号
    Connections {
        target: pageLoader.item

        // 登录成功
        function onLoginSuccess() {
            console.log("登录成功，用户: " + currentUser)
            pageLoader.setSource("./Home.qml", {
                "username": currentUser,
                "currentDateTime": currentDateTime
            })
        }

        // 注册成功
        function onRegisterSuccess() {
            console.log("注册成功")
            // 可以执行其他操作，比如显示一个通知
        }

        // 退出登录
        function onLogout() {
            console.log("用户登出")
            pageLoader.setSource("./LoginOn.qml")
        }
    }
}
