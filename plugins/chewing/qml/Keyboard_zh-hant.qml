/*
 * Copyright 2016 Canonical Ltd.
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

import QtQuick 2.0

import MaliitKeyboard 2.0

import keys 1.0

KeyPad {
    anchors.fill: parent

    content: c1
    symbols: "languages/Keyboard_symbols.qml"

    Column {
        id: c1
        anchors.fill: parent
        spacing: 0
        property real offset: Device.gu(0.3)

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { valueToSubmit: "1"; annotation: valueToSubmit; label: "ㄅ"; shifted: "1"; leftSide: true; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "2"; annotation: valueToSubmit; label: "ㄉ"; shifted: "2"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "3"; annotation: valueToSubmit; label: "ˇ"; shifted: "3"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "4"; annotation: valueToSubmit; label: "ˋ"; shifted: "4"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "5"; annotation: valueToSubmit; label: "ㄓ"; shifted: "5"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "6"; annotation: valueToSubmit; label: "ˊ"; shifted: "6"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "7"; annotation: valueToSubmit; label: "˙"; shifted: "7"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "8"; annotation: valueToSubmit; label: "ㄚ"; shifted: "8"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "9"; annotation: valueToSubmit; label: "ㄞ"; shifted: "9"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "0"; annotation: valueToSubmit; label: "ㄢ"; shifted: "0"; rightSide: true; textCenterOffset: c1.offset; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { valueToSubmit: "q"; annotation: valueToSubmit; label: "ㄆ"; shifted: "q"; leftSide: true; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "w"; annotation: valueToSubmit; label: "ㄊ"; shifted: "w"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "e"; annotation: valueToSubmit; label: "ㄍ"; shifted: "e"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "r"; annotation: valueToSubmit; label: "ㄐ"; shifted: "r"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "t"; annotation: valueToSubmit; label: "ㄔ"; shifted: "t"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "y"; annotation: valueToSubmit; label: "ㄗ"; shifted: "y"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "u"; annotation: valueToSubmit; label: "ㄧ"; shifted: "u"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "i"; annotation: valueToSubmit; label: "ㄛ"; shifted: "i"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "o"; annotation: valueToSubmit; label: "ㄟ"; shifted: "o"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "p"; annotation: valueToSubmit; label: "ㄣ"; shifted: "p"; rightSide: true; textCenterOffset: c1.offset; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { valueToSubmit: "a"; annotation: valueToSubmit; label: "ㄇ"; shifted: "a"; leftSide: true; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "s"; annotation: valueToSubmit; label: "ㄋ"; shifted: "s"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "d"; annotation: valueToSubmit; label: "ㄎ"; shifted: "d"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "f"; annotation: valueToSubmit; label: "ㄑ"; shifted: "f"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "g"; annotation: valueToSubmit; label: "ㄕ"; shifted: "g"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "h"; annotation: valueToSubmit; label: "ㄘ"; shifted: "h"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "j"; annotation: valueToSubmit; label: "ㄨ"; shifted: "j"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "k"; annotation: valueToSubmit; label: "ㄜ"; shifted: "k"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "l"; annotation: valueToSubmit; label: "ㄠ"; shifted: "l"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: ";"; annotation: valueToSubmit; label: "ㄤ"; shifted: ";"; rightSide: true; textCenterOffset: c1.offset; }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter;
            spacing: 0

            CharKey { valueToSubmit: "z"; annotation: valueToSubmit; label: "ㄈ"; shifted: "z"; leftSide: true; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "x"; annotation: valueToSubmit; label: "ㄌ"; shifted: "x"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "c"; annotation: valueToSubmit; label: "ㄏ"; shifted: "c"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "v"; annotation: valueToSubmit; label: "ㄒ"; shifted: "v"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "b"; annotation: valueToSubmit; label: "ㄖ"; shifted: "b"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "n"; annotation: valueToSubmit; label: "ㄙ"; shifted: "n"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "m"; annotation: valueToSubmit; label: "ㄩ"; shifted: "m"; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: ","; annotation: valueToSubmit; label: "ㄝ"; shifted: ","; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "."; annotation: valueToSubmit; label: "ㄡ"; shifted: "."; textCenterOffset: c1.offset; }
            CharKey { valueToSubmit: "/"; annotation: valueToSubmit; label: "ㄥ"; shifted: "/"; rightSide: true; textCenterOffset: c1.offset; }
        }

        Item {
            anchors.left: parent.left
            anchors.right: parent.right

            height: panel.keyHeight + Device.row_margin;

            SymbolShiftKey { id: symShiftKey; label: "符号";             anchors.left: parent.left; height: parent.height; }
            LanguageKey    { id: languageMenuButton;                     anchors.left: symShiftKey.right; height: parent.height; }
            CharKey        { id: dotKey;      label: "。"; extended: [",", "，"]; extendedShifted: [",", "，"]; shifted: "。"; anchors.left: languageMenuButton.right; height: parent.height; }
            SpaceKey       { id: spaceKey;                               anchors.left: dotKey.right; anchors.right: csymKey.left; noMagnifier: true; height: parent.height; }
            CharKey        { id: csymKey; valueToSubmit: "-"; annotation: valueToSubmit; label: "ㄦ"; shifted: "-";    anchors.right: backspaceKey.left; }
            BackspaceKey   { id: backspaceKey; anchors.right: enterKey.left; width: languageMenuButton.width; }
            ReturnKey      { id: enterKey;                               anchors.right: parent.right; height: parent.height; }
        }
    } // column
}
