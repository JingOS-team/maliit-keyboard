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
import QtGraphicalEffects 1.0
import MaliitKeyboard 2.0

JCharKey {
    id: actionKeyRoot

    property string iconNormal: ""
    property string iconShifted: ""
    property string iconCapsLock: ""

    property string iconSourceNormal: ""
    property string iconSourceShifted: ""
    property string iconSourceCapsLock: ""
    property int  imageHeight: 23 * fullScreenItem.screenHeightScale
    property real imageLeftMargin: (actionKeyRoot.width-iconImage.width)/2
    property real imageTopMargin: (actionKeyRoot.height -iconImage.height)/2

    property color colorNormal: Theme.fontColor
    property color colorShifted: Theme.fontColor
    property color colorCapsLock: Theme.fontColor

    property int padding: Device.actionKeyPadding

    noMagnifier: true
    skipAutoCaps: true

    width: panel.keyWidth + padding
    normalColor:  Theme.actionKeyColor
    pressedColor: Theme.actionKeyPressedColor
    borderColor: Theme.actionKeyBorderColor
    hoverColor: "#BDC0C6"

    Item {
        anchors.top: parent.top
        height: parent.height//panel.keyHeight
        width: parent.width

        Image {
            id: iconImage
            source: iconSourceNormal !== "" ? iconSourceNormal
                                            : iconNormal ? Theme.iconsPath + "/%1.png".arg(iconNormal)
                                                         : ""
            property color color: actionKeyRoot.colorNormal
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: imageTopMargin
            anchors.leftMargin: imageLeftMargin
            height: imageHeight
            width: imageHeight
            visible: false
        }

        ColorOverlay {
            cached: true
            anchors.fill: iconImage
            source: iconImage
            color: iconImage.color
            visible: (label == "" && !panel.hideKeyLabels)
        }
    }

    // make sure the icon changes even if the property icon* change on runtime
    state: panel.activeKeypadState
    states: [
        State {
            name: "SHIFTED"
            PropertyChanges {
                target: iconImage
                source: iconSourceShifted !== "" ? iconSourceShifted
                                                 : iconShifted ? Theme.iconsPath + "/%1.png".arg(iconShifted)
                                                               : ""
                color: actionKeyRoot.colorShifted
            }
        },
        State {
            name: "CAPSLOCK"
            PropertyChanges {
                target: iconImage
                source: iconSourceCapsLock !== "" ? iconSourceCapsLock
                                                  : iconCapsLock ? Theme.iconsPath + "/%1.png".arg(iconCapsLock)
                                                                 : ""
                color: actionKeyRoot.colorCapsLock
            }
        }
    ]
}
