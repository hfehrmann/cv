PDFLATEX=pdflatex
OCAMLBUILD_OPT=-use-ocamlfind -classic-display -j 2
OCAMLBUILD=ocamlbuild ${OCAMLBUILD_OPT}

.PHONY: all clean

all:
	${OCAMLBUILD} cv.pdf

clean:
	${OCAMLBUILD} -clean

%:
	$(OCAMLBUILD) $@
