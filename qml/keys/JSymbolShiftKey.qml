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
    label: ".?123"
    shifted: ".?123"
    action: "symbols"

    property bool normalMargin: true
    overridePressArea: true

    textTopMargin: 25 * fullScreenItem.screenHeightScale
    txtHorizontalAlignment: normalMargin ? Text.AlignRight : Text.Left
    textRightMargin: normalMargin ? 13 * fullScreenItem.screenWidthScale : 0
    textLeftMargin: normalMargin ? 0 : 13 * fullScreenItem.screenWidthScale
    fontSize: 14 *  fullScreenItem.screenWidthScale
    switchBackFromSymbols: true

    onPressed: {
        Feedback.keyPressed();
    }
    onReleased: {
        fullScreenItem.keyLoadCount=0
        if (panel.state === "CHARACTERS")
            panel.state = "SYMBOLS";
        else
            panel.state = "CHARACTERS";
    }
}
