TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    player.cpp \
    team.cpp \
    teammodel.cpp \
    playermodel.cpp \
    mediator.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    player.h \
    team.h \
    teammodel.h \
    playermodel.h \
    mediator.h

DISTFILES +=

