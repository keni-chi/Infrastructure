X := "HELLO"
LENGTH := 3
test01:
	@echo "001----"
	ls
	@echo "002----"
	@ls
	@echo "003----"
	@echo $(X)
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

.PHONY: all
all:
	@echo "001----"
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
