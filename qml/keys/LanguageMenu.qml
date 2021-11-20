/*
 * Copyright 2013 Canonical Ltd.
 * Copyright 2019 Jan Arne Petersen
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
import QtQuick.Controls 2.13
import MaliitKeyboard 2.0

import "languages.js" as Languages

Menu {

    modal: true

    Repeater {
        model: maliit_input_method.enabledLanguages

        delegate: MenuItem {
            text: Languages.languageIdToName(modelData)
            checkable: true
            autoExclusive: true
            checked: maliit_input_method.activeLanguage == modelData
            onClicked: {
                maliit_input_method.activeLanguage = modelData
                canvas.languageMenu.close()
            }
        }
    }

    MenuSeparator {
    }

    MenuItem {
        id: settingsItem
        text: qsTr("Settings") + "…"
        onClicked: {
            Qt.openUrlExternally("settings:///system/language")
            canvas.languageMenu.close();
            maliit_input_method.hide();
        }
    }
}
