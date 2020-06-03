import QtQuick 2.12
import LaCuisine 1.0

SelectMenuPanelForm {

    returnButton.onClicked: {
        stackView.pop();
        console.log("RETURN TOP MENU");
    }

    drawerComponent.openDrawer.onClicked: {
        console.log(drawerComponent.currentState)
        if (drawerComponent.currentState === "openedState") {
            drawerComponent.state = ""
            drawerComponent.currentState = drawerComponent.state
        } else {
            drawerComponent.state = "openedState"
            drawerComponent.currentState = drawerComponent.state
        }
    }

    Component.onCompleted: {
        categoryModel.loadHardList();
        categoryListModel.append(categoryModel.getAllCategories())

//        itemModel.loadHardList();
//        itemListModel.append(itemModel.getAllItens())
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
