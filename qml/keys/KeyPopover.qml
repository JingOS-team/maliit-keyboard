/*
 * Copyright 2014 Canonical Ltd.
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

import QtQuick.Window 2.0

Item {
    id: popover

    property Item currentlyAssignedKey
    property alias anchorItem: __anchorItem

    property int currentlyAssignedKeyParentY: currentlyAssignedKey != null ? currentlyAssignedKey.parent.y : 0
    property int currentlyAssignedKeyX: currentlyAssignedKey != null ? currentlyAssignedKey.x : 0
    property int currentlyAssignedKeyY: currentlyAssignedKey != null ? currentlyAssignedKey.y : 0

    onCurrentlyAssignedKeyXChanged: __repositionPopoverTo(currentlyAssignedKey)
    onCurrentlyAssignedKeyYChanged: __repositionPopoverTo(currentlyAssignedKey)
    onCurrentlyAssignedKeyParentYChanged: __repositionPopoverTo(currentlyAssignedKey);

    onCurrentlyAssignedKeyChanged:
    {
        if (currentlyAssignedKey == null)
            return;

        __repositionPopoverTo(currentlyAssignedKey);
    }

    ///
    // Item gets repositioned above the currently active key on keyboard.
    // extended keys area will center on top of this
    Item {
        id: __anchorItem
        width: 71 * fullScreenItem.screenHeightScale//panel.keyWidth
        height: 71 * fullScreenItem.screenHeightScale//panel.keyHeight
    }

    function __repositionPopoverTo(item)
    {
        if(item) {
            var point = popover.mapFromItem(item, item.x, item.y)
            if (item.parent.parent.parent.objectName == "emojiGrid") {
                __anchorItem.x = point.x;
            } else { 
                __anchorItem.x = item.x + item.parent.x
            }
            __anchorItem.y = point.y - 77 * fullScreenItem.screenHeightScale;
        }
    }
}
