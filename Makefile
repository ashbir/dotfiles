SHELL := /bin/zsh

# Get all subdirectory names
CONFIG_DIRS := $(wildcard */.)

# Remove trailing slashes
CONFIG_NAMES := $(patsubst %/.,%,$(CONFIG_DIRS))

# Targets for cleaning individual configurations
CLEAN_TARGETS := $(addprefix clean-,$(CONFIG_NAMES))

.PHONY: all clean setup $(CONFIG_NAMES) list help no-all-setup $(CLEAN_TARGETS)

all: no-all-setup

setup: no-all-setup

no-all-setup:
	@echo "Bulk installation via 'make all' or 'make setup' is disabled."
	@echo "Please install configurations individually, e.g., 'make nvim'."
	@echo "To see available configurations, run: make list"
	@$(MAKE) list

$(CONFIG_NAMES):
	@echo "Creating common directories..."
	@mkdir -p ~/.config ~/.local/share ~/.local/bin
	@echo "Setting up $(@)"
	@stow $(@)

clean:
	@echo "Cleaning up all configurations. To clean a specific configuration, use 'make clean-<config_name>'."
	@for dir in $(CONFIG_NAMES); do \
		stow -D $$dir; \
		done

# Rule for cleaning a specific configuration
$(CLEAN_TARGETS): clean-%:
	@echo "Cleaning up $(patsubst clean-%,%,$@)"
	@stow -D $(patsubst clean-%,%,$@)

list:
	@echo "Available configurations:"
	@for dir in $(CONFIG_NAMES); do \
		echo "  - $$dir"; \
		done

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  all       Shows a message and lists available configurations. Does not install all."
	@echo "  setup     Alias for all."
	@echo "  <config>  Set up a specific configuration (e.g., make nvim)"
	@echo "  clean     Remove all configurations"
	@echo "  clean-<config> Remove a specific configuration (e.g., make clean-nvim)"
	@echo "  list      List available configurations"
	@echo "  help      Show this help message"
