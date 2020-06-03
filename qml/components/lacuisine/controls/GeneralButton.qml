import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Button {
    id: button
    text: qsTr("Button")
    font.pixelSize: fontSizeLarge
    implicitWidth: 256
    implicitHeight: 172

    contentItem: Text {
        text: button.text
        font: button.font
        opacity: button.down ? 0.3 : 1
        color: "black"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        opacity: button.down ? 0.3 : 1
        color: "#90a4aeff"
        radius: 2
    }
}
