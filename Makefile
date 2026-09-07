KOF ?= kof
ENTRY := main.kf
PROCESS ?=
MODULE ?=
VERBOSE ?= 0
BUILD_DIR ?= build

RUN_ARGS :=

ifneq ($(strip $(PROCESS)),)
RUN_ARGS += $(PROCESS)

ifneq ($(strip $(MODULE)),)
RUN_ARGS += $(MODULE)
endif

ifeq ($(VERBOSE),1)
RUN_ARGS += --verbose
endif
endif

.PHONY: all version check run build

all: check

version:
	@$(KOF) version

check:
	@$(KOF) check .

run:
	@$(KOF) run $(ENTRY) $(RUN_ARGS)

build:
	@$(KOF) build . --target native --output $(BUILD_DIR)
	@echo "ELF: $(BUILD_DIR)/Default/Main"
