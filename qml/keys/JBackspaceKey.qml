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
    imageHeight: 22 * fullScreenItem.screenHeightScale
    imageLeftMargin: 45 * fullScreenItem.screenWidthScale
    imageTopMargin: 10 * fullScreenItem.screenHeightScale

    iconSourceNormal: Theme.imagesPath + "/backspace-delete-button.png"
    iconSourceShifted: Theme.imagesPath + "/backspace-delete-button.png"
    iconSourceCapsLock: Theme.imagesPath + "/backspace-delete-button.png"
    action: "backspace";
    switchBackFromSymbols: true
}
