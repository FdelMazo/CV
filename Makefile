spanish:
	pdflatex cv.tex
	pdflatex cv.tex
	mv cv.pdf cv-light.pdf
	pdflatex notas.tex
	pdflatex cv.tex
	mv cv.pdf cv-full.pdf
	mv cv-light.pdf cv.pdf
	$(MAKE) clean

english:
	pdflatex "\def\inenglish{1} \input{cv.tex}"
	pdflatex "\def\inenglish{1} \input{cv.tex}"
	mv cv.pdf cv-light.pdf
	pdflatex "\def\inenglish{1} \input{notas.tex}"
	pdflatex "\def\inenglish{1} \input{cv.tex}"
	mv cv.pdf cv-full.pdf
	mv cv-light.pdf cv.pdf
	$(MAKE) clean

clean:
	rm -rf *.aux *.log *.out