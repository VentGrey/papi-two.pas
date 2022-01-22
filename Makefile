pc=fpc
PFLAGS=-O3 -opapitwo

build:
	$(pc) $(PFLAGS) papitwo.pas

run:
	./papitwo

clean:
	rm papitwo.o papitwo

