#using https://github.com/25th-floor/docker-make-stub

include ./make/*.mk

IMAGE=$(REGISTRY_HOST)/$(USERNAME)/$(NAME)
TAG=$(shell . $(RELEASE_SUPPORT); getTag)
USERNAME=$(USER)
SHELL=/bin/bash

#NAME=$(shell basename $(PWD))

.PHONY: all
all: ##@Examples Run all examples
all: example-se example-interface

.PHONY: example-se
example-se: ##@Examples How to use $(shell_env)
	@echo ""
	@echo 'example: how to to use $$(shell_env)'
	@printf "=%.0s" {1..80}
	@echo ""
	@echo '$$(shell_env) my_command'
	$(shell_env) echo "echoing I_AM_A_VARIABLE=$${I_AM_A_VARIABLE}"

.PHONY: example-interfaces
example-interface:: ##@Examples Abuse double-colon rules
	@echo ""
	@echo "example: using double-colon rules to create and implement interface-ish targets"
	@printf "=%.0s" {1..80}
	@echo ""
	@echo "define 'target:: ##@Category not implemement' in .mk"
	@echo "implement 'target:: ##@Category this is nice' in Makefile"