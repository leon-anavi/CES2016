#/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
# *
# * This Source Code Form is subject to the terms of the Mozilla Public
# * License, v. 2.0. If a copy of the MPL was not distributed with this
# * file, You can obtain one at http://mozilla.org/MPL/2.0/. */


DEFINES += QT_COMPOSITOR_QUICK

QT += quick qml

QT += compositor
#  if you want to compile QtCompositor as part of the application
#  instead of linking to it, remove the QT += compositor and uncomment
#  the following line
#include (../../src/compositor/compositor.pri)

SOURCES += main.cpp \
    simplecompositor.cpp \
    applauncher.cpp

OTHER_FILES = main.qml

target.path = /usr/bin/
INSTALLS += target

HEADERS += \
    simplecompositor.h \
    applauncher.h

DISTFILES += \
    main.qml \
    ContrastEffect.qml
