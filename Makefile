TARGET = iChabber

CC = arm-apple-darwin-gcc

LD = $(CC)

CFLAGS	= -DHAVE_OPENSSL -DDEBUG=1 -O2 -Wall

LDFLAGS	= -ObjC -lobjc \
	-framework CoreFoundation \
	-framework Foundation \
	-framework UIKit \
	-framework LayerKit \
	-framework CoreGraphics \
	-framework GraphicsServices \
	-framework Celestial \
	-framework CoreTelephony \
	-framework Message \
	-lssl -lcrypto
	
LDFLAGS_FRAMEWORKSDIR=-F/opt/iphone-sdk/share/heavenly/System/Library/

all:	$(TARGET)

OBJS = lib/connwrap/connwrap.o lib/server.o lib/socket.o lib/utf8.o lib/utils.o lib/conf.o
APPOBJS = main.o iCabberApp.o MyPrefs.o Buddy.o Notifications.o EyeCandy.o BuddyAction.o

$(TARGET):  $(APPOBJS) $(OBJS)
	$(LD) $(LDFLAGS_FRAMEWORKSDIR) $(LDFLAGS) -o $@ $^

%.o:	%.m
		$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

clean:
		rm -f $(TARGET) $(OBJS) $(APPOBJS) $(TARGET).zip
		rm -rf $(TARGET).app

upload: $(TARGET)
	scp $(TARGET) root@sashz-iphone:/Applications/iChabber.app/

package: $(TARGET)
	rm -rf $(TARGET).app
	mkdir -p $(TARGET).app
	cp $(TARGET) $(TARGET).app/$(TARGET)
	cp Info.plist $(TARGET).app/Info.plist
	cp icons/*.png $(TARGET).app/
	cp sounds/*.aiff $(TARGET).app/

dist: package
	zip -9r $(TARGET).zip $(TARGET).app/