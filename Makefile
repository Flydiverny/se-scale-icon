SHELL         := /bin/bash
MAKEFLAGS     += --warn-undefined-variables
.SHELLFLAGS   := -euo pipefail -c

MOD_NAME := $(shell jq -r '.name' info.json)
VERSION := $(shell jq -r '.version' info.json)
GIT_VERSION := $(shell git describe --dirty --always | sed 's/-/./2' | sed 's/-/./2')
RELEASE_NAME := $(MOD_NAME)_$(VERSION)_$(GIT_VERSION)
ZIP_NAME := $(MOD_NAME)_$(VERSION)

.PHONY: clean sync

clean:
	rm -rf dist/

dist: clean
	mkdir -p dist
	rsync -r --exclude-from .makeignore . dist/$(RELEASE_NAME)
	cp -r dist/$(RELEASE_NAME) dist/$(ZIP_NAME)
	cd dist; zip -9yrm $(ZIP_NAME).zip $(ZIP_NAME)

sync: dist
ifndef FACTORIO_MOD_DIR
	$(error FACTORIO_MOD_DIR is undefined)
endif
	rsync -avr dist/$(RELEASE_NAME)/ $(FACTORIO_MOD_DIR)/$(MOD_NAME)_$(VERSION)
