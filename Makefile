ARCHS = arm64 arm64e
FINALPACKAGE = 1

TARGET = iphone:13.3
ADDITIONAL_CFLAGS = -DTHEOS_LEAN_AND_MEAN -fobjc-arc

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoSwipeKeyboard13
NoSwipeKeyboard13_FILES = Tweak.xm
NoSwipeKeyboard13_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"