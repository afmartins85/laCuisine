import QtQuick 2.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Dialog {
    id: itemWindow

    property int count: 1
    property real cost: 17.80

    contentItem: Rectangle {
        implicitWidth: 1200
        implicitHeight: 540

        color: "transparent"

        Rectangle {
            id: itemMain
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 1140
            height: 480
            color: "#212126"

            Row {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 15
                Image {
                    //TODO: Automatizar a busca pela foto correspondente ao
                    //item selecionado
                    source: "../images/foto.png"
                }

                Column {
                    id: column1

                   spacing: 15

                    Text {
                        id: itemTitle
                        anchors {
                            left: parent.left
                            leftMargin: 30
                        }
                        text: "Terrine de Foie Gras\n e Palmito Pupunha,\n Rapaduta e Sal Preto do Hawai"
                        font.pixelSize: 26
                        color: "white"
                    }

                    Text {
                        id: itemDescription
                        anchors {
                            left: parent.left
                            leftMargin: 30
                        }
                        text: "Um delicioso Terrine com o melhor\n Foie Gras importado, numa porção\n individual especialmente preparada\n pelo nosso Chef"
                        font.pixelSize: 20
                        color: "white"
                    }

                    Row {
                        anchors {
                            left: parent.left
                            leftMargin: 30
                        }

                        Text {
                            text: "R$"
                            font.pixelSize: 16
                            color: "white"
                        }
                        Text {
                            id: itemCost

                            text: cost * count
                            font {
                                pixelSize: 26
                                bold: true
                            }
                            color: "white"
                        }
                    }

                    Row {
                        spacing: 20

                        Column {
                            width: 118
                            spacing: 10
                            Button {
                                id: addButtom
                                anchors {
                                    left: parent.left
                                    leftMargin: 30
                                }
                                style: touchStyleAdd
                                onClicked: {
                                    if (count < 99) {
                                        count++;
                                    }
                                }
                            }
                            Button {
                                id: subButtom
                                anchors {
                                    left: parent.left
                                    leftMargin: 30
                                }
                                style: touchStyleSub
                                onClicked: {
                                    if (count > 1) {
                                        count--;
                                    }
                                }
                            }
                        }

                        TextArea {
                            id: itemCount
                            width: 81
                            height: 109
                            text: count
                            font {
                                pixelSize: 60
                                bold: true
                                family: "Arial"
                            }
                            horizontalAlignment: TextEdit.AlignHCenter
                            verticalAlignment: TextEdit.AlignVCenter
                            selectByMouse: false
                            readOnly: true
                        }
                    }
                }
            }

            Button {
                id: doneButtom
                anchors {
                    top: parent.bottom
                    topMargin: -88
                    right: parent.right
                    rightMargin: 15
                }
                style: touchStyleDone
            }
        }

        Button {
            id: exitButtom
            anchors {
                top: itemMain.top
                right: itemMain.right
                topMargin: -30
                rightMargin: -30
            }
            style: touchStyleExit
            onClicked: itemWindow.visible = false
        }

        Component {
            id: touchStyleExit
            ButtonStyle {
                panel: Item {
                    implicitHeight: 81
                    implicitWidth: 81
                    BorderImage {
                        anchors.fill: parent
                        antialiasing: true
    //                    anchors.margins: control.pressed ? -4 : 0
                        source: control.pressed ? "../images/cancel_pressed.png" : "../images/cancel.png"
                    }
                }
            }
        }
        Component {
            id: touchStyleDone
            ButtonStyle {
                panel: Item {
                    implicitHeight: 66
                    implicitWidth: 146
                    BorderImage {
                        anchors.fill: parent
                        antialiasing: true
                        source: control.pressed ? "../images/done_pressed.png" : "../images/done.png"
                    }
                }
            }
        }
        Component {
            id: touchStyleAdd
            ButtonStyle {
                panel: Item {
                    implicitHeight: 49
                    implicitWidth: 78
                    BorderImage {
                        anchors.fill: parent
                        antialiasing: true
                        source: control.pressed ? "../images/add_pressed.png" : "../images/add.png"
                    }
                }
            }
        }
        Component {
            id: touchStyleSub
            ButtonStyle {
                panel: Item {
                    implicitHeight: 49
                    implicitWidth: 78
                    BorderImage {
                        anchors.fill: parent
                        antialiasing: true
                        source: control.pressed ? "../images/subtrair_pressed.png" : "../images/subtrair.png"
                    }
                }
            }
        }
    }
}
