# QtDeployTemplate 
* This is the qmake project template for deploying projects using qt libraries.
* The template supports qt installframework and can work with projects with several binary files and bibiliotekami.

## Example 
1. You must persuade the project
 - git clone https://github.com/QuasarApp/QtDeployTemplate.git 
2. Go to the project
 - cd QtDeployTemplate
3. Create your qmake project
 - mkdir example
 - gedit example.pro 
 ``` qmake
QT += quick
CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

CONFIG(debug, debug|release): {
    OUTPUT_DIR = "$$PWD/build/debug"
} else: {
    OUTPUT_DIR = "$$PWD/build/release"
}

UI_DIR      = "$$OUTPUT_DIR/ui/"
MOC_DIR     = "$$OUTPUT_DIR/moc/"
RCC_DIR     = "$$OUTPUT_DIR/res/"
DESTDIR     = "$$OUTPUT_DIR/bin/"
OBJECTS_DIR = "$$OUTPUT_DIR/obj/"

SOURCES += \
        main.cpp

RESOURCES += qml.qr

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

include($$PWD/../installer/deploy/deployFiles.pri) # this we added module of install template 

message( DEPLOY_FILES = $$DEPLOY_FILES)

 ```

4. If you need to build a ready installer, then before installing, make sure to run qmake
