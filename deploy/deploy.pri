
QT_DIR = $$dirname(QMAKE_QMAKE)
QML_DIR = $$QT_DIR/../qml


INSTALL_DIR = $$PWD/../installer/packages/app/data

WINDEPLY = $$QT_DIR/windeployqt.exe
MACDEPLY = $$QT_DIR/macdeployqt
LINUXDEPLOY = $$PWD/linuxdeployqt-continuous-x86_64.AppImage

message( QML_DIR = $$QML_DIR)
message( WINDEPLY = $$WINDEPLY)
message( MACDEPLY = $$MACDEPLY)
message( LINUXDEPLOY = $$LINUXDEPLOY)

DESTDIR_FILES

# Copies the given files to the destination directory
defineTest(copyToDestdir) {
    files = $$1

    for(FILE, files) {
        DDIR = $$INSTALL_DIR

        # Replace slashes in paths with backslashes for Windows
        win32:FILE ~= s,/,\\,g
        win32:DDIR ~= s,/,\\,g

        QMAKE_POST_LINK += $$QMAKE_COPY $$quote($$FILE) $$quote($$DDIR) $$escape_expand(\\n\\t)

        DESTDIR_FILES += $$DDIR/basename(FILE)
    }

    export(QMAKE_POST_LINK)
}

copyToDestdir($$DEPLOY_FILES)

win32 {
    deployApp.commands += "$$WINDEPLY --qmldir $$QML_DIR $$DEPLOY_FILES"
}

unix {
    deployApp.commands += "$$LINUXDEPLOY --qmldir=$$QML_DIR --qmake $$DEPLOY_FILES"
}

mac {
    deployApp.commands += "$$MACDEPLY --qmldir $$QML_DIR $$DEPLOY_FILES"
}
    message( deployComand = "$$deployApp.commands")

commands += "chmod +x $$LINUXDEPLOY"

for(command, commands) {
    system($$command)|error("Failed to run: $$command")
}

DISTFILES += \
    deployFiles.pri
