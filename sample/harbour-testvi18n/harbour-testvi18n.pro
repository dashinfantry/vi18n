# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-testvi18n

CONFIG += sailfishapp

include(src/vi18n/vi18n.pri)

SOURCES += src/harbour-testvi18n.cpp

OTHER_FILES += \
    qml/pages/*.qml \
    qml/cover/*.qml \
    rpm/harbour-testvi18n.changes.in \
    rpm/harbour-testvi18n.spec \
    rpm/harbour-testvi18n.yaml \
    harbour-testvi18n.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

DISTFILES += \
    qml/harbour-testvi18n.qml \
    qml/pages/*.qml \
    qml/cover/*.qml

