import QtQuick 2.4
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import lacuisine.controls 1.0
import lacuisine.responsive.theme 1.0

Page {
    id: page
    width: AppTheme.screenWidth
    height: AppTheme.screenHeight

    property alias qrCodeGetStartedButton: qrCodeGetStartedButton
    property alias localGetStartedButton: localGetStartedButton
    property alias callWaiterGetStartedButton: callWaiterGetStartedButton
    property alias touchStartArea: touchStartArea

    header: Item {

        width: parent.width
        height: AppTheme.toolBarHeight

        Rectangle {
            anchors.fill: parent
            color: "#263238"
        }

        Label {
            id: dateTimeInfo
            text: "Quarta-feira, 27/05/2020\n08:00"
            anchors {
                left: parent.left
                leftMargin: AppTheme.columnSpacing_30
                verticalCenter: parent.verticalCenter
            }
            font.family: robotoFont.name
            font.pixelSize: AppTheme.textSize_12
            color: "white"
            elide: Label.ElideRight
        }

        Image {
            id: topLevelBattery
            anchors {
                top: parent.top
                right: parent.right
                topMargin: AppTheme.columnSpacing_5
                rightMargin: AppTheme.columnSpacing_5
            }

            fillMode: Image.PreserveAspectFit
            source: "qrc:/icons/battery_full"
        }
        Image {
            id: topLevelWifi
            anchors {
                top: parent.top
                right: topLevelBattery.left
                rightMargin: 1
                topMargin: AppTheme.columnSpacing_5
            }
            fillMode: Image.PreserveAspectFit
            source: "qrc:/icons/wifi_high"
        }
        ToolButton {}
    }
    Rectangle {
        anchors.fill: parent
        color: "#607d8b"
        MouseArea {
            id: touchStartArea
            anchors.fill: parent
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.left: parent.left
        anchors.leftMargin: 25
        spacing: 14.9

        ColumnLayout {
            id: columnRestaurantId
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.topMargin: 45
            spacing: AppTheme.columnSpacing_25

            Label {
                text: "Seja bem-vindo"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillWidth: false
                font.pixelSize: AppTheme.textSizeExtraSmall
                font.family: robotoFont.name
                color: "white"
            }

            Image {
                id: logo
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                source: "qrc:/images/restaurant_logo.png"
                fillMode: Image.PreserveAspectFit
                sourceSize.height: AppTheme.normalRestaurantLogoHeight
                sourceSize.width: AppTheme.normalRestaurantLogoWidth
            }

            Label {
                text: "TOQUE PARA COMEÇAR"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.pixelSize: AppTheme.textSizeExtraSmall
                font.family: robotoFont.name
                font.bold: true
                color: "#546e7a"
            }
        }

        Container {
            id: rightTabBar
            Layout.alignment: Qt.AlignRight | Qt.AlignBottom
            font.family: "Robato"
            spacing: 1
            currentIndex: 1
            enabled: false

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

            GeneralButton {
                id: qrCodeGetStartedButton
                implicitWidth: AppTheme.getStartedWidth
                implicitHeight: AppTheme.getStartedHeight
                text: qsTr("Atendimento\n com QR code")
                Layout.fillHeight: true
                enabled: parent.enabled
                opacity: parent.enabled ? 1 : 0
                color: "#90a4ae"
                colorText: "#263238"
            }

            GeneralButton {
                id: localGetStartedButton
                implicitWidth: AppTheme.getStartedWidth
                implicitHeight: AppTheme.getStartedHeight
                text: qsTr("Atendimento\npelo tablet")
                Layout.fillHeight: true
                enabled: parent.enabled
                opacity: parent.enabled ? 1 : 0
                color: "#90a4ae"
                colorText: "#263238"
            }

            GeneralButton {
                id: callWaiterGetStartedButton
                implicitWidth: AppTheme.getStartedWidth
                implicitHeight: AppTheme.getStartedHeight
                text: qsTr("Chamar o\nseu atendente")
                Layout.fillHeight: true
                enabled: parent.enabled
                opacity: parent.enabled ? 1 : 0
                color: "#90a4ae"
                colorText: "#263238"
            }
        }
    }

    RowLayout {
        id: columnPowered
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: 25
        anchors.leftMargin: 45
        spacing: 15

        Image {
            id: tthLogo
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/logo.png"
            sourceSize.height: AppTheme.normalTthLogoHeight
            sourceSize.width: AppTheme.normalTthLogoWidth
        }

        Image {
            id: tipografiaLogo
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            fillMode: Image.PreserveAspectFit
            source: "qrc:/images/tipografia_logo.png"
            sourceSize.width: AppTheme.normalTipoGrLogoWidth
            sourceSize.height: AppTheme.normalTipoGrLogoHeight
        }

        Label {
            text: "powered by truetech-systems.com.br"
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            Layout.fillWidth: false
            font.pixelSize: AppTheme.textSizeUltraSmall
            font.family: robotoFont.name
            color: "white"
        }
    }
}
