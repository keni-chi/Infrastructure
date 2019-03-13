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

test02:
	@echo "test02 echo"
