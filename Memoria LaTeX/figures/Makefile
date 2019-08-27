TARGET=\
	uclm_logomarca_1.pdf \
	uclm_logomarca_1.png \
	uclm_logomarca_1_bb.png \
	uclm_logomarca_3.pdf \
	uclm_logo.pdf \
	uclm_logo.png \
	uclm_logo_watermark.pdf \
	uclm_logo_watermark.png \
	informatica.pdf \
	informatica.png \
	informatica_30.png \
	informatica_gray.pdf \
	informatica_gray.png \
	informatica_gray_30.png \
	informatica_line.png \
	esi.png \
	esi.pdf \
	arco.pdf \
	arco.png \
	arco_bw.png \
	arco_gray.png \
	arco_white.pdf \
	arco_watermark.pdf

all: $(TARGET)

ifndef EPS2PDF
EPS2PDF=epstopdf --filter
endif

ifndef FIG2DEV
FIG2DEV=fig2dev
endif

ifndef PSTOPS
PSTOPS=pstops
endif


INKSCAPE=inkscape

%.pdf: %.svg
	$(INKSCAPE) -A $@ $<

%.ps: %.svg
	$(INKSCAPE) -P $@ $<

%.png: %.svg
	$(INKSCAPE) -d 300 -e $@ $<

%_30.png: %.svg
	$(INKSCAPE) -d 30 -e $@ $<

%_gray_30.png: %.gray.svg
	$(INKSCAPE) -d 30 -e $@ $<

%_bw.svg: %.svg
	cp $< $@
	$(INKSCAPE) -f $@ \
	--select=main --verb=org.inkscape.color.removegreen \
	--select=main --verb=org.inkscape.color.removeblue \
	--select=main --verb=org.inkscape.color.removered \
	--verb=FileSave --verb=FileQuit

%_bb.svg: %.svg
	cp $< $@
	$(INKSCAPE) -f $@ \
	--select=background --verb=org.inkscape.color.removegreen \
	--select=background --verb=org.inkscape.color.removeblue \
	--select=background --verb=org.inkscape.color.removered \
	--verb=FileSave --verb=FileQuit

%_gray.svg: %.svg
	cp $< $@
	$(INKSCAPE) -f $@ \
	--verb=org.inkscape.color.grayscale \
	--verb=org.inkscape.color.morelight \
	--verb=org.inkscape.color.morelight \
	--verb=FileSave --verb=FileQuit

%_watermark.svg: %_bw.svg
	cp $< $@
	$(INKSCAPE) -f $@ \
	--verb=org.inkscape.color.morelight --verb=org.inkscape.color.morelight \
	--verb=org.inkscape.color.morelight --verb=org.inkscape.color.morelight \
	--verb=org.inkscape.color.morelight --verb=org.inkscape.color.morelight \
	--verb=org.inkscape.color.morelight --verb=org.inkscape.color.morelight \
	--verb=org.inkscape.color.morelight --verb=org.inkscape.color.morelight \
	--verb=org.inkscape.color.morelight --verb=org.inkscape.color.morelight \
	--verb=org.inkscape.color.morelight --verb=org.inkscape.color.morelight \
	--verb=org.inkscape.color.morelight --verb=org.inkscape.color.morelight \
	--verb=org.inkscape.color.morelight --verb=org.inkscape.color.morelight \
	--verb=org.inkscape.color.morelight --verb=org.inkscape.color.morelight \
	--verb=FileSave --verb=FileQuit

%_alpha.svg: %.svg
	cp $< $@
	$(INKSCAPE) -f $@ \
	--select=background --verb=EditDelete \
	--verb=FileSave --verb=FileQuit

%_white.svg: %_alpha.svg
	cp $< $@
	$(INKSCAPE) -f $@ \
	--select=main --verb=org.inkscape.color.removegreen \
	--select=main --verb=org.inkscape.color.removeblue \
	--select=main --verb=org.inkscape.color.removered \
	--select=main --verb=org.inkscape.color.negative \
	--verb=FileSave --verb=FileQuit

%_negate.svg: %_bw.svg
	cp $< $@
	$(INKSCAPE) -f $@ \
	--verb=org.inkscape.color.negative \
	--verb=FileSave --verb=FileQuit

%_line.png: %_gray.png
	convert -alpha off -edge 1 -negate $< $@

%_noalpha.png: %.png
	convert -alpha off $< $@

%_gray.png: %_noalpha.png
	convert -colorspace gray $< $@

%_bw.png: %_gray.png
	convert -threshold 60% $< $@

%_negate.png: %_bw.png
	convert -alpha off -negate $< $@

%-mask.png: %_negate.png
	convert -brightness-contrast +60 $< $@

#%.ps: %.pdf
#	acroread -toPostScript -fast -level2 -printerhalftones \
#	   -scale 100 -size a4 -landscape $< > $@

%.ps: %.mp
	mpost $<
	@if [ ! -f $*.1 ]; then \
	    echo "make: *** $@ does not contain figure 1." 1>&2; \
	else \
	    mv -f $*.1 $@ ; \
	fi

#	convert $@ $<

%.eps: %.fig
	$(FIG2DEV) -L eps $< $@

%.pdf: %.eps
	$(EPS2PDF) < $< > $@

%.pdf: %.ps
	$(EPS2PDF) < $< > $@

%-mini.ps: %.ps
	pstops -pa4 -d '2:0@.6R(2cm,28cm)+1@.6R(2cm,14cm)' $< > $@

%.eps: %.png
	pngtopnm $< | pnmtops -noturn > $@

clean::
	$(RM) *~
	$(RM) *.dvi
	$(RM) *.aux *.log
	$(RM) *.bbl *.blg
	$(RM) *.toc *.lot *.lof
	$(RM) *.1
	$(RM) $(TARGET)

vclean: clean
	$(RM) $(TARGET)

.PRECIOUS: %.aux %.log %.bbl %.blg %.dvi

# Local variables:
#  mode: makefile
# End:
