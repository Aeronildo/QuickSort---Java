JC      = javac
JVM     = java
FLAGS   = -ea
SRC     = StdIn.java StdOut.java StdRandom.java Quick.java
INPUT   = Words3.txt

.PHONY: all run clean

all: $(SRC:.java=.class)

%.class: %.java
	$(JC) $<

# Garante ordem de compilação das dependências
StdIn.class: StdIn.java
	$(JC) StdIn.java

StdOut.class: StdOut.java
	$(JC) StdOut.java

StdRandom.class: StdRandom.java
	$(JC) StdRandom.java

Quick.class: Quick.java StdIn.class StdOut.class StdRandom.class
	$(JC) Quick.java

run: Quick.class
	$(JVM) $(FLAGS) Quick < $(INPUT)

clean:
	rm -f *.class
