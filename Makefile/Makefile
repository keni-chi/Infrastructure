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
VAR04 := abc def ghi

.PHONY: all
all:
	@echo "001----"
	@echo "$(filter %.cpp,$(VAR01))"
	@echo "$(filter-out %.cpp,$(VAR02))"	
	@echo "$(findstring xy,$(VAR03))"
	@echo "$(findstring bc,$(VAR03))"
	@echo "$(firstword $(VAR04))"
	@echo "005----"
