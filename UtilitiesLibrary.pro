QT -= gui
QT += xml

TEMPLATE = lib

CONFIG += c++17 console
CONFIG -= app_bundle
CONFIG += plugin

DESTDIR = $$_PRO_FILE_PWD_/lib
TARGET = utilities

LIBS += -L/usr/local/lib/ -lmatio
INCLUDEPATH += /usr/local/include

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    src/ConfigurationParser/mat/sources/matFileLoader.cpp \
    src/ConfigurationParser/xml/sources/XmlConfigParser.cpp \
    src/ConfigurationParser/xml/sources/XmlFileLoader.cpp \
    src/ConfigurationParser/xml/sources/XmlInterpreter.cpp \
    src/ConfigurationParser/xml/sources/XmlParser.cpp

QMAKE_CLEAN += $(DESTDIR)$(TARGET)

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    README.md \
    lib/libutilities.so

HEADERS += \
    src/ConfigurationParser/interfaces/IConfigParser.h \
    src/ConfigurationParser/interfaces/IFileLoader.h \
    src/ConfigurationParser/interfaces/IInterpreter.h \
    src/ConfigurationParser/interfaces/ILexer.h \
    src/ConfigurationParser/interfaces/IParser.h \
    src/ConfigurationParser/mat/headers/matFileLoader.h \
    src/ConfigurationParser/xml/headers/XmlConfigParser.h \
    src/ConfigurationParser/xml/headers/XmlFileLoader.h \
    src/ConfigurationParser/xml/headers/XmlInterpreter.h \
    src/ConfigurationParser/xml/headers/XmlParser.h \
    src/headers/allHeaders.h