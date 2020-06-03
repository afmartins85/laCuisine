import QtQuick 2.4
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import lacuisine.controls 1.0

Pane {
    id: welcomePanel

    implicitWidth: 1024
    implicitHeight: 516

    property alias qrCodeGetStartedButton: qrCodeGetStartedButton

    Rectangle {
        anchors.fill: parent
        color: "#607d8b"
    }

    RowLayout {
        anchors.fill: parent
        anchors.left: parent.left
        anchors.leftMargin: 25
        spacing: 14.9

        ColumnLayout {
            id: columnRestaurantId

            Label {
                text: "Seja bem-vindo"
                Layout.fillWidth: false
                font.pixelSize: fontSizeLarge
                font.family: robotoFont.name
                color: "white"
            }

            Image {
                id: logo
                sourceSize.height: 133
                sourceSize.width: 133
                source: "qrc:/images/restaurant_logo.png"
            }
        }

        Container {
            id: rightTabBar
            Layout.alignment: Qt.AlignRight | Qt.AlignBottom
            font.family: "Robato"
            spacing: 1
            currentIndex: 1

            ButtonGroup {
                buttons: rightTabBar.children
            }

            contentItem: ColumnLayout {
                id: columnGetStartButtom
                spacing: 1

                Repeater {
                    model: rightTabBar.contentModel
                }
            }

            GetStartedButton {
                id: qrCodeGetStartedButton
                text: qsTr("Atendimento\n com QR code")
                Layout.fillHeight: true
            }

            GetStartedButton {
                id: localGetStartedButton
                text: qsTr("Atendimento\npelo tablet")
                Layout.fillHeight: true
            }

            GetStartedButton {
                id: callWaiterGetStartedButton
                text: qsTr("Chamar o\nseu atendente")
                //                Layout.fillHeight: true
            }
        }
    }

    RowLayout {
        id: columnPowered
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: 25
        anchors.leftMargin: 25
        spacing: 15

        Image {
            id: tthLogo
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/logo.png"
            sourceSize.height: 39
            sourceSize.width: 56
        }

        Image {
            id: tipografiaLogo
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/tipografia_logo.png"
            sourceSize.width: 75
            sourceSize.height: 25
        }

        Label {
            text: "powered by truetech-systems.com.br"
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            Layout.fillWidth: false
            font.pixelSize: fontSizeExtraSmall
            font.family: robotoFont.name
            color: "white"
        }
    }
}
