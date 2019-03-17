X := "HELLO"
LENGTH := 3
test01:
	@echo "001----"
	ls
	@echo "002----"
	@ls
	@echo "003----"
	@echo $(X)
	@echo $(Y)
	@echo "004----"
	@make test02
	@echo "005----"
	@for i in {1..$(LENGTH)}; do \
	        echo $$i; \
	    done
	@echo "006----"


test02:
	@echo "test02 echo"


VAR01 := hoge.h hoge.cpp hogera.h hogera.cpp
VAR02 := hoge.h hoge.cpp hogera.h hogera.cpp
VAR03 := abc def ghi
VAR04 := hoge.cpp hogera.cpp
VAR05 := hoge foo hogera fuga
VAR06 := a b    c    d
VAR07 := hoge.cpp hogera.cpp test.java
VAR08 := ../ ./ ./dir Makefile
VAR09 := ./include ./dir/include
VAR10 := hoge.txt ./dir/hogera.txt
VAR11 := a b c d
VAR12 := 1 2 3 4 5
VAR13 := ./tmp/*.cpp ./*.md
VAR14 := abc
VAR15 := def
VAR16 := ghi
VAR17 = "var $1 $2"
define MACRO
    @echo "macro $1 $2"
endef

.PHONY: all
all:
	@echo "000----"
	@echo "$(filter %.cpp,$(VAR01))"
	@echo "$(filter-out %.cpp,$(VAR02))"	
	@echo "$(findstring xy,$(VAR03))"
	@echo "$(findstring bc,$(VAR03))"
	@echo "$(firstword $(VAR03))"
	@echo "$(lastword $(VAR03))"
	@echo "005----"
	@echo "$(patsubst %.cpp,%.o,$(VAR04))"
	@echo "$(sort $(VAR05))"
	@echo "$(strip $(VAR06))"
	@echo "$(subst .cpp,.o,$(VAR07))"
	@echo "$(word 1,$(VAR01))"	
	@echo "010----"
	@echo "$(wordlist 1,2,$(VAR03))"
	@echo "$(words $(VAR03))"
	@echo "$(abspath $(VAR08))"
	@echo "$(addprefix -I,$(VAR09))"
	@echo "$(addsuffix .bak,$(VAR01))"
	@echo "015----"
	@echo "$(basename $(VAR10))"
	@echo "$(dir $(VAR10))"
	@echo "$(join $(VAR11),$(VAR12))"
	@echo "$(notdir $(VAR10))"
	@echo "$(realpath $(VAR08))"
	@echo "020----"
	@echo "$(suffix $(VAR10))"
	@echo "021----"
	@echo "$(wildcard $(VAR13))"
	@echo "022----"
	@echo "$(and $(VAR14),$(VAR15),$(VAR16))"
	@echo "$(and $(VAR14),$(EMPTY),$(VAR16))"
	@echo "$(and $(VAR16),$(VAR15),$(VAR14))"
	@echo "023----"
	@echo "$(if $(VAR14),$(VAR15),$(VAR16))"
	@echo "$(if $(EMPTY),$(VAR15),$(VAR16))"
	@echo "024----"
	@echo "$(or $(VAR14),$(VAR15),$(VAR16))"
	@echo "$(or $(VAR14),$(EMPTY),$(VAR16))"
	@echo "$(or $(EMPTY),$(EMPTY),$(EMPTY))"
	@echo "$(or $(VAR16),$(VAR15),$(VAR14))"
	@echo "025----"	
	@echo "$(call VAR17,a,b)"
	$(call MACRO,a,b)
	$(call MACRO,c,d)
	@echo "026----"	
	@echo "$(shell ls)"

rule:
	@echo "rule----"	
	$(eval F := $(shell seq 10))
	@echo "start----"	
	@echo $(F)

a:
	@echo "a----"	
	$(eval A := $(shell date))
	@echo "set A"

b: a
	@echo "b----"	
	@echo $(A)
