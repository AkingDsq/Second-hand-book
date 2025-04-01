cmake_minimum_required(VERSION 3.16)

project(Shbook VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appShbook
    main.cpp
)

qt_add_qml_module(appShbook
    URI Shbook
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES Home.qml LoginOn.qml
        QML_FILES HomePage.qml
        QML_FILES
        QML_FILES PublishPage.qml
        QML_FILES MessagesPage.qml
        QML_FILES ProfilePage.qml
        QML_FILES
        QML_FILES
        QML_FILES
        QML_FILES ChatItemDelegate.qml
        QML_FILES ChatDetailPage.qml
        QML_FILES MessageDelegate.qml
        RESOURCES resources/images.qrc
        RESOURCES resources/images/computer_principle.png resources/images/discrete_math.png
)

# 添加资源文件
qt_add_resources(appShbook
    PREFIX "/"
    BASE "resources"  # 指定资源根目录
    FILES
        "resources/images.qrc"  # 完整相对路径
)

# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appShbook PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appShbook
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appShbook
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appShbook
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
