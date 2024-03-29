QT -= gui
QT += core xml concurrent

TEMPLATE = lib

CONFIG += c++17 console plugin
CONFIG -= app_bundle

LIBS += -L/opt/test/matio -lmatio
INCLUDEPATH += /opt/test/include

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Configuration specific to debug build
CONFIG(debug, debug|release) {
    DESTDIR = $$_PRO_FILE_PWD_/lib/debug
    TARGET = utilitiesd
    QMAKE_CXXFLAGS_DEBUG += -O0 -g
}

# Configuration specific to release build
CONFIG(release, debug|release) {
    DESTDIR = $$_PRO_FILE_PWD_/lib/release
    TARGET = utilities
    QMAKE_CXXFLAGS_RELEASE -= -O2
}

SOURCES += \
    src/ConfigurationParser/mat/sources/MatConfigProcessor.cpp \
    src/ConfigurationParser/mat/sources/MatFileLoader.cpp \
    src/ConfigurationParser/mat/sources/MatInterpreter.cpp \
    src/ConfigurationParser/mat/sources/MatParser.cpp \
    src/ConfigurationParser/txt/sources/TxtConfigProcessor.cpp \
    src/ConfigurationParser/txt/sources/TxtFileLoader.cpp \
    src/ConfigurationParser/txt/sources/TxtInterpreter.cpp \
    src/ConfigurationParser/txt/sources/TxtParser.cpp \
    src/ConfigurationParser/xml/sources/XmlConfigProcessor.cpp \
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
    src/ConfigurationParser/interfaces/IConfigProcessor.h \
    src/ConfigurationParser/interfaces/IFileLoader.h \
    src/ConfigurationParser/interfaces/IInterpreter.h \
    src/ConfigurationParser/interfaces/ILexer.h \
    src/ConfigurationParser/interfaces/IParser.h \
    src/ConfigurationParser/mat/headers/MatConfigProcessor.h \
    src/ConfigurationParser/mat/headers/MatFileLoader.h \
    src/ConfigurationParser/mat/headers/MatInterpreter.h \
    src/ConfigurationParser/mat/headers/MatParser.h \
    src/ConfigurationParser/txt/headers/TxtConfigProcessor.h \
    src/ConfigurationParser/txt/headers/TxtFileLoader.h \
    src/ConfigurationParser/txt/headers/TxtInterpreter.h \
    src/ConfigurationParser/txt/headers/TxtParser.h \
    src/ConfigurationParser/xml/headers/XmlConfigProcessor.h \
    src/ConfigurationParser/xml/headers/XmlFileLoader.h \
    src/ConfigurationParser/xml/headers/XmlInterpreter.h \
    src/ConfigurationParser/xml/headers/XmlParser.h \
    src/headers/AllHeaders.h
