/*
 * Copyright 2013 Canonical Ltd.
 * Copyright 2021 Yu Jiashu <yujiashu@jingos.com>
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

JActionKey {
    property string capsKeyStatus: panel.activeKeypadState

    textTopMargin: 22 * fullScreenItem.screenHeightScale
    txtHorizontalAlignment: Text.AlignLeft
    textLeftMargin: 13 *  fullScreenItem.screenWidthScale

    label: "caps lock";
    shifted: "caps lock";
    action: "caps lock";

    fontSize: 14 *  fullScreenItem.screenWidthScale
    overridePressArea: true

    switchBackFromSymbols: true

    onPressed: {
        Feedback.keyPressed();

    }

    onReleased: {
        if (panel.activeKeypadState == "NORMAL")
            panel.activeKeypadState = "CAPSLOCK";
        else if (panel.activeKeypadState == "CAPSLOCK")
            panel.activeKeypadState = "NORMAL"
        else if (panel.activeKeypadState == "SHIFTED")
            panel.activeKeypadState = "CAPSLOCK"
    }

    onCapsKeyStatusChanged: {
        if(capsKeyStatus=="NORMAL"){
            normalColor=Theme.actionKeyColor
        }else if(capsKeyStatus=="CAPSLOCK"){
            normalColor=Theme.charKeyColor
        }
    }
}
