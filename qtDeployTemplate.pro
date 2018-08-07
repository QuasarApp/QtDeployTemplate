TEMPLATE = subdirs
CONFIG += ordered

include($$PWD/installer/deploy/deployFiles.pri)
message( DEPLOY_FILES_MASTER = $$DEPLOY_FILES)


SUBDIRS += example \
           installer

