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
import QtQuick.Layouts 1.12
import MaliitKeyboard 2.0

import keys 1.0

KeyPad {
    anchors.fill: parent

    content: c1
    property real ratioW: fullScreenItem.screenWidthScale
    property real ratioH: fullScreenItem.screenHeightScale

    ColumnLayout {
        id: c1
        anchors.fill: parent
        spacing: 5 * ratioH
        RowLayout {
            spacing: 5 * ratioW
            Layout.alignment : Qt.AlignHCenter
            Layout.fillWidth: true
            JEscKey {Layout.leftMargin: 5;  Layout.preferredWidth: 50 * ratioW; Layout.preferredHeight: 39 * ratioH;}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "·"; shifted: "·"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "1"; shifted: "1"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "2"; shifted: "2"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "3"; shifted: "3"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "4"; shifted: "4"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "5"; shifted: "5"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "6"; shifted: "6"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "7"; shifted: "7"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "8"; shifted: "8"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "9"; shifted: "9"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "0"; shifted: "0"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "<"; shifted: "<"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: ">"; shifted: ">"; }
            JBackspaceKey { Layout.rightMargin: 5; Layout.preferredWidth: 77 * ratioW; Layout.preferredHeight: 39 *  ratioH; }
        }

        RowLayout {
            spacing: 5 * ratioW
            Layout.fillWidth: true
            Layout.alignment : Qt.AlignHCenter
            JTabKey { Layout.leftMargin: 5; Layout.preferredWidth: 77 * ratioW ; Layout.preferredHeight: 48 * ratioH;}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "["; shifted: "["; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "]"; shifted: "]"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "{"; shifted: "{"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "}"; shifted: "}"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "#"; shifted: "#"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "%"; shifted: "%"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "^"; shifted: "^"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "*"; shifted: "*"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "+"; shifted: "+"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "="; shifted: "="; }
            JCharKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 * ratioH; label: "\\"; shifted: "\\"; }
            JCharKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 * ratioH; label: "|"; shifted: "|"; }
            JCharKey { Layout.rightMargin: 5; Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 * ratioH; label: "~"; shifted: "~"; }
        }

        RowLayout {
            spacing: 5 * ratioW
            Layout.alignment : Qt.AlignHCenter
            Layout.fillWidth: true
            JCapsKey { enabled: false; Layout.leftMargin: 5; Layout.preferredWidth: 96 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: ":"; shifted: ":"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: ";"; shifted: ";"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "("; shifted: "("; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: ")"; shifted: ")"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "$"; shifted: "$"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "&"; shifted: "&"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "@"; shifted: "@"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "€"; shifted: "€"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "￥"; shifted: "￥"; }
            JCharKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: "฿"; shifted: "฿"; }
            JCharKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: "¢"; shifted: "¢"; }
            JReturnKey { Layout.rightMargin: 5; Layout.preferredWidth: 96 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
        }

        RowLayout {
            spacing: 5 * ratioW
            Layout.alignment : Qt.AlignHCenter
            Layout.fillWidth: true
            JSymbolShiftKey { normalMargin: false; label: "ABC"; shifted: "ABC"; Layout.leftMargin: 5; Layout.preferredWidth: 137 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "…"; shifted: "…"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "."; shifted: "."; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: ","; shifted: ","; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "?"; shifted: "?"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "!"; shifted: "!"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "'"; shifted: "'"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "\""; shifted: "\""; }
            JCharKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: "_"; shifted: "_"; }
            JCharKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: "-"; shifted: "-"; }
            JCharKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: "/"; shifted: "/"; }
            JDirectionKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JSymbolShiftKey{ label: "ABC"; shifted: "ABC"; Layout.rightMargin: 5; Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
        }

        RowLayout {
            spacing: 5 * ratioW
            Layout.alignment : Qt.AlignHCenter
            JControlKey { Layout.leftMargin: 5; Layout.preferredWidth: 77 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JAltKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JHideKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JSpaceKey { id: spaceKey; Layout.fillWidth: true;/* Layout.preferredWidth: 475 * ratioW;*/ Layout.preferredHeight: 48 *  ratioH;}
            JDirectionKey { action:"left"; Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JDirectionKey { action:"down"; Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JDirectionKey { action:"right"; Layout.rightMargin: 5; Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
        }
    } // column
}

