QT += qml quick sql network quickcontrols2

CONFIG += c++11

TARGET = lacuisine
!android: !ios: qtHaveModule(widgets): QT += widgets

include(src/src.pri)
include(src/paystation/paystation.pri)
include(src/gsoap/gsoap.pri)

DEFINES += WITH_OPENSSL

LIBS += -lssl -lcrypto -ldl

qml.files = $$files(qml/*.qml)
qml.files += $$files(qml/pages/*.qml)
qml.files += $$files(qml/components/lacuisine/responsive/theme/*.qml)
qml.files += $$files(qml/components/lacuisine/responsive/theme/qmldir)
qml.files += $$files(qml/components/lacuisine/controls/*.qml)
qml.files += $$files(qml/components/lacuisine/controls/qmldir)
qml.prefix = /
RESOURCES += qml

#images.files = $$files(images/*.png)
#images.files += $$files(images-assets/*.png)
#images.prefix = /images
#RESOURCES += images

RESOURCES += \
    icons/lacuisine/index.theme \
    icons/lacuisine/20x20/menu.png \
    icons/lacuisine/20x20@2/menu.png \
    icons/lacuisine/20x20@3/menu.png \
    icons/lacuisine/20x20@4/menu.png \
    icons/lacuisine/44x44/battery-full.png \
    icons/lacuisine/44x44/wifi-max-level.png \
    images-assets/images-assets.qrc \
    lacuisine.qrc \
    qtquickcontrols2.conf

QML_IMPORT_PATH += $$PWD/qml/components

target.path = /home/pi/lacuisine
INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
