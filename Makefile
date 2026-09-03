KOF ?= kof
ENTRY := main.kf

.PHONY: all version check run

all: check

version:
	@$(KOF) version

check:
	@$(KOF) check .

run:
	@$(KOF) run $(ENTRY)
