import QtQuick 2.4
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import LaCuisine 1.0
import lacuisine.controls 1.0
import lacuisine.responsive.theme 1.0

Page {
    id: page
    width: AppTheme.screenWidth
    height: AppTheme.screenHeight
    property alias itemScrollBar: itemScrollBar
    property alias itemListView: itemListView
    property alias drawerComponent: drawerComponent
    property alias categoryView: categoryView
    property alias returnButton: returnButton
    property alias categoryModel: categoryModel
    property alias categoryListModel: categoryListModel
    property alias itemModel: itemModel
    property alias itemListModel: itemListModel

    property real totalCost: 1380.01

    ItemModel {
        id: itemModel
    }

    CategoryModel {
        id: categoryModel
    }
    ListModel {
        id: categoryListModel
    }

    ListModel {
        id: itemListModel

        ListElement {
            dishImage: "qrc:/images/foto_produtos_menu.png"
            dishCost: 30.90
            name: "Salada Verde"
            description: "Cogumelos, ervilhas, molho de coalhada seca\n e tomates verdes."
        }
        ListElement {
            dishImage: "qrc:/images/foto_produtos_menu.png"
            dishCost: 30.90
            name: "Salada Verde"
            description: "Cogumelos, ervilhas, molho de coalhada seca\n e tomates verdes."
        }
        ListElement {
            dishImage: "qrc:/images/foto_produtos_menu.png"
            dishCost: 30.90
            name: "Salada Verde"
            description: "Cogumelos, ervilhas, molho de coalhada seca\n e tomates verdes."
        }
        ListElement {
            dishImage: "qrc:/images/foto_produtos_menu.png"
            dishCost: 30.90
            name: "Salada Verde"
            description: "Cogumelos, ervilhas, molho de coalhada seca\n e tomates verdes."
        }
        ListElement {
            dishImage: "qrc:/images/foto_produtos_menu.png"
            dishCost: 30.90
            name: "Salada Verde"
            description: "Cogumelos, ervilhas, molho de coalhada seca\n e tomates verdes."
        }
        ListElement {
            dishImage: "qrc:/images/foto_produtos_menu.png"
            dishCost: 30.90
            name: "Salada Verde"
            description: "Cogumelos, ervilhas, molho de coalhada seca\n e tomates verdes."
        }
        ListElement {
            dishImage: "qrc:/images/foto_produtos_menu.png"
            dishCost: 30.90
            name: "Salada Verde"
            description: "Cogumelos, ervilhas, molho de coalhada seca\n e tomates verdes."
        }
        ListElement {
            dishImage: "qrc:/images/foto_produtos_menu.png"
            dishCost: 30.90
            name: "Salada Verde"
            description: "Cogumelos, ervilhas, molho de coalhada seca\n e tomates verdes."
        }
    }

    Rectangle {

        width: parent.width
        height: rowTopControlMenu.height
        anchors.top: parent.top
        anchors.left: parent.left
        color: "#607d8b"
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        RowLayout {
            id: rowTopControlMenu
            width: parent.width
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            spacing: 0

            TopReturnButton {
                id: returnButton
                enabled: true
                source: "qrc:/images/restaurant_logo.png"
            }

            ListView {
                id: categoryView
                width: AppTheme.toolBarListWidth
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                orientation: ListView.Horizontal
                model: categoryListModel
                delegate: CategoryDelegate {}
            }

            Rectangle {
                id: rectangle
                width: AppTheme.squareCostWidth
                height: AppTheme.squareCostHeight
                Layout.alignment: Qt.AlignRight
                color: "#263238"
                ColumnLayout {
                    anchors.fill: parent
                    spacing: -10

                    Text {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Layout.leftMargin: AppTheme.columnSpacing_20
                        text: qsTr("TOTAL")
                        font.family: "Roboto"
                        font.pixelSize: AppTheme.textSizeUltraSmall
                        color: "#37474f"
                    }
                    Text {
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Layout.leftMargin: AppTheme.columnSpacing_20
                        text: "R$" + totalCost
                        font.family: "Roboto"
                        font.pixelSize: AppTheme.textSize_12
                        font.bold: true
                        color: "white"
                    }
                }
                Image {
                    id: levelBattery
                    anchors.top: parent.top
                    anchors.topMargin: AppTheme.columnSpacing_5
                    anchors.right: parent.right
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/icons/battery_full"
                }
                Image {
                    id: levelWifi
                    anchors.topMargin: AppTheme.columnSpacing_5
                    anchors.top: parent.top
                    anchors.right: levelBattery.left
                    anchors.rightMargin: 1
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/icons/wifi_high"
                }
            }
        }

        RowLayout {
            id: rowItemControl
            Layout.alignment: Qt.AlignRight

            ListView {
                id: itemListView
                width: AppTheme.itemExpandedWidth
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Layout.topMargin: AppTheme.columnSpacing_5
                orientation: ListView.Vertical
                flickableDirection: Flickable.VerticalFlick
                clip: true
                model: itemListModel
                delegate: ItemDelegate {}

                ScrollBar {
                    id: itemScrollBar
                }
            }

            DrawerComponent {
                id: drawerComponent
                anchors.right: parent.right
            }
        }
    }
}
