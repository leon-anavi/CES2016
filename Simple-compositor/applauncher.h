/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */


#ifndef APPLAUNCHER_H
#define APPLAUNCHER_H

#include <QObject>
#include <QProcess>

class AppLauncher : public QObject
{
    Q_OBJECT
public:
    typedef enum {
        STDERR,
        STDOUT
    } OutputType;

    explicit AppLauncher(QObject *parent = 0);
    ~AppLauncher();

signals:
    void processAdded(qint64 id);
    void processDied(qint64 id);
    void processRemoved(qint64 id);

public slots:
    qint64 launchProcess(QString program, QStringList parameters);
    void killProcess(qint64 id);
    void handleChildStdout();
    void handleChildStderr();
    void handleChildExit(int exitCode);

private:
    QHash<qint64, QProcess*> m_processes;
    void handleChildPrintout(QProcess *proc, OutputType type);
};

#endif // APPLAUNCHER_H
