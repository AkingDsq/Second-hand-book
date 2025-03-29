cmake_minimum_required(VERSION 3.16)

project(Second-hand-book-trading-platform VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appSecond-hand-book-trading-platform
    main.cpp
)

qt_add_qml_module(appSecond-hand-book-trading-platform
    URI Second-hand-book-trading-platform
    VERSION 1.0
    QML_FILES
        Main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appSecond-hand-book-trading-platform PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appSecond-hand-book-trading-platform
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appSecond-hand-book-trading-platform
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appSecond-hand-book-trading-platform
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
