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
import QtQuick.Controls 2.1
import MaliitKeyboard 2.0

import "languages.js" as Languages

JActionKey {
    label: " ";
    shifted: " ";
    normalColor: Theme.charKeyColor
    pressedColor: Theme.charKeyPressedColor
    hoverColor: "#F3F4F4"
    action: "space"

    switchBackFromSymbols: true
    overridePressArea: true

//    Label {
//        anchors.centerIn: parent
//        anchors.verticalCenterOffset: -parent.rowMargin / 2 - Device.gu(0.15)
//        font.family: Theme.fontFamily
//        font.weight: Font.Light
//        font.pixelSize: parent.fontSize * 0.6
//        opacity: Theme.spaceOpacity
//        text: Languages.languageIdToName(maliit_input_method.activeLanguage)
//        horizontalAlignment: Text.AlignHCenter
//        visible: !panel.hideKeyLabels
//        color: Theme.fontColor
//    }

    MouseArea {
        id: swipeArea
        anchors.fill: parent

        onPressed: {
            spaceKey.currentlyPressed = true
            fullScreenItem.timerSwipe.stop()
        }

        onReleased: {
            spaceKey.currentlyPressed = false
            event_handler.onKeyReleased("", "space")
            if (switchBackFromSymbols && panel.state === "SYMBOLS") {
                panel.state = "CHARACTERS"
            }
        }

    }

}
