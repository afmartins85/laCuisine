import QtQuick 2.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import "../content"

Item {
    id: listDelegate
    width: parent.width
    height: 88

    property alias name: textItem.text
    property alias cost: costItem.text
    property alias ilustration: ilustrationImage.source
    property var itemWindow: ItemPage {}
    signal clicked

    Rectangle {
        width: parent.width
        height: parent.height
        color: "black"
    }

    BorderImage {
        source: "../images/list-divider-light.png"
        width: parent.width - 50
        height: 1
        border.bottom: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Item {
        id: add
        width: parent.width
        height: parent.height
        anchors.centerIn: parent.center

        Image {
            id: ilustrationImage
            anchors.verticalCenter: parent.verticalCenter
            source: modelData
            anchors.left: parent.left
            anchors.leftMargin: 55
        }

        Text {
            id: textItem
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: ilustrationImage.right
            anchors.leftMargin: 10
            color: "white"
            font.pixelSize: 16
            text: modelData
        }

        Image {
            id: separetorBar1
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: costRow.left
            anchors.rightMargin: 10
            source: "../images/div_tab.png"
        }

        Row {
            id: costRow
            spacing: 8

            anchors.verticalCenter: parent.verticalCenter
            anchors.right: separetorBar2.left
            anchors.rightMargin: 10

            Text {
                color: "white"
                font.pixelSize: 14
                font.bold: true
                text: "R$"
            }

            Text {
                id: costItem
                color: "white"
                font.pixelSize: 20
                font.family: "Arial"
                font.bold: true
                text: modelData
            }
        }

        Image {
            id: separetorBar2
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: addButtom.left
            anchors.rightMargin: 30
            source: "../images/div_tab.png"}


        Button {
            id: addButtom
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 55
            style: touchStyle
            onClicked: {
                itemWindow.visible = true
            }
        }
    }

    Component {
        id: touchStyle
        ButtonStyle {
            panel: Item {
                implicitHeight: 45
                implicitWidth: 45
                BorderImage {
                    anchors.fill: parent
                    antialiasing: true
                    border.bottom: 8
                    border.top: 8
                    border.left: 8
                    border.right: 8
                    anchors.margins: control.pressed ? -4 : 0
                    source: "../images/add_item.png"
                }
            }
        }
    }
}
