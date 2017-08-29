/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    function reload(lng) {
        vi18n.setLanguage(lng);
        pageStack.clear();
        pageStack.push(Qt.resolvedUrl("Main.qml"));
    }

    SilicaFlickable {
        id:list
        anchors.fill: parent
        contentHeight: column.height

        VerticalScrollDecorator { flickable: list }

        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: vi18n.get("title")
            }
            Label {
                x: Theme.paddingLarge
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    topMargin: Theme.paddingLarge
                    bottomMargin: Theme.paddingLarge
                }
                text: vi18n.get("hello")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }

            Label {
                x: Theme.paddingLarge
                text: vi18n.get("main.currentis").arg(vi18n.languageStr)
                color: Theme.secondaryHighlightColor
            }

            Text {
                text: vi18n.get("main.description")
                x: Theme.paddingLarge
                width: parent.width - (2*Theme.paddingLarge)
                color: Theme.secondaryHighlightColor
                wrapMode: Text.WordWrap
            }

            ComboBox {
                label: vi18n.get("menu.title")
                width: parent.width

                menu: ContextMenu {
                    MenuItem { text: vi18n.get("menu.en"); onClicked: {reload("en");} }
                    MenuItem { text: vi18n.get("menu.fr"); onClicked: {reload("fr");} }
                    MenuItem { text: vi18n.get("menu.de"); onClicked: {reload("de");} }
                    MenuItem { text: vi18n.get("menu.ru"); onClicked: {reload("ru");} }
                    MenuItem { text: vi18n.get("menu.es"); onClicked: {reload("es");} }
                    MenuItem { text: vi18n.get("menu.fi"); onClicked: {reload("fi");} }
                }

            }


            Button {
               text: vi18n.get("list.description")
               width: parent.width
               onClicked: {pageStack.push(Qt.resolvedUrl("List.qml"));}
            }

        }
    }
}


