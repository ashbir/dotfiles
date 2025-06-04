SHELL := /bin/zsh

# Get all subdirectory names
CONFIG_DIRS := $(wildcard */.)

# Remove trailing slashes
CONFIG_NAMES := $(patsubst %/.,%,$(CONFIG_DIRS))

.PHONY: all clean setup

all: setup

setup: $(CONFIG_NAMES)

$(CONFIG_NAMES):
	@echo "Creating common directories..."
	@mkdir -p ~/.config ~/.local/share ~/.local/bin
	@echo "Setting up $(@)"
	@stow $(@)

clean:
	@echo "Cleaning up all configurations"
	@for dir in $(CONFIG_NAMES); do \
		stow -D $$dir; \
		done

list:
	@echo "Available configurations:"
	@for dir in $(CONFIG_NAMES); do \
		echo "  - $$dir"; \
		done

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  all       Set up all configurations (default)"
	@echo "  setup     Alias for all"
	@echo "  <config>  Set up a specific configuration (e.g., make nvim)"
	@echo "  clean     Remove all configurations"
	@echo "  list      List available configurations"
	@echo "  help      Show this help message"
