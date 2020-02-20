SOURCES += \
    $$PWD/main.cpp \
    src/paystation.cpp \
    $$PWD/sitefapi.cpp

unix:LIBS += -L$$PWD../lib\ -lclisitef32

HEADERS += \
    src/paystation.h \
    $$PWD/clisitef.h \
    $$PWD/sitefapi.h

