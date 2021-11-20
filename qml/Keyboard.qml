/*
 * This file is part of Maliit plugins
 *
 * Copyright (C) 2012 Openismus GmbH
 * Copyright (C) 2021 Yu Jiashu <yujiashu@jingos.com>
 *
 * Contact: maliit-discuss@lists.maliit.org
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this list
 * of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list
 * of conditions and the following disclaimer in the documentation and/or other materials
 * provided with the distribution.
 * Neither the name of Nokia Corporation nor the names of its contributors may be
 * used to endorse or promote products derived from this software without specific
 * prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

import QtQuick 2.4

import MaliitKeyboard 2.0

import "keys/"

Item {
    id: fullScreenItem
    objectName: "fullScreenItem"

    property bool landscape: width > height
    readonly property bool tablet: landscape ? width >= Device.gu(90) : height >= Device.gu(90)

    property bool cursorSwipe: false
    property int prevSwipePositionX
    property int prevSwipePositionY
    property int cursorSwipeDuration: 400
    property var timerSwipe: swipeTimer
    property real screenWidthScale: fullScreenItem.width / 888
    property real screenHeightScale: fullScreenItem.height / 646
    
    property variant input_method: maliit_input_method
    property variant event_handler: maliit_event_handler

    property var prePressedKey: null
    property int pressKeyCount: 0
    property bool keyShadowVisible: false
    property int keyLoadCount: 0

    onXChanged: fullScreenItem.reportKeyboardVisibleRect();
    onYChanged: fullScreenItem.reportKeyboardVisibleRect();
    onWidthChanged: fullScreenItem.reportKeyboardVisibleRect();
    onHeightChanged: fullScreenItem.reportKeyboardVisibleRect();


    function reportKeyboardVisibleRect() {

        var vx = 0;
        var vy = wordRibbon.y;
        var vwidth = keyboardSurface.width;
        var vheight = keyboardComp.height + wordRibbon.height;

        var obj = mapFromItem(keyboardSurface, vx, vy, vwidth, vheight);
        // Report visible height of the keyboard to support anchorToKeyboard
        obj.height = fullScreenItem.height - obj.y;

        // Work around QT bug: https://bugreports.qt-project.org/browse/QTBUG-20435
        // which results in a 0 height being reported incorrectly immediately prior
        // to the keyboard closing animation starting, which causes us to report
        // an extra visibility change for the keyboard.
        if (obj.height <= 0 && !canvas.hidingComplete) {
            return;
        }

        maliit_geometry.visibleRect = Qt.rect(obj.x, obj.y, obj.width, obj.height);
    }

    // Autopilot needs to be able to move the cursor even when the layout
    // doesn't provide arrow keys (e.g. in phone mode)
    function sendLeftKey() {
        event_handler.onKeyReleased("", "left");
    }
    function sendRightKey() {
        event_handler.onKeyReleased("", "right");
    }
    function sendUpKey() {
        event_handler.onKeyReleased("", "up");
    }
    function sendDownKey() {
        event_handler.onKeyReleased("", "down");
    }
    function sendHomeKey() {
        event_handler.onKeyReleased("", "home");
    }
    function sendEndKey() {
        event_handler.onKeyReleased("", "end");
    }

    function processSwipe(positionX, positionY) {
        if (positionX < prevSwipePositionX - Device.gu(1) && input_method.surroundingLeft != "") {
            sendLeftKey();
            prevSwipePositionX = positionX
        } else if (positionX > prevSwipePositionX + Device.gu(1) && input_method.surroundingRight != "") {
            sendRightKey();
            prevSwipePositionX = positionX
        }
        if (positionY < prevSwipePositionY - Device.gu(4)) {
            sendUpKey();
            prevSwipePositionY = positionY
        } else if (positionY > prevSwipePositionY + Device.gu(4)) {
            sendDownKey();
            prevSwipePositionY = positionY
        }
    }

    Item {
        id: canvas
        objectName: "MaliitKeyboard" // Allow us to specify a specific keyboard within autopilot.
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width
//        height: fullScreenItem.height * (fullScreenItem.landscape ? Device.keyboardHeightLandscape
//                                                                  : Device.keyboardHeightPortrait)
//                                      + wordRibbon.height + borderTop.height
        height: 273 * fullScreenItem.screenHeightScale

        property int keypadHeight: height;

        visible: true

        //暂时不用联想功能
        property bool wordribbon_visible: false//maliit_word_engine.enabled
        onWordribbon_visibleChanged: fullScreenItem.reportKeyboardVisibleRect();

        property bool languageMenuShown: false
        property alias languageMenu: languageMenu
        property bool extendedKeysShown: false

        property bool firstShow: true
        property bool hidingComplete: false

        property string layoutId: "freetext"

        onXChanged: fullScreenItem.reportKeyboardVisibleRect();
        onYChanged: fullScreenItem.reportKeyboardVisibleRect();
        onWidthChanged: fullScreenItem.reportKeyboardVisibleRect();
        onHeightChanged: fullScreenItem.reportKeyboardVisibleRect();

        opacity: 1//maliit_input_method.opacity

        MouseArea {
            id: swipeArea

            property int jumpBackThreshold: Device.gu(10)

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: (parent.height - canvas.keypadHeight) + wordRibbon.height +
                    borderTop.height

            drag.target: keyboardSurface
            drag.axis: Drag.YAxis;
            drag.minimumY: 0
            drag.maximumY: parent.height
            //fix for lp:1277186
            //only filter children when wordRibbon visible
            drag.filterChildren: wordRibbon.visible
            // Avoid conflict with extended key swipe selection
            enabled: !canvas.extendedKeysShown

            onReleased: {
                if (keyboardSurface.y > jumpBackThreshold) {
                    maliit_geometry.shown = false;
                } else {
                    bounceBackAnimation.from = keyboardSurface.y
                    bounceBackAnimation.start();
                }
            }

            Item {
                id: keyboardSurface
                objectName: "keyboardSurface"

                x:0
                y:0
                width: parent.width
                height: canvas.height

                onXChanged: fullScreenItem.reportKeyboardVisibleRect();
                onYChanged: fullScreenItem.reportKeyboardVisibleRect();
                onWidthChanged: fullScreenItem.reportKeyboardVisibleRect();
                onHeightChanged: fullScreenItem.reportKeyboardVisibleRect();

                Rectangle {
                    width: parent.width
                    height: (1)
                    color: Theme.dividerColor
                    anchors.bottom: wordRibbon.visible ? wordRibbon.top : keyboardComp.top
                }

                WordRibbon {
                    id: wordRibbon
                    objectName: "wordRibbon"

                    visible: canvas.wordribbon_visible

                    anchors.bottom: keyboardComp.top
                    width: parent.width;

                    height: canvas.wordribbon_visible ? Device.wordRibbonHeight
                                                      : 0
                    onHeightChanged: fullScreenItem.reportKeyboardVisibleRect();
                }

                Item {
                    id: keyboardComp
                    objectName: "keyboardComp"

                    height: canvas.keypadHeight - wordRibbon.height + keypad.anchors.topMargin
                    width: parent.width
                    anchors.bottom: parent.bottom

                    onHeightChanged: fullScreenItem.reportKeyboardVisibleRect();

                    Rectangle {
                        id: background
                        anchors.fill: parent
                        color: "#FFE3E5E8"//Theme.backgroundColor
                    }
                
                    Item {
                        id: borderTop
                        width: parent.width
                        anchors.top: parent.top.bottom
                      //  height: wordRibbon.visible ? 0 : Device.top_margin
                        height: 8 * fullScreenItem.screenHeightScale

                    }

                    KeyboardContainer {
                        id: keypad
                        anchors.top: borderTop.bottom
                        anchors.bottom: background.bottom
                        anchors.bottomMargin: (8 * fullScreenItem.screenHeightScale)// Device.bottom_margin
                        width: parent.width
                        hideKeyLabels: fullScreenItem.cursorSwipe

                        onPopoverEnabledChanged: fullScreenItem.reportKeyboardVisibleRect();
                    }

                    LanguageMenu {
                        id: languageMenu
                        objectName: "languageMenu"
                        anchors.centerIn: parent
                        height: contentHeight > keypad.height ? keypad.height : contentHeight
                        width: Device.gu(30);
                    }
                } // keyboardComp
            }
        }

        PropertyAnimation {
            id: bounceBackAnimation
            target: keyboardSurface
            properties: "y"
            easing.type: Easing.OutBounce;
            easing.overshoot: 2.0
            to: 0
        }

        state: "HIDDEN"

        states: [
            State {
                name: "SHOWN"
                PropertyChanges { target: keyboardSurface; y: 0; }
                onCompleted: {
                    canvas.firstShow = false;
                    canvas.hidingComplete = false;
                }
                when: maliit_geometry.shown === true
            },

            State {
                name: "HIDDEN"
                PropertyChanges { target: keyboardSurface; y: canvas.height }
                onCompleted: {
                    canvas.languageMenu.close();
                    keypad.closeExtendedKeys();
                    keypad.activeKeypadState = "NORMAL";
                    keypad.state = "CHARACTERS";
                    maliit_input_method.close();
                    canvas.hidingComplete = true;
                    reportKeyboardVisibleRect();
                    // Switch back to the previous layout if we're in
                    // in a layout like emoji that requests switchBack
                    if (keypad.switchBack && maliit_input_method.previousLanguage) {
                        keypad.switchBack = false;
                        maliit_input_method.activeLanguage = maliit_input_method.previousLanguage;
                    }
                }
                // Wait for the first show operation to complete before
                // allowing hiding, as the conditions when the keyboard
                // has never been visible can trigger a hide operation
                when: maliit_geometry.shown === false && canvas.firstShow === false
            }
        ]
        transitions: Transition {
            NumberAnimation { target: keyboardSurface; properties: "y"; duration: 165}
        }

        Connections {
            target: input_method
            onActivateAutocaps: {
                if (keypad.state == "CHARACTERS" && keypad.activeKeypadState != "CAPSLOCK" && !cursorSwipe) {
                    keypad.activeKeypadState = "SHIFTED";
                    keypad.autoCapsTriggered = true;
                } else {
                    keypad.delayedAutoCaps = true;
                }
            }

            onKeyboardReset: {
                keypad.state = "CHARACTERS"
            }
            onDeactivateAutocaps: {
                if(keypad.autoCapsTriggered) {
                    keypad.activeKeypadState = "NORMAL";
                    keypad.autoCapsTriggered = false;
                }
                keypad.delayedAutoCaps = false;
            }
        }

        MouseArea {
            id: cursorSwipeArea
            anchors.fill: parent
            enabled: cursorSwipe

            Rectangle {
                anchors.fill: parent
                visible: parent.enabled
                color: "#E3E5E8"//Theme.charKeyPressedColor
//                opacity: 0.5
            }

            onMouseXChanged: {
//                processSwipe(mouseX, mouseY)
            }

            onPressed: {
                prevSwipePositionX = mouseX
                prevSwipePositionY = mouseY
                fullScreenItem.timerSwipe.stop()
            }

            onReleased: {
                fullScreenItem.timerSwipe.restart()
            }
        }

    } // canvas

    Timer {
        id: swipeTimer
        interval: cursorSwipeDuration
        running: false
        onTriggered: {
            fullScreenItem.cursorSwipe = false
            // We only enable autocaps after cursor movement has stopped
            if (keypad.delayedAutoCaps) {
                keypad.activeKeypadState = "SHIFTED"
                keypad.delayedAutoCaps = false
            } else {
                keypad.activeKeypadState = "NORMAL"
            }
        }
    }


} // fullScreenItem
