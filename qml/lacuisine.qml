import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Imagine 2.12
import QtQuick.Window 2.12
import Qt.labs.settings 1.1
import lacuisine.responsive.theme 1.0
import LaCuisine 1.0
import "pages"

ApplicationWindow {
    id: window
    width: AppTheme.screenWidth
    height: AppTheme.screenHeight
    visible: true
    title: "LaCuisine"

    // Configurar novas fontes aqui
    FontLoader { id: roboto; name: "Roboto" }
    readonly property var robotoFont: roboto

    property alias stackView: stackView

//    Component.onCompleted: {
//        x = Screen.width / 2 - width / 2
//        y = Screen.height / 2 - height / 2

//        console.log("width: " + window.width)
//        console.log("height: " + window.height)
//        console.log(Qt.application.font.pixelSize)
//    }

    Settings {
        id: settings
        property string style: "Imagine"
    }

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: WelcomePanel {
            id: welcomePage
        }

//        pushEnter: Transition {
//            PropertyAnimation {
//                property: "opacity"
//                from: 0
//                to:1
//                duration: 400
//            }
//        }
    }
}
