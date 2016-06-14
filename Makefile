MAINFILE = arbeit
DOTTYPE = pdf
DOTSRC = dot/
IMGDIR = image/dot/
DOT_WILDCARD = $(DOTSRC)/*.dot
DOTS = $(wildcard $(DOT_WILDCARD))
DOTOUTS = $(patsubst %.dot, %.$(DOTTYPE), $(DOTS))
full:
	make clean
	pdflatex -synctex=1 -interaction=nonstopmode $(MAINFILE).tex
	bibtex $(MAINFILE)
	makeindex -s config/index.ist $(MAINFILE)
	makeindex $(MAINFILE).nlo -s nomencl.ist -o $(MAINFILE).nls
	pdflatex -synctex=1 -interaction=nonstopmode $(MAINFILE).tex
	pdflatex -synctex=1 -interaction=nonstopmode $(MAINFILE).tex
fast:
	pdflatex -synctex=1 -interaction=nonstopmode $(MAINFILE).tex
	bibtex $(MAINFILE)
	pdflatex -synctex=1 -interaction=nonstopmode $(MAINFILE).tex
latex:
	pdflatex -synctex=1 -interaction=nonstopmode $(MAINFILE).tex
bibtex:
	bibtex $(MAINFILE)
index:
	makeindex -s config/index.ist $(MAINFILE)
nomecl:
	makeindex $(MAINFILE).nlo -s nomencl.ist -o $(MAINFILE).nls
clean:
	@rm -f $(MAINFILE).aux
	@rm -f $(MAINFILE).bbl
	@rm -f $(MAINFILE).blg
	@rm -f $(MAINFILE).idx
	@rm -f $(MAINFILE).ilg
	@rm -f $(MAINFILE).ind
	@rm -f $(MAINFILE).loa
	@rm -f $(MAINFILE).lof
	@rm -f $(MAINFILE).log
	@rm -f $(MAINFILE).lol
	@rm -f $(MAINFILE).lot
	@rm -f $(MAINFILE).nlo
	@rm -f $(MAINFILE).nls
	@rm -f $(MAINFILE).out
	@rm -f $(MAINFILE).synctex.gz
	@rm -f $(MAINFILE).toc
wipe:
	@make clean
	@rm -f $(MAINFILE).pdf
	@rm -f build.number
	@rm -f gitHeadInfo.gin
spell:
	@for i in content/*.tex; do \
	    aspell -l $(LANG) -c $$i; done
spell1:
	@aspell -l $(LANG) -c content/$(F).tex
todo:
	@grep --color=always -in "TODO" content/*.tex
dot: $(DOTOUTS)
%.$(DOTTYPE) : %.dot | $(IMGDIR)
	dot -T$(DOTTYPE) $< -o $(patsubst $(DOTSRC)/%, $(IMGDIR)/%, $@)
$(IMGDIR):
	@mkdir -p $(IMGDIR)
