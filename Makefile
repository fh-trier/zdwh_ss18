TEX:=index.tex
IMAGE:=blang/latex:ubuntu

pdf:
	pdflatex \
		-shell-escape \
		-synctex=1 \
		-interaction=nonstopmode \
		-enable-write18 "${TEX}"
docker-pdf:
	./latexdockercmd.sh pdflatex \
		-shell-escape \
		-synctex=1 \
		-interaction=nonstopmode \
		-enable-write18 "${TEX}"
clean:
	git clean -fX
