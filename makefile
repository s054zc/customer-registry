SUBS = SUB001.cob	\
			 SUB101.cob \
			 SUB102.cob \
			 SUB103.cob \
			 SUB104.cob \
			 SUB200.cob \
			 SUB210.cob \
			 SUB220.cob \
			 SUB230.cob \
			 SUB240.cob			 

all: build run

build:
	cobc -x -o PGM001 PGM001.cob $(SUBS)

build-test:
	cobc -x -o TST001 TST001.cob $(SUBS)

run:
	./PGM001

run-test:
	./TST001

clear-data:
	rm -f data/*