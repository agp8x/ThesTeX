ThesTeX
=======

A LaTeX template for the bachelor or master thesis

Setup
-----

Edit the <code>\newcommand{\lang}{ngerman}</code> command to setup the language You write your submission in. Possible options are 
* <code>ngerman</code> and
* <code>english</code>.

Furthermore, edit the <code>config/metainfo.tex</code> file to include
* your name,
* the title and subtitle (in English and German),
* your desired degree,
* your study course,
* the name of your advisor,
* the submission location of your thesis and
* the submission date.

Compiling the Source Code
-------------------------

### texmaker

Use `pdflatex`, `makeindex` and `bibtex` to generate a readable document.
If You use texmaker, you can include the following command to automatically compile the sources: 
<code>pdflatex -synctex=1 -interaction=nonstopmode %.tex | bibtex % | makeindex -s config/index.ist % | makeindex %.nlo -s nomencl.ist -o %.nls | pdflatex -synctex=1 -interaction=nonstopmode %.tex | pdflatex -synctex=1 -interaction=nonstopmode %.tex</code>

### make

Using make, there are different targets available:

* full: just like the command for texmaker (default)
* latex: only pdflatex
* bibtex
* index
* nomecl -(ature)
* fast: pdflatex, bibtex, pdflatex
* clean: remove all temporary and auxiliary files, keep pdf
* wipe: clean + remove pdf
* dot: build dot-graphs from dot/ to image/
* spell: spellcheck all content-files
* spell1 F=<file/pattern>: spellcheck file or file-pattern `make spell1 F=1-*`
* todo: find all TODO's