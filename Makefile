
INTERPRETER := sciphox
COMPILER := sciphox++
TRANSPILER := sciphox--

all: $(INTERPRETER)

$(INTERPRETER): object/token.o object/file.o object/lexer.o object/sciphox.o object/ast.o object/parser.o
	g++ -o bin/$(INTERPRETER) object/token.o object/file.o object/lexer.o object/sciphox.o object/ast.o object/parser.o

object/token.o: src/token.cpp
	g++ -g -Wall -Werror -c src/token.cpp -o object/token.o

object/file.o: src/file.cpp
	g++ -g -Wall -Werror -c src/file.cpp -o object/file.o

object/lexer.o: src/lexer.cpp
	g++ -g -Wall -Werror -c src/lexer.cpp -o object/lexer.o

object/ast.o: src/ast.cpp
	g++ -g -Wall -Werror -c src/ast.cpp -o object/ast.o

object/parser.o: src/parser.cpp
	g++ -g -Wall -Werror -c src/parser.cpp -o object/parser.o


object/sciphox.o: src/sciphox.cpp
	g++ -g -Wall -Werror -c src/sciphox.cpp -o object/sciphox.o

clean:
	-rm */*.o
	-rm bin/sciphox
	-clear

test:
	./bin/sciphox test/test.ppl

install:
	-cp bin/sciphox /usr/local/bin/