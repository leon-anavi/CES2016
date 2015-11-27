/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */


#include "simplecompositor.h"
#include <QWaylandInputDevice>

SimpleCompositor::SimpleCompositor()
    : QWaylandQuickCompositor(0, DefaultExtensions | SubSurfaceExtension)
{
}

void SimpleCompositor::setSource(const QUrl &fileName) {
    QQuickView::setSource(fileName);
    setResizeMode(QQuickView::SizeRootObjectToView);
    setColor(Qt::black);
    winId();
    addDefaultShell();
    createOutput(this, "", "");

    connect(this, &SimpleCompositor::afterRendering, this, &SimpleCompositor::sendCallbacks);
}

QWaylandSurfaceItem *SimpleCompositor::item(QWaylandSurface *surf)
{
    return static_cast<QWaylandSurfaceItem *>(surf->views().first());
}

void SimpleCompositor::destroyWindow(QVariant window) {
    qvariant_cast<QObject *>(window)->deleteLater();
}

/*
 * These handle stuff that may happen with surfaces
 */
void SimpleCompositor::surfaceMapped() {
    QWaylandQuickSurface *surface = qobject_cast<QWaylandQuickSurface *>(sender());
    emit windowAdded(QVariant::fromValue(surface));
}
void SimpleCompositor::surfaceUnmapped() {
    QWaylandQuickSurface *surface = static_cast<QWaylandQuickSurface *>(sender());
    emit windowRemoved(QVariant::fromValue(surface));
}

void SimpleCompositor::surfaceDestroyed() {
    QWaylandQuickSurface *surface = static_cast<QWaylandQuickSurface *>(sender());
}

void SimpleCompositor::sendCallbacks() {
    sendFrameCallbacks(surfaces());
}

/*
 * Below re-implementations of QtWayland methods
 */

void SimpleCompositor::resizeEvent(QResizeEvent *event)
{
    QQuickView::resizeEvent(event);
    QWaylandCompositor::setOutputGeometry(QRect(0, 0, width(), height()));
}

void SimpleCompositor::surfaceCreated(QWaylandSurface *surface) {
    connect(surface, &QWaylandSurface::surfaceDestroyed, this, &SimpleCompositor::surfaceDestroyed);
    connect(surface, &QWaylandSurface::mapped, this, &SimpleCompositor::surfaceMapped);
    connect(surface, &QWaylandSurface::unmapped, this, &SimpleCompositor::surfaceUnmapped);
}
