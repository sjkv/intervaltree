SHELL=bash

SCRIPTS_DIR=$(PWD)/scripts

TEMPS=$(shell find intervaltree/ -type f -name '*.py?')
TEMPS+=$(shell find intervaltree/ -type d -name '__pycache__')
TEMPS+=$(shell find test/ -type f -name '*.py?')
TEMPS+=$(shell find test/ -type d -name '__pycache__')

# first target is default
test:
	"$(SCRIPTS_DIR)/testall.sh"

clean: clean-eggs clean-temps
	
clean-temps:
	@[[ "   " == "$(TEMPS)" ]] ||      	\
		(echo 'Removing:' && rm -rfv $(TEMPS))

clean-eggs:
	rm -rf *.egg*


.PHONY: clean clean-eggs clean-all test

