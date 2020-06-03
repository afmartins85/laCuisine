import QtQuick 2.12

WelcomePanelForm {

    qrCodeGetStartedButton {
        onClicked: {
            console.log("BUTTON CLICKED");
        }
    }

    touchStartArea {
        onClicked: {
            stackView.push("qrc:/qml/pages/SelectMenuPanel.qml");
            console.log("GET STARTER");
        }
    }
}
