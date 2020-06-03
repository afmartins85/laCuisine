QT += qml quick sql network quickcontrols2

CONFIG += c++11

TARGET = lacuisine
!android: !ios: qtHaveModule(widgets): QT += widgets

include(src/src.pri)
include(src/paystation/paystation.pri)

#qml.files = $$files(*.qml)
#qml.files += $$files(pages/*.qml)
#qml.files += $$files(components/lacuisine/responsive/theme/*.qml)
#qml.files += $$files(components/lacuisine/controls/*.qml)
#qml.prefix = /pages
#RESOURCES += qml

#images.files = $$files(images/*.png)
#images.files += $$files(images-assets/*.png)
#images.prefix = /images
#RESOURCES += images

RESOURCES += \
    images-assets/images-assets.qrc \
    icons/icons.qrc \
    lacuisine.qrc \
    qtquickcontrols2.conf
#    components/lacuisine/responsive/theme/qmldir \
#    components/lacuisine/controls/qmldir

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
