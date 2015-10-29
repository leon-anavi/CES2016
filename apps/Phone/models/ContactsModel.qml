/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

pragma Singleton
import QtQuick 2.0

ListModel {
    function findName(number) {
        for (var i = 0; i < count; i++) {
            var o = get(i)
            if (o.phone === number || o.mobile === number || o.work === number)
                return o.name
        }
        return "Unknown number"
    }

    ListElement {
        name: "Art McGee"
        phone: "503-616-4940"
        mobile: "503-715-6618"
        work: "972-256-9732"
    }

    ListElement {
        name: "Kelly Johnson"
        phone: "503-000-0000"
        mobile: "503-000-0000"
        work: "972-000-0000"
    }

    ListElement {
        name: "Marco Morales"
        phone: "503-000-0000"
        mobile: "503-209-3254"
        work: "972-000-0000"
    }

    ListElement {
        name: "Dana Jonty"
        phone: "503-000-0000"
        mobile: "503-209-3254"
        work: "972-000-0000"
    }

    ListElement {
        name: "Rob Brad"
        phone: "503-000-0000"
        mobile: "503-209-3254"
        work: "972-000-0000"
    }

    ListElement {
        name: "Jojo Derick"
        phone: "503-000-0000"
        mobile: "503-209-3254"
        work: "972-000-0000"
    }

    ListElement {
        name: "Ted Gilbert"
        phone: "503-000-0000"
        mobile: "503-209-3254"
        work: "972-000-0000"
    }
}
