import QtQuick 2.1
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: resumeAbe
    x: 980
    z: 1
    width: 350
    height: parent.height
    anchors.right: parent.right
    anchors.rightMargin: 0

    property var payWindow: PayPage {}
    Behavior on width { NumberAnimation{ duration: 500 } }

    Rectangle {
        anchors.fill: parent
        color: "#333333"

        Image {
            id: borderResumeAbe
            height: parent.height
            anchors.left: parent.left
            source: "../images/border_resume_abe.png"
        }
    }

    Rectangle {
        id: expandButtom
        width: 24
        height: 24
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }
        color: expandResumeButtom.pressed ? "#333344" : "transparent"
//        Behavior on width { NumberAnimation{} }
        Image {
            anchors.verticalCenter: parent.verticalCenter
            source: "../images/seta_expand_resumo.png"
        }
        MouseArea {
            id:expandResumeButtom
            anchors.fill: parent
            onClicked:  {
                if (resumeAbe.width == 350) {
                    resumeAbe.width = 650;
                } else {
                    resumeAbe.width = 350;
                }
            }
        }
    }

    Item {
        id: titleResume
        width: resumeAbe.width
        height: 44
        anchors.left: resumeAbe.left

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            spacing: 100

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "RESUMO DA SUA MESA"
                color: "white"
                font.pixelSize: 16
            }

            Text {
                anchors.verticalCenter: parent.verticalCenter
                color: "white"
                text: "QTDE."
                font.pixelSize: 16
            }
        }

        Image {
            width: parent.width - 40
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
            }
            source: "../images/section_div.png"
        }
    }

    Item {
        id: listResume
        width: resumeAbe.width
        height: 350
        anchors.top: titleResume.top
        anchors.left: expandButtom.right
        anchors.right: parent.right
        anchors.rightMargin: 5

        ListView {
            id: resumeView
            width: parent.width
            height: parent.height
            anchors.top: parent.top
            anchors.topMargin: 45

            model: ListModel {
                //TODO: Transformar essa lista dinâmica
                //e pegar as informações através do banco de dados
                ListElement {
                    name: "Terrine de Foie"
                    requestStatus: true
                    qtde: "3"
                }

                ListElement {
                    name: "Salmão grelhado"
                    requestStatus: false
                    qtde: "1"
                }

                ListElement {
                    name: "Bulles de Rosé"
                    requestStatus: false
                    qtde: "1"
                }
            }
            delegate: Item {
                x: 5
                height: 44
                Item {
                    width: resumeView.width
                    height: resumeView.height
                    anchors.centerIn: parent.center

                    Text {
                        text: name
                        anchors.centerIn: parent.center
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        color: "white"
                        font.bold: false
                        font.pixelSize: 18
                    }

                    Image {
                        width: 32
                        height: 32
                        anchors.centerIn: parent.center
                        anchors.right: parent.right
                        anchors.rightMargin: 80
                        source: requestStatus > 0 ? "../images/reqst_done.png":"../images/in_progress.png"
                    }

                    Text {
                        text: qtde
                        anchors.centerIn: parent.center
                        anchors.right: parent.right
                        anchors.rightMargin: 35

                        color: "white"
                        font.bold: true
                        font.pixelSize: 28
                    }
                }
            }
        }

        Image {

            width: parent.width - 40
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.bottom
                topMargin: 60
            }

            source: "../images/list-divider-light.png"
        }
    }

    Item {
        id: resumeAction
        width: 350
        height: parent.height
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: listResume.bottom
            topMargin: 65
        }

        Text {
            anchors {
                horizontalCenter: parent.horizontalCenter
            }
            text: "Você pode continuar pedindo ao lado"
            font.pixelSize: 14
            color: "white"
        }

        Row {
            width: parent.width
            height: parent.height
            anchors {
                top: parent.top
                topMargin: 30
                left: parent.left
                leftMargin: 15
            }
            spacing: 160

            Text {
                anchors {
                    centerIn: parent.center
                }
                text: "SUBTOTAL"
                color: "white"
                font.pixelSize: 14
            }

            Text {
                anchors {
                    centerIn: parent.center
                }
                //TODO: Automatizar o calculo
                text: "R$ 520,00"
                color: "orange"
                font.pixelSize: 18
                font.bold: true
            }
        }

        Rectangle {
            id: requestAcount
            width: parent.width - 25
            height: 50
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 50
            }
            color: requestButtom.pressed ? "#ff8800" : "#777777"

            Text {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
                text: "Pedir a conta"
                font.pixelSize: 14
                color: "black"
            }
            MouseArea {
                id: requestButtom
                anchors.fill: parent
                onPressed: {
                    payWindow.visible = true
                }

                //TODO: Criar ação para o click no botão
            }
        }

        Image {

            width: parent.width - borderResumeAbe.width
            anchors {
                top: requestAcount.bottom
                topMargin: 10
                right: parent.right
                rightMargin: 10
            }

            source: "../images/list-divider-light.png"
        }

        Row {
            id: buttons
            width: parent.width
            height: parent.height
            anchors {
                top: requestAcount.top
                topMargin: 60
                left: parent.left
                leftMargin: 0
            }

            Rectangle {
                width: parent.width / 3
                height: parent.height

                color: bartenderButtom.pressed ? "#ff8800" : "transparent"
                Image {
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.top
                        topMargin: 15
                    }
                    source: "../images/ic_garçom.png"
                }
                MouseArea {
                    id: bartenderButtom
                    anchors.fill: parent
                    //TODO: Criar ação para o click no botão
                }
            }
            Image {
                anchors {
                    centerIn: parent.center
                    top: parent.top
                    topMargin: 15
                }
                source: "../images/div_tab.png"
            }
            Rectangle {
                width: parent.width / 3
                height: parent.height

                color: internetButtom.pressed ? "#ff8800" : "transparent"
                Image {
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.top
                        topMargin: 15
                    }
                    source: "../images/ic_internet.png"
                }
                MouseArea {
                    id: internetButtom
                    anchors.fill: parent
                    //TODO: Criar ação para o click no botão
                }
            }
            Image {
                anchors {
                    centerIn: parent.center
                    top: parent.top
                    topMargin: 15
                }
                source: "../images/div_tab.png"
            }
            Rectangle {
                width: parent.width / 3
                height: parent.height

                color: helpButtom.pressed ? "#ff8800" : "transparent"
                Image {
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.top
                        topMargin: 15
                    }
                    source: "../images/ic_ajuda.png"
                }
                MouseArea {
                    id: helpButtom
                    anchors.fill: parent
                    //TODO: Criar ação para o click no botão
                }
            }
        }
    }
}
