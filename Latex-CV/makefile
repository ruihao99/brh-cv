# LaTeX Makefile
FILE=main

all: $(FILE).pdf

.PHONY:clean
clean:
	rm -f *.aux *.blg *.out *.bbl *.log *.toc *tdo *.lof *.bcf *.xml ${FILE}.fdb_latexmk ${FILE}.fls ${FILE}.synctex.gz ${FILE}.xdv ${FILE}.pdf ${FILE}.dvi

$(FILE).pdf: 
	latexmk -xelatex ${FILE}.tex
	# $(FILE).tex
	# pdflatex $(FILE)
	# biber $(FILE)
	# pdflatex $(FILE)
	# pdflatex $(FILE)
