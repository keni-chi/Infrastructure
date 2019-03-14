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

VAR := hoge.h hoge.cpp hogera.h hogera.cpp
.PHONY: all
all:
	@echo "$(filter %.cpp,$(VAR))"

VAR := hoge.h hoge.cpp hogera.h hogera.cpp

.PHONY: all02
all02:
	@echo "$(filter-out %.cpp,$(VAR))"	
