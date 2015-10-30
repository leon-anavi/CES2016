/* Copyright (C) 2015, Jaguar Land Rover. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import QtQuick 2.0

Item {
    id: root

    property var ipAddresses: []
    property var ip6addresses: []
    property string softwareVersion
    property string buildId
    property string nameServer
    property string defaultGateway
}
