/*
 * This file is part of Maliit Plugins
 *
 * Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies). All rights reserved.
 * Copyright (C) 2021 Yu Jiashu <yujiashu@jingos.com>
 *
 * Contact: Mohammad Anwari <Mohammad.Anwari@nokia.com>
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

#include "models/text.h"
#include "editor.h"

#include <QtGui/QKeyEvent>
#include <QTimer>
#include <maliit/namespace.h>
#include <xkbcommon/xkbcommon.h>

namespace MaliitKeyboard {

Editor::Editor(const EditorOptions &options,
               Model::Text *text,
               Logic::AbstractWordEngine *word_engine,
               QObject *parent)
    : AbstractTextEditor(options, text, word_engine, parent)
    , m_host(nullptr)
{
    m_kwinInterface = new QDBusInterface("org.kde.KWin", "/KWin", "org.kde.KWin", QDBusConnection::sessionBus(), this);
}

Editor::~Editor() = default;

void Editor::setHost(MAbstractInputMethodHost *host)
{
    m_host = host;
}

void Editor::sendPreeditString(const QString &preedit,
                               Model::Text::PreeditFace face,
                               const Replacement &replacement)
{
    if (not m_host) {
        qWarning() << __PRETTY_FUNCTION__
                   << "Host not set, ignoring.";
        return;
    }

    QList<Maliit::PreeditTextFormat> format_list;
    const int start (0);
    const int length (preedit.length());

    format_list.append(Maliit::PreeditTextFormat(start,
                                                 length,
                                                 static_cast< ::Maliit::PreeditFace>(face)));

    m_host->sendPreeditString(preedit, format_list, replacement.start,
                              replacement.length, replacement.cursor_position);
}

void Editor::sendCommitString(const QString &commit)
{
    if (not m_host) {
        qWarning() << __PRETTY_FUNCTION__
                   << "Host not set, ignoring.";
        return;
    }

    m_host->sendCommitString(commit);
}

void Editor::sendKeyEvent(const QKeyEvent &ev)
{
    uint32_t keySym = -1;
    uint32_t state = -1;

    switch (ev.key()) {
    case Qt::Key_Backspace:
        keySym = XKB_KEY_BackSpace;
        break;
    case Qt::Key_Return:
        keySym = XKB_KEY_Return;
        break;
    case Qt::Key_Space:
        keySym = XKB_KEY_space;
        break;
    case Qt::Key_Left:
        keySym = XKB_KEY_Left;
        break;
    case Qt::Key_Right:
        keySym = XKB_KEY_Right;
        break;
    case Qt::Key_Up:
        keySym = XKB_KEY_Up;
        break;
    case Qt::Key_Down:
        keySym = XKB_KEY_Down;
        break;
    case Qt::Key_Shift:
        keySym = XKB_KEY_Shift_L;
        break;
    case Qt::Key_Control:
        keySym = XKB_KEY_Control_L;
        break;
    case Qt::Key_Alt:
        keySym = XKB_KEY_Alt_L;
        break;
    case Qt::Key_Escape:
        keySym = XKB_KEY_Escape;
        break;
    case Qt::Key_Tab:
        keySym = XKB_KEY_Tab;
        break;
    default:
        break;
    }

    if (keySym == -1)
        return;

    if (ev.type() != QEvent::KeyPress && ev.type() !=  QEvent::KeyRelease)
        return;

    state = ev.type() == QEvent::KeyPress ? 1 : 0;
    if (m_kwinInterface->isValid()) {
        m_kwinInterface->asyncCall("sendFakeKey", keySym, state);
    }

//    if (not m_host) {
//        qWarning() << __PRETTY_FUNCTION__
//                     << "Host not set, ignoring.";
//        return;
//    }

//    m_host->sendKeyEvent(ev);
}

void Editor::invokeAction(const QString &action, const QKeySequence &sequence)
{
    if (not m_host) {
        qWarning() << __PRETTY_FUNCTION__
                     << "Host not set, ignoring.";
        return;
    }

    m_host->invokeAction(action, sequence);
}

} // namespace MaliitKeyboard
