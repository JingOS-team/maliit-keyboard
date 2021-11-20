/*
 * Copyright 2013 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4

import MaliitKeyboard 2.0

ActionKey {
    iconSourceNormal: Theme.imagesPath + "/keyboard-caps-disabled.svg"
    iconSourceShifted: Theme.imagesPath + "/keyboard-caps-enabled.svg"
    iconSourceCapsLock: Theme.imagesPath + "/keyboard-caps-locked.svg"

    action: "shift"

    overridePressArea: true
    acceptDoubleClick: true

    property bool doubleClick: false;

    onPressed: {
        if (doubleClick) {
            doubleClick = false;
            return;
        }
        Feedback.keyPressed();

        if (panel.activeKeypadState == "NORMAL")
            panel.activeKeypadState = "SHIFTED";
        else if (panel.activeKeypadState == "SHIFTED")
            panel.activeKeypadState = "NORMAL"
        else if (panel.activeKeypadState == "CAPSLOCK")
            panel.activeKeypadState = "NORMAL"
    }

    onPressAndHold: {
        Feedback.startPressEffect();

        panel.activeKeypadState = "CAPSLOCK"
    }

    onDoubleClicked: {
        Feedback.keyPressed();

        panel.activeKeypadState = "CAPSLOCK"
        doubleClick = true;
    }
}
