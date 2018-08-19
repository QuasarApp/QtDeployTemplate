include($$PWD/deploy/targetList.pri)
include($$PWD/deploy/deployFiles.pri)


TEMPLATE = aux

INSTALLER = installerApp

INPUT = $$PWD/config/config.xml $$PWD/packages
installerApp.input = INPUT
installerApp.output = $$INSTALLER

QT_DIR = $$dirname(QMAKE_QMAKE)
LUPDATE = $$QT_DIR/lupdate
LRELEASE = $$QT_DIR/lrelease

OUT_FILE = installerApp

QT_DIR = $$dirname(QMAKE_QMAKE)
QML_DIR = $$QT_DIR/../qml


WINDEPLY = $$QT_DIR/windeployqt.exe
MACDEPLY = $$QT_DIR/macdeployqt
LINUXDEPLOY = $$PWD/../CQtDeployer/build/CQtDeployer

message( QML_DIR = $$QML_DIR)
message( WINDEPLY = $$WINDEPLY)
message( MACDEPLY = $$MACDEPLY)
message( LINUXDEPLOY = $$LINUXDEPLOY)

win32 {
    OUT_FILE = installerApp.exe
    LUPDATE = $$QT_DIR/lupdate.exe
    LRELEASE = $$QT_DIR/lrelease.exe
}

message( QT_DIR = $$QT_DIR)
message( LUPDATE = $$LUPDATE)
message( LRELEASE = $$LRELEASE)
message( DEPLOY_FILES = $$DEPLOY_FILES)

# todo get inpot files
win32 {
    for(command, TARGET_LIST) {
        installerApp.commands += $$WINDEPLY --qmldir $$QML_DIR $$TARGET_PATH/$$command &&
    }
}

unix {
    for(command, TARGET_LIST) {
        installerApp.commands += $$LINUXDEPLOY -bin $$TARGET_PATH/$$command -qmlDir $$QML_DIR -qmake $$QMAKE_QMAKE &&
    }
    commands += "chmod +x $$LINUXDEPLOY"
}

macx {
    for(command, TARGET_LIST) {
        installerApp.commands += $$MACDEPLY --qmldir $$QML_DIR $$TARGET_PATH/$$command &&
    }
}

installerApp.commands += $$QT_DIR/../../../Tools/QtInstallerFramework/3.0/bin/binarycreator --offline-only -c $$PWD/config/config.xml -p $$PWD/packages $$PWD/$$OUT_FILE --verbose -f
installerApp.CONFIG += target_predeps no_link combine




message( installComands = "$$installerApp.commands")

commands += "$$LUPDATE $$PWD/packages/app/meta/installscript.js -ts $$PWD/packages/app/meta/ru.ts"
commands += "$$LRELEASE $$PWD/packages/app/meta/ru.ts"

for(command, commands) {
    system($$command)|error("Failed to run: $$command")
}


QMAKE_EXTRA_COMPILERS += installerApp

DISTFILES += \
    config/controlScript.js \
    config/config.xml \
    README.md \
    config/ru.ts \
    packages/app/meta/installscript.js \
    packages/app/meta/package.xml \
    packages/app/meta/ru.ts

