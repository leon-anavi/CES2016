/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */


#ifndef SIMPLECOMPOSITOR
#define SIMPLECOMPOSITOR

#include "qwaylandquickcompositor.h"
#include "qwaylandquicksurface.h"

#include <QtCompositor/qwaylandsurfaceitem.h>

#include <QGuiApplication>
#include <QTimer>
#include <QPainter>
#include <QMouseEvent>

#include <QQmlContext>

#include <QQuickItem>
#include <QQuickView>


class SimpleCompositor : public QQuickView, public QWaylandQuickCompositor
{
    Q_OBJECT

public:
    SimpleCompositor();
    QWaylandInputDevice *inputDevice() const;
    Q_INVOKABLE QWaylandSurfaceItem *item(QWaylandSurface *surf);
    void setSource(const QUrl &);

signals:
    void windowAdded(QVariant window);
    void windowRemoved(QVariant window);

public slots:
    void destroyWindow(QVariant window);

private slots:
    void surfaceMapped();
    void surfaceUnmapped();
    void surfaceDestroyed();
    void sendCallbacks();

protected:
    void resizeEvent(QResizeEvent *event);
    void surfaceCreated(QWaylandSurface *surface);
};


#endif // SIMPLECOMPOSITOR

