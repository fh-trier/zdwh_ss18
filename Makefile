TEX:=index.tex
IMAGE:=blang/latex:ubuntu

HARDLINK_PATH := "${HOME}/Dokumente/Studium/Fachschaftdaten/tmp.pdf"

create-hardlink: delete-hardlink pdf
	ln "${PWD}/index.pdf" ${HARDLINK_PATH}

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

delete-hardlink:
	if [ -f ${HARDLINK_PATH} ]; \
	then \
		rm ${HARDLINK_PATH} ; \
	fi;
