import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12
import QtQuick.Window 2.12
import Qt.labs.settings 1.1
import lacuisine.responsive.theme 1.0

ApplicationWindow {
    id: window
    width: AppTheme.screenWidth
    height: AppTheme.screenHeight
    minimumWidth: 800
    minimumHeight: 600
    maximumWidth: 1600
    maximumHeight: 1200
    visible: true
    title: "LaCuisine"

//    readonly property color colorGlow: "#1d6d64"
//    readonly property color colorWarning: "#d5232f"
//    readonly property color colorMain: "#6affcd"
//    readonly property color colorBright: "#ffffff"
//    readonly property color colorLightGrey: "#888"
//    readonly property color colorDarkGrey: "#333"

    readonly property int fontSizeExtraSmall: Qt.application.font.pixelSize * 0.8
    readonly property int fontSizeMedium: Qt.application.font.pixelSize * 1.5
    readonly property int fontSizeLarge: Qt.application.font.pixelSize * 2
    readonly property int fontSizeExtraLarge: Qt.application.font.pixelSize * 5

    // Configurar novas fontes aqui
    FontLoader { id: roboto; name: "Roboto" }
    readonly property var robotoFont: roboto

    Component.onCompleted: {
        x = Screen.width / 2 - width / 2
        y = Screen.height / 2 - height / 2
    }

    Settings {
        id: settings
        property string style: "Imagine"
    }

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }

    header: ToolBar {

        background: Rectangle {
            implicitWidth: parent.width
            implicitHeight: Math.min(window.width, window.height) / 10
            color: "#263238"
        }

        RowLayout {
            spacing: 20
            anchors.fill: parent

            Label {
                id: dateTimeInfo
                text: "datetime"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ColumnLayout {
                id: rightMenuBarLayout
                spacing: 20

                RowLayout {
                    id: rowNotificationIconsLayout
                    spacing: 5
                }

                ToolButton {
                    icon.name: "menu"
                    icon.width: 20
                    icon.height: 20
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: welcomePage
        anchors.fill: parent
    }

    WelcomePanelForm {
        id: welcomePage
        anchors.fill: stackView.parent
    }
}
