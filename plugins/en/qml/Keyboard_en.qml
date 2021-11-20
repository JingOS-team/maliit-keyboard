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
    property real ratioW: fullScreenItem.screenWidthScale
    property real ratioH: fullScreenItem.screenHeightScale
    anchors.fill: parent

    content: c1
    symbols: "languages/Keyboard_symbols.qml"

    ColumnLayout {
        id: c1
        anchors.fill: parent
        spacing: 5 * ratioH
        RowLayout {
            spacing: 5 * ratioW
            Layout.alignment : Qt.AlignHCenter
            Layout.fillWidth: true
            //Layout.leftMargin: 5 ;
            JEscKey {Layout.leftMargin: 5 * ratioW; Layout.preferredWidth: 50 * ratioW; Layout.preferredHeight: 39 * ratioH;}
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "`"; shifted: "~"; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "1"; shifted: "!"; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "2"; shifted: "@"; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "3"; shifted: "#"; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "4"; shifted: "$"; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "5"; shifted: "%"; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "6"; shifted: "^"; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "7"; shifted: "&"; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "8"; shifted: "*"; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "9"; shifted: "("; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "0"; shifted: ")"; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "-"; shifted: "_"; }
            JSymbolNumKey { Layout.fillWidth: true; Layout.preferredHeight: 39 *  ratioH; label: "="; shifted: "+"; }
            JBackspaceKey { Layout.rightMargin: 5 * ratioW; Layout.preferredWidth: 77 * ratioW; Layout.preferredHeight: 39 *  ratioH; }
        }

        RowLayout {
            spacing: 5 * ratioW
            Layout.fillWidth: true
            Layout.alignment : Qt.AlignHCenter
            JTabKey {Layout.leftMargin: 5 * ratioW; Layout.preferredWidth: 77 * ratioW ; Layout.preferredHeight: 48 * ratioH;}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "q"; shifted: "Q"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "w"; shifted: "W"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "e"; shifted: "E"; extended: ["è", "é", "ê", "ë", "€"]; extendedShifted: ["È","É", "Ê", "Ë", "€"];}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "r"; shifted: "R"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "t"; shifted: "T"; extended: ["þ"]; extendedShifted: ["Þ"];}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "y"; shifted: "Y"; extended: ["ý", "¥"]; extendedShifted: ["Ý", "¥"]}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "u"; shifted: "U"; extended: ["û","ù","ú","ü"]; extendedShifted: ["Û","Ù","Ú","Ü"]}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "i"; shifted: "I"; extended: ["î","ï","ì","í"]; extendedShifted: ["Î","Ï","Ì","Í"]}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "o"; shifted: "O"; extended: ["ö","ô","ò","ó"]; extendedShifted: ["Ö","Ô","Ò","Ó"]}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 * ratioH; label: "p"; shifted: "P"; }
            JSymbolNumKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: "["; shifted: "{"; }
            JSymbolNumKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: "]"; shifted: "}"; }
            JSymbolNumKey { Layout.rightMargin: 5 * ratioW; Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: "\\"; shifted: "|"; }
        }

        RowLayout {
            spacing: 5 * ratioW
            Layout.alignment : Qt.AlignHCenter
            Layout.fillWidth: true
            JCapsKey {Layout.leftMargin: 5 * ratioW; Layout.preferredWidth: 96 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "a"; shifted: "A"; extended: ["ä","à","â","ª","á","å", "æ"]; extendedShifted: ["Ä","À","Â","ª","Á","Å","Æ"];}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "s"; shifted: "S"; extended: ["ß","$"]; extendedShifted: ["$"];}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "d"; shifted: "D"; extended: ["ð"]; extendedShifted: ["Ð"];}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "f"; shifted: "F"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "g"; shifted: "G"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "h"; shifted: "H"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "j"; shifted: "J"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "k"; shifted: "K"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "l"; shifted: "L"; }
            JSymbolNumKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: ";"; shifted: ":"; }
            JSymbolNumKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: "'"; shifted: "\""; }
            JReturnKey { Layout.rightMargin: 5 * ratioW; Layout.preferredWidth: 96 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
        }

        RowLayout {
            spacing: 5 * ratioW
            Layout.alignment : Qt.AlignHCenter
            Layout.fillWidth: true
            JShiftKey {Layout.leftMargin: 5 * ratioW; Layout.preferredWidth: 137 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "z"; shifted: "Z"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "x"; shifted: "X"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "c"; shifted: "C"; extended: ["ç"]; extendedShifted: ["Ç"]}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "v"; shifted: "V"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "b"; shifted: "B"; }
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "n"; shifted: "N"; extended: ["ñ"]; extendedShifted: ["Ñ"]}
            JCharKey { Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH; label: "m"; shifted: "M"; }
            JSymbolNumKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: ","; shifted: "<"; }
            JSymbolNumKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: "."; shifted: ">"; }
            JSymbolNumKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH; label: "/"; shifted: "?"; }
            JDirectionKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JSymbolShiftKey{Layout.rightMargin: 5 * ratioW; Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
        }

        RowLayout {
            spacing: 5 * ratioW
            Layout.alignment : Qt.AlignHCenter
            JControlKey {Layout.leftMargin: 5 * ratioW; Layout.preferredWidth: 77 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JAltKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JHideKey { Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JSpaceKey { id: spaceKey; Layout.fillWidth: true; Layout.preferredHeight: 48 *  ratioH;}
            JDirectionKey { action:"left"; Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JDirectionKey { action:"down"; Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
            JDirectionKey { action:"right"; Layout.rightMargin: 5 * ratioW; Layout.preferredWidth: 55 * ratioW; Layout.preferredHeight: 48 *  ratioH;}
        }
    } // column
}
