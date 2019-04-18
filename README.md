# Latex-Templates [![Build Status](https://travis-ci.com/fh-trier/latex-templates.svg?branch=thesis)](https://travis-ci.com/fh-trier/latex-templates)

## Containing templates
Currently containing templates, seperated by git branches:
* master - Specialised for seminar papers, task sheets for tutorials or old exams
* thesis - Specialised for Bachelor's or Master's theses

## Intoduction
Download the repository using git.
```bash
$ git clone https://github.com/fh-trier/latex-templates.git
```

Decide on a template - [currently supported templates](https://github.com/fh-trier/latex-templates#containing-templates). For example master template.

```bash
$ git checkout master
```

Now you can edit the template using an editor. Editors such as Texstudio or Visual Studio Code with Plugin are available.

## Compilling the PDF document
There are two ways to compile the PDF document. Since the templates contain all dependencies to the package `minted`, it is probably easier to use a docker container to compile the document.

To do this, install docker and Make. If you have docker and Make installed run `make docker-latexmk` to compile the PDF document.

If you don't want to install docker and make you have to install texlive manually - [installation instructions](https://www.tug.org/texlive/).

## make commands

### clean
Deletes all files that were not checked in using git.

```bash
$ make clean
```

### create-hardlink
If the environment variable `FSD` is set, a hardlink to a directory can be created. FSD stands for Fachschaftsdaten. This is useful, for example, if you want to link the PDF document to another place in the system - for example in the system folder Documents of the operating system.

The path can be adjusted in the file `Makefile`. There the two variables `HARDLINK_PATH` and `HARDLINK_FILE`.

```bash
$ make create-hardlink
```

### delete-hardlink
Delete the defined hardlink.

```bash
$ make delete-hardlink
```

### docker-latex
Uses a docker container to compile the PDF document with `latexmk` By default the docker container `volkerraschek/docker-latex:latest` is used. However, it can also be modified. The Makefile contains the variable `IMAGE` for this purpose. However, you may have to change the docker command call in `docker-latexmk` if necessary.

```bash
$ make docker-latexmk
```

### docker-pdflatex
Similar to docker-latexmk, but in the container pdflatex is called instead of latexmk.

```bash
$ make docker-pdflatex
```

### latexmk
Executes latexmk natively in the system environment.

```bash
$ make latexmk
```

### pdflatex
Executes pdflatex natively in the system environment.

```bash
$ make pdflatex
```