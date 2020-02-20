QT += qml quick sql
TARGET = lacuisine
!android: !ios: qtHaveModule(widgets): QT += widgets

include(src/src.pri)

OTHER_FILES += \
    main.qml \
    content/AndroidDelegate.qml \
    content/ButtonPage.qml \
    content/ListPage.qml \
    content/ProgressBarPage.qml \
    content/SliderPage.qml \
    content/TabBarPage.qml \
    content/TextInputPage.qml \
    content/ResumePage.qml \
    content/ListDelegate.qml \
    content/ItemPage.qml \
    content/PayPage.qml \
    content/LocalStorage.qml \
    content/MediaPlayer.qml \
    content/MediaPlayer.qml

RESOURCES += \
    resources.qrc

