FINALPACKAGE = 1
TARGET := iphone:clang:latest:7.0
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = tools420

export ARCHS = armv7 armv7s arm64 arm64e

tools420_FILES = $(wildcard *.m) $(wildcard functions/*.m)
tools420_INSTALL_PATH = /Library/PreferenceBundles
tools420_FRAMEWORKS = UIKit
tools420_PRIVATE_FRAMEWORKS = Preferences
$(BUNDLE_NAME)_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

$(BUNDLE_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Tools420.plist$(ECHO_END)