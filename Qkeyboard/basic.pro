TEMPLATE = app
TARGET = basic
QT += qml quick virtualkeyboard
SOURCES += main.cpp
CONFIG += link_pkgconfig
static {
    QT += svg
    QTPLUGIN += qtvirtualkeyboardplugin
}

target.path=/opt
INSTALLS+=target

#target.path = $$[QT_INSTALL_EXAMPLES]/virtualkeyboard/basic
#INSTALLS += target

RESOURCES += \
    demo.qrc

OTHER_FILES += \
    Basic.qml \
    basic-b2qt.qml \
    content/AutoScroller.qml \
    content/HandwritingModeButton.qml \
    content/TextArea.qml \
    content/TextField.qml \

disable-xcb {
    message("The disable-xcb option has been deprecated. Please use disable-desktop instead.")
    CONFIG += disable-desktop
}

disable-desktop|android-embedded|!isEmpty(CROSS_COMPILE)|qnx {
    DEFINES += MAIN_QML=\\\"basic-b2qt.qml\\\"
} else {
    DEFINES += MAIN_QML=\\\"Basic.qml\\\"
}


# 核心：添加虚拟键盘模块（必须！）
#QT += core gui widgets virtualkeyboard

## （可选）指定xkbcommon库的路径（确保编译时能找到）
#INCLUDEPATH += /opt/xkbcommon-aarch64/include
#LIBS += -L/opt/xkbcommon-aarch64/lib -lxkbcommon
