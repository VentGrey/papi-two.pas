pc=fpc
PFLAGS=-O4 -opapitwo
SRC=papitwo.pas
EXE=papitwo

build:
	$(pc) $(PFLAGS) $(SRC)

run: $(EXE)
	./$(EXE)

$(EXE): $(SRC)
	$(pc) $(PFLAGS) $(SRC)

clean:
	rm -f $(EXE) *.o
