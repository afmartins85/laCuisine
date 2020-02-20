/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Quick Controls module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.1
import QtQuick.Window 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import "content"


ApplicationWindow {
    id: applicationWindow1
    visible: true
    width: 1280
    height: 800
//    visibility: Window.FullScreen

    property real opacity_background: 0
    property bool itemSelected: false

    Rectangle {
        color: "black"
        anchors.fill: parent
    }

    toolBar: BorderImage {
        id: borderImage1
        border.bottom: 8
        source: "images/toolbar.png"
        width: parent.width
        height: 100

        Rectangle {
            id: backButton
            width: opacity ? 60 : 0
            anchors.left: parent.left
            anchors.leftMargin: 20
            opacity: stackView.depth > 1 ? 1 : 0
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            height: 60
            radius: 4
            color: backmouse.pressed ? "#222" : "transparent"
            Behavior on opacity { NumberAnimation{} }
            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: "images/navigation_previous_item.png"
            }
            MouseArea {
                id: backmouse
                anchors.fill: parent
                anchors.margins: -10
                onClicked:  {
                    stackView.pop();
                }
            }
        }

        Text {
            font.pixelSize: 42
            Behavior on x { NumberAnimation{ easing.type: Easing.OutCubic} }
            x: backButton.x + backButton.width + 20
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            text: "La Cuisine"
        }

        Row {
            anchors.leftMargin: 1050
            anchors.topMargin: stackView.depth > 1 ? -200 : 0
            anchors.fill: parent
            spacing: 2
            layoutDirection: Qt.LeftToRight
            opacity: stackView.depth > 1 ? 0 : 1
            Behavior on anchors.topMargin { NumberAnimation{ duration: 500 } }
            Behavior on opacity { NumberAnimation{ duration: 1000 } }

            Image { anchors.verticalCenter: parent.verticalCenter; source: "images/Brazil.png"; }
            Image { anchors.verticalCenter: parent.verticalCenter; source: "images/United-States-of-America.png"; }
            Image { anchors.verticalCenter: parent.verticalCenter; source: "images/Spain.png"; }
        }
    }

    Row {

        width: parent.width
        height: 150
        opacity: stackView.depth > 1 ? 0 : 1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        Image { width: 213; height: 150; source: "images/foto_1.png"; }
        Image { width: 213; height: 150; source: "images/foto_2.png"; }
        Image { width: 213; height: 150; source: "images/foto_3.png"; }
        Image { width: 213; height: 150; source: "images/foto_4.png"; }
        Image { width: 213; height: 150; source: "images/foto_5.png"; }
        Image { width: 213; height: 150; source: "images/foto_6.png"; }
    }

    ListModel {
        id: pageModel
        ListElement {
           icon: "images/Bem-vindo.png"
           active: false
        }
        ListElement {
           icon: "images/logo.png"
           active: false
        }
        ListElement {
           icon: "images/tipografia_logo.png"
           active: false
        }
        ListElement {
            page: "content/TabBarPage.qml"
            icon: ""
            active: true
        }
    }

    StackView {
        id: stackView
        anchors.rightMargin: 0
        anchors.fill: parent

        initialItem: Item {
            width: parent.width
            height: parent.height
            ListView {
                contentHeight: 351
                anchors.topMargin: 100
                model: pageModel
                anchors.fill: parent
                delegate: AndroidDelegate {
                    activeButtom: active
                    Image { anchors.horizontalCenter: parent.horizontalCenter;
                    fillMode: Image.PreserveAspectFit;source: icon; }
                    onClicked: {
                        stackView.push(Qt.resolvedUrl(page));
                    }
                }
            }
        }
    }

    Component {
        id: touchStyle
        ButtonStyle {
            panel: Item {
                implicitHeight: 50
                implicitWidth: 320
                BorderImage {
                    anchors.fill: parent
                    antialiasing: true
                    border.bottom: 8
                    border.top: 8
                    border.left: 8
                    border.right: 8
                    anchors.margins: control.pressed ? -4 : 0
                    source: control.pressed ? "../images/button_pressed.png" : "../images/button_default.png"
                    Text {
                        text: control.text
                        anchors.centerIn: parent
                        color: "white"
                        font.pixelSize: 23
                        renderType: Text.NativeRendering
                    }
                }
            }
        }
    }

    statusBar: BorderImage {
        border.top: 0
        source: "images/toolbar.png"
        width: parent.width
        height: 40

        Text {
            font.pixelSize: 12
            Behavior on x { NumberAnimation{ easing.type: Easing.OutCubic} }
            x: backButton.x + backButton.width + 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            color: "white"
            text: "powered by truetech-systems.com"
        }
    }
}
