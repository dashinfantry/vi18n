# vi18n
Vi18N is a set of Qt (c++) classes for internationalization, translation of cpp application.

It intended to be a replacement of qt lupdate with a more simple and friendly approach similar to id based properties files in Java world.
code and translation are totally separated, All values are dynamically loaded, no need to compil any translation files.

* simple, only consist of 1 class to add to your project
* id based
* string are loaded dynamically on request; qt,js,qml you can render value from dynamic key too
* you can of course select language at run time
* you still can use lupdate alongside vi18n

Install
==================

1. Copy the src/vi18n file to your src project directory.
2. Now edit the pro file to include the pri
3. Configure your distribution file to include the transaltion (rpm provided)

Have a look at the sample project

Sample .pro file
------------------
Assuming you use the default name and location, for the project harbour-testvi18n :

```pro
TARGET = harbour-testvi18n

CONFIG += sailfishapp

SOURCES += src/harbour-testvi18n.cpp 

include(src/vi18n/vi18n.pri)

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
```

Sample .yaml file for rpm packaging
------------------
Note : only related changes and using default name and location

```yaml
Files:
  - '%{_bindir}'
  - '%{_datadir}/%{name}'
  - '%{_datadir}/%{name}/i18n'
```

Properties files name convention
------------------
vi18n-{2 chars code language}.properties
vi18n-fi.properties
vi18n.properties # this is the default / fall back file

Properties files format
------------------
Properties files are plain text similar to java's one, but with utf-8 encoding instead. Define one key for each line.
If a key is the same, You don't need to redefine it on each language, just put it in default file (type english)
One difference with lupudate, you have to add keys yourself. No change either on properties or source files will automatically be done.
By default, translation goes into the (src/)vi18n/i18n directory

```
# this is a comment
list.title=Hello all
```
 

