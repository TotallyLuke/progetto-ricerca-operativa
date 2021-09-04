OBJS	= thesis

default: refresh

clean:
	rm -f *.aux $(OBJS).pdf $(OBJS).ext *.idx *.ilg *.ind *.log *.lot *.lof *.tmp *.out *.glo *.gls *.fls *.fdb* *.toc *.xtr
	rm -f *.sc *.acn *.acr *.alg *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls
	rm -f *.ist *.lof *.log *.lot *.run.xml *.synctex *.toc *-frn.tex *.nlo

refresh:
	pdflatex $(OBJS)

full:
	latexmk -pdf $(OBJS); cp ./thesis.pdf /home/lucav/Documents/RO/single-school-bus-routing-main/veronese_luca_1187571_progetto_bus/relazione.pdf


force:
	latexmk -f -interaction=nonstopmode -quiet -pdf $(OBJS)

quiet:
	latexmk -pdf $(OBJS) -e '$$max_repeat = 1;' -silent || ( rm $(OBJS).pdf; latexmk -pdf $(OBJS) -e '$$max_repeat = 4;' )

%.pdf: %.dot
	dot -o $@ -Tpdf $<

clean-figures:
	rm -f $(FIGURES)

figures: $(FIGURES)

run:
	xdg-open $(OBJS).pdf

runk:
	okular $(OBJS).pdf

cycle:
	while sleep 3; do latexmk -pdf -interaction=nonstopmode $(OBJS); done
