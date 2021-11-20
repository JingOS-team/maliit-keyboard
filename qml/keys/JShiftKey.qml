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
    id: shiftkey

    imageHeight: 23 * fullScreenItem.screenHeightScale
    imageLeftMargin: 11 * fullScreenItem.screenWidthScale
    imageTopMargin: 17 * fullScreenItem.screenHeightScale

    property string shiftKeyStatus: panel.activeKeypadState

    iconSourceNormal: Theme.imagesPath + "/shift.png"
    iconSourceShifted: Theme.imagesPath + "/shift.png"
    iconSourceCapsLock: Theme.imagesPath + "/shift-locked.png"
    action: "shift"
    enabled: shiftKeyStatus=="CAPSLOCK" ? false : true
    overridePressArea: true

    onPressed: {
        Feedback.keyPressed();
    }

    onReleased: {
        if (panel.activeKeypadState == "NORMAL"){
            panel.activeKeypadState = "SHIFTED";
        }
        else if (panel.activeKeypadState == "SHIFTED"){
            panel.activeKeypadState = "NORMAL"
        }
    }
    onShiftKeyStatusChanged: {
        if(shiftKeyStatus=="NORMAL"){
            normalColor=Theme.actionKeyColor
        }else if(shiftKeyStatus=="SHIFTED"){
            normalColor=Theme.charKeyColor
        }else if(shiftKeyStatus=="CAPSLOCK"){
            normalColor=Theme.actionKeyColor
        }
    }
}
