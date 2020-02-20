import QtQuick 2.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import LaCuisine 1.0

Dialog {
    id: payWindow

    property var payment: PayStation {}

    contentItem: Rectangle {
        color: "transparent"
        implicitWidth: 710
        implicitHeight: 540

        Rectangle {
            id: payMain
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 640
            height: 480
            color: "#212126"

            Row {
                anchors.fill: parent

                Column {
                    spacing: 15
                    Row {
                        Image {
                            anchors {
                                top: parent.top
                                topMargin: 8
                            }
                            source: "../images/logo.png"
                            scale: 0.8
                        }

                        Image {
                            anchors {
                                top: parent.top
                                topMargin: 34
                            }
                            source: "../images/tipografia_logo.png"
                            scale: 0.8
                        }
                    }
                    Text {
                        anchors {
                            left: parent.left
                            leftMargin: 15
                        }
                        text: "Fechamento da conta"
                        font.pixelSize: 22
                        color: "gray"
                    }
                }

                Image {
                    anchors.verticalCenter: parent.verticalCenter
                    height: parent.height - 40
                    source: "../images/div_tab.png"
                }

                Column {
                    id: column1
                    anchors.top: parent.top
                    anchors.topMargin: 52

                   spacing: 15

                    Text {
                        id: resumeItem
                        anchors {
                            left: parent.left
                            leftMargin: 30
                        }
                        text: "Total de sua mesa"
                        font.pixelSize: 26
                        color: "white"
                    }

                    Row {
                        spacing: 10
                        anchors {
                            left: parent.left
                            leftMargin: 15
                        }

                        Text {
                            text: "R$"
                            font.pixelSize: 16
                            color: "white"
                        }
                        Text {
                            id: payCost

                            text: "50.00"
                            font {
                                pixelSize: 26
                                bold: true
                            }
                            color: "orange"
                        }
                    }

                    Text {
                        anchors {
                            left: parent.left
                            leftMargin: 15
                        }
                        text: "Escolha a forma de pagamento abaixo"
                        font.pixelSize: 16
                        color: "white"
                    }

                    Column {
                        anchors {
                            left: parent.left
                            leftMargin: 15
                        }
                        spacing: 10
                        Button {
                            id: ccButtom
                            style: touchStyleCreditCard
                            onClicked: {
                                    payment.cost = 10
                            }
                        }
                        Button {
                            id: dcButtom
                            style: touchStyleDebitCard
                        }
                        Button {
                            id: moneyButtom
                            style: touchStyleMoney
                        }
                    }
                }
            }
        }

        Button {
            id: exitButtom
            anchors {
                top: payMain.top
                right: payMain.right
                topMargin: -30
                rightMargin: -30
            }
            style: touchStyleExit
            onClicked: { payWindow.visible = false}
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
            id: touchStyleCreditCard
            ButtonStyle {
                panel: Item {
                    implicitHeight: 81
                    implicitWidth: 339
                    BorderImage {
                        anchors.fill: parent
                        antialiasing: true
                        source: control.pressed ? "../images/cc_pressed.png" : "../images/cc.png"
                    }
                }
            }
        }

        Component {
            id: touchStyleDebitCard
            ButtonStyle {
                panel: Item {
                    implicitHeight: 81
                    implicitWidth: 339
                    BorderImage {
                        anchors.fill: parent
                        antialiasing: true
                        source: control.pressed ? "../images/dc_pressed.png" : "../images/dc.png"
                    }
                }
            }
        }

        Component {
            id: touchStyleMoney
            ButtonStyle {
                panel: Item {
                    implicitHeight: 81
                    implicitWidth: 339
                    BorderImage {
                        anchors.fill: parent
                        antialiasing: true
                        source: control.pressed ? "../images/money_pressed.png" : "../images/money.png"
                    }
                }
            }
        }
    }
}
