TOP := $(dir $(lastword $(MAKEFILE_LIST)))

# Update this to reflect your installed version
TITANIUM_SDK_VERSION := 1.7.5

# These should not need to change
TITANIUM_SDK := $(HOME)/Library/Application\ Support/Titanium/mobilesdk/osx/$(TITANIUM_SDK_VERSION)
TITANIUM := $(TITANIUM_SDK)/titanium.py

THISDIR := $(PWD)/$(TOP)
SOCIALIZE := $(THISDIR)/Frameworks/socialize-sdk-ios
SOCIALIZE_FRAMEWORK_DIR := $(SOCIALIZE)/build/Socialize.embeddedframework

.PHONY: run socialize

run: module.xcconfig titanium.xcconfig socialize
	$(TITANIUM) run

socialize:
	cd $(SOCIALIZE) && make framework
	cd $(SOCIALIZE) && make bundle
	rm -rf assets/Socialize.bundle
	mkdir -p assets/Socialize.bundle
	cp -R $(SOCIALIZE)/build/Socialize.bundle/. assets/Socialize.bundle


%: %.in
	sed \
		 -e "s^@socialize_framework_dir\@^$(SOCIALIZE_FRAMEWORK_DIR)^g" \
		 -e "s^@titanium_sdk\@^$(TITANIUM_SDK)^g" \
		 < $< > $@ || rm $@
