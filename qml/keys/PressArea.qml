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

import MaliitKeyboard 2.0

MultiPointTouchArea {
    id: root

    property bool pressed: false
    property bool swipedOut: false
    property bool horizontalSwipe: false
    property bool held: false
    property alias mouseX: point.x
    property alias mouseY: point.y
    property real startY
    mouseEnabled: true

    property bool acceptDoubleClick: false
    maximumTouchPoints: 1

    /// Same as MouseArea pressAndHold()
    signal pressAndHold()

    signal doubleClicked()

    /// Cancels the current pressed state of the mouse are
    function cancelPress() {
        pressed = false;
        holdTimer.stop();
    }

    touchPoints: [
        TouchPoint { 
            id: point
            property double lastY
            property double lastYChange

            onYChanged: {
                if (point.y > root.y + root.height) {
                    if (!swipedOut) {
                        // We've swiped out of the key
                        swipedOut = true;
                        holdTimer.stop();
                    }

                    var distance = point.y - lastY;

                    if ((lastYChange * distance > 0 || Math.abs(distance) > Device.gu(1)) && !held) {
//                        keyboardSurface.y += distance;
                        lastY = point.y;
                        lastYChange = distance;
                    }

//                    if(point.sceneY > fullScreenItem.height - Device.gu(4) && point.y > startY + Device.gu(8) && !held) {
//                        maliit_input_method.hide();
//                    }
                } else {
                    lastY = point.y;
                }
            }
        }
    ]

    Timer {
        id: holdTimer
        interval: 300
        onTriggered: {
            if (root.pressed) {
                root.pressAndHold();
                held = true;
            }
        }
    }

    Timer {
        id: doubleClickTimer
        interval: 400 // Default Qt double click interval
    }

    onPressed: {
        pressed = true;
        held = false;
        swipedOut = false;
        startY = point.y;
        holdTimer.restart();

        if (doubleClickTimer.running) {
            if (panel.lastKeyPressed == root) {
                doubleClicked();
            }
        } else {
            if (acceptDoubleClick) {
                doubleClickTimer.restart();
            }
            panel.lastKeyPressed = root
        }
    }

    onReleased: {
        // Allow the user to swipe away the keyboard
//        if (point.y > startY + Device.gu(8) && !held) {
//            maliit_input_method.hide();
//        } else {
//            bounceBackAnimation.from = keyboardSurface.y;
//            bounceBackAnimation.start();
//        }
        pressed = false;
        held = false;
        holdTimer.stop();
    }
}
