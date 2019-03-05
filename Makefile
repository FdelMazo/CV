all: cleanclean
	$(MAKE) spanish
	$(MAKE) english
	ln -s cv-es.pdf cv.pdf

spanish: clean
	pdflatex cv.tex
	pdflatex cv.tex
	mv cv.pdf cv-light.pdf
	pdflatex notas.tex
	pdflatex cv.tex
	mv cv.pdf cv-full-es.pdf
	mv cv-light.pdf cv-es.pdf
	$(MAKE) clean

english: clean
	pdflatex "\def\inenglish{1} \input{cv.tex}"
	pdflatex "\def\inenglish{1} \input{cv.tex}"
	mv cv.pdf cv-light.pdf
	pdflatex "\def\inenglish{1} \input{notas.tex}"
	pdflatex "\def\inenglish{1} \input{cv.tex}"
	mv cv.pdf cv-full-en.pdf
	mv cv-light.pdf cv-en.pdf
	$(MAKE) clean

notas: clean
	pdflatex notas.tex
	mv notas.pdf notas-es.pdf
	$(MAKE) clean
	pdflatex "\def\inenglish{1} \input{notas.tex}"
	mv notas.pdf notas-en.pdf
	$(MAKE) clean

clean:
	rm -rf *.aux *.log *.out *.fls *.fdb_latexmk notas.pdf

cleanclean: clean
	rm -rf *.pdf