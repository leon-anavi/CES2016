/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */


#include <QDebug>

#include "applauncher.h"

AppLauncher::AppLauncher(QObject *parent) : QObject(parent)
{

}

AppLauncher::~AppLauncher()
{

}

void AppLauncher::handleChildStderr(){
    qDebug() << "Triggered stderr";
    QProcess *proc = (QProcess *)this->sender();
    proc->setReadChannel(QProcess::StandardError);
    handleChildPrintout(proc, AppLauncher::STDERR);
}

void AppLauncher::handleChildStdout(){
    qDebug() << "Triggered stdout";
    QProcess *proc = (QProcess *)this->sender();
    proc->setReadChannel(QProcess::StandardOutput);
    handleChildPrintout(proc, AppLauncher::STDOUT);
}

void AppLauncher::handleChildPrintout(QProcess *proc, OutputType type) {
    QString typeStr = "unknown";
    const int MAX_READ = 1024;
    int pid = proc->pid();
    char data[MAX_READ];

    switch (type) {
    case AppLauncher::STDERR:
        typeStr = "STDERR";
        break;
    case AppLauncher::STDOUT:
        typeStr = "STDOUT";
        break;
    default:
        qDebug() << "Unknown output type";
    }

    while (proc->readLine(data, MAX_READ) > 0) {
        qDebug().noquote().nospace() << pid << " [" << typeStr << "] " << QString(data).trimmed();
    }
}

void AppLauncher::handleChildExit(int exitCode) {
    QProcess *child = (QProcess *)this->sender();
    qint64 pid = 0;
    for (QHash<qint64, QProcess*>::iterator i = m_processes.begin(); i != m_processes.end(); i++) {
        if (i.value() == child) {
            pid = i.key();
            break;
        }
    }
    if (pid != 0) {
        emit processDied(pid);
        m_processes.remove(pid);
        emit processRemoved(pid);
    } else {
        qDebug() << "Received exit from unknown child!";
    }

}

qint64 AppLauncher::launchProcess(QString program, QStringList parameters){
    QProcess *process = new QProcess(this);
    qDebug() << "Launching " << program << " " << parameters;

    connect(process, &QProcess::readyReadStandardOutput,this, &AppLauncher::handleChildStdout);
    connect(process, &QProcess::readyReadStandardError, this, &AppLauncher::handleChildStderr);
    connect(process, SIGNAL(finished(int)), this, SLOT(handleChildExit(int)));


    process->start(program, parameters);

    m_processes.insert(process->pid(), process);
    emit processAdded(process->pid());

    return process->pid();
}

void AppLauncher::killProcess(qint64 id){
    qDebug() << "Killing " << id;

    if (m_processes.contains(id)){
        QProcess *process = m_processes[id];
        if (process) {
            process->kill();
        } else {
            qDebug() << "Process is null!";
        }
    }
}

