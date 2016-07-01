/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */


#include <QGuiApplication>
#include <QQmlContext>
#include <QQuickView>
#include <QCommandLineParser>
#include <QQmlEngine>
#include <QScreen>
#include <QRect>

#include <QDebug>

#include "simplecompositor.h"
#include "applauncher.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QCoreApplication::setApplicationName("SimpleCompositor");
    QCommandLineParser parser;
    parser.setApplicationDescription("Simple Wayland compositor with "
                                     "basic application launching capabilities");
    parser.addHelpOption();
    parser.addPositionalArgument("qml-file", "QML file to render Wayland surfaces into");
    parser.process(app);
    const QStringList args = parser.positionalArguments();
    if (args.size() != 1){
        fprintf(stderr, "Must specify QML file to use\n");
        parser.showHelp(1);
        return 1;
    }

    QString qmlFile = args.at(0);

    SimpleCompositor compositor;
    compositor.rootContext()->setContextProperty("compositor", &compositor);

    AppLauncher appLauncher;
    compositor.rootContext()->setContextProperty("appLauncher", &appLauncher);

    compositor.setSource(QUrl::fromLocalFile(qmlFile));
    compositor.setTitle(QLatin1String("Simple Compositor"));
    compositor.setGeometry(0, 0, 480, 640);
    compositor.show();

    return app.exec();
}
