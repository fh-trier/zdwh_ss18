# Docker Image
IMAGE:=blang/latex:ubuntu

# Input tex-file and output pdf-file
TEX_NAME := index.tex
PDF_NAME := index.pdf

# Hardlink-Path and Hardlink-File
HARDLINK_PATH := ${HOME}/pdf
HARDLINK_FILE := tmp.pdf

pdf:
	pdflatex \
		-shell-escape \
		-synctex=1 \
		-interaction=nonstopmode \
		-enable-write18 "${TEX_NAME}"

docker-pdf:
	./latexdockercmd.sh pdflatex \
		-shell-escape \
		-synctex=1 \
		-interaction=nonstopmode \
		-enable-write18 "${TEX_NAME}"

clean:
	git clean -fX

create-hardlink: delete-hardlink pdf
	if [ ! -d ${HARDLINK_PATH} ]; \
	then \
		mkdir -p ${HARDLINK_PATH}; \
	fi;

	ln ${PWD}/${PDF_NAME} ${HARDLINK_PATH}/${HARDLINK_FILE}; \

delete-hardlink:
	if [ -f ${HARDLINK_PATH}/${HARDLINK_FILE} ]; \
	then \
		rm -R ${HARDLINK_PATH}/${HARDLINK_FILE}; \
	fi;
