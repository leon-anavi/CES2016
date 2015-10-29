/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton
import QtQuick 2.0

Item {
    property string activeApp: "home"
    property string activeSetting: "settings"
    property bool showKeyboard: false
    property bool showSettings: false
}
