# Created by and for Qt Creator This file was created for editing the project sources only.
# You may attempt to use it for building too, by modifying this file here.

#TARGET = algebra_polinom_ui
QT += quick
QT += quickcontrols2

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS


HEADERS = \
   $$PWD/Polinom.h

SOURCES = \
   $$PWD/main.cpp \
   $$PWD/Polinom.cpp
RESOURCES += \
    qml.qrc

INCLUDEPATH = \
    $$PWD/.

#DEFINES = 

DISTFILES +=


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

