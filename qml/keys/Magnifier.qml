/*
 * Copyright 2013 Canonical Ltd.
 * Copyright 2021 Yu Jiashu <yujiashu@jingos.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.4
import QtGraphicalEffects 1.12
import MaliitKeyboard 2.0

KeyPopover {
    id: root

    width: 71 * fullScreenItem.screenHeightScale
    height: 71 * fullScreenItem.screenHeightScale

    property bool shown: false

    visible: false

    onShownChanged: {
        if (shown) {
            hidePopperAnimation.stop();
            root.visible = true
            popper.animationStep = 1
        } else {
            hidePopperAnimation.start();
        }
    }

    DropShadow {
        anchors.fill: popper
        radius: 12
        samples: 25
        color: Qt.rgba(0,0,0, 0.5)
        source: popper
        verticalOffset: 2
    }

    Rectangle {
        id: popper

        width: parent.width
        height: parent.height
        property real animationStep: 0

        anchors.centerIn: anchorItem
        scale: animationStep
        transformOrigin: Item.Bottom
        opacity: animationStep

        color: Theme.charKeyColor
        radius: 20 * fullScreenItem.screenHeightScale//8 * (0.8)

        onXChanged: {
            if (x < Device.popoverEdgeMargin) {
                anchorItem.x += Math.abs(x) + Device.popoverEdgeMargin;
                return;
            }
            var rightEdge = (x + width);
            if ( rightEdge > (panel.width - Device.popoverEdgeMargin)) {
                var diff = rightEdge - panel.width;
                anchorItem.x -= diff + Device.popoverEdgeMargin;
            }
        }

        Text {
            id: label
            anchors.centerIn: parent
            height: parent.height
            text: currentlyAssignedKey ? currentlyAssignedKey.valueToSubmit : ""
            font.family: Theme.fontFamily
            font.weight: Font.Light
            font.pixelSize: panel.keyHeight * 0.6
            verticalAlignment: Text.AlignVCenter

            color: Theme.fontColor
        }

        NumberAnimation {
            id: hidePopperAnimation
            target: popper
            property: "animationStep"
            to: 0
            duration: 50
            easing.type: Easing.InOutQuad
            onStopped: {
                root.visible = false;
            }
        }
    }
}
