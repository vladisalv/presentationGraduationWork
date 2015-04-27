FILE = presentation
TEX = pdflatex --shell-escape
PDF_VIEW = evince

FILE_TEX = $(addprefix $(FILE), .tex)
FILE_PDF = $(addprefix $(FILE), .pdf)

TEX_FILES = $(wildcard *.tex)

.PHONY: view clean vim print

all: build

build: $(TEX_FILES)
	@echo "==============================================================================="
	@echo "============================ BEGIN WORK ======================================="
	@echo "==============================================================================="
	@$(TEX) $(FILE_TEX)
	@echo "==============================================================================="
	@echo "============================ FINISH WORK ======================================"
	@echo "==============================================================================="

view:
	@$(PDF_VIEW) $(FILE_PDF)

clean:
	@find $(FILE).* | grep -v tex | xargs rm -f
	@rm -f missfont.log


vim:
	@vim -s .vimopen

print:
	@echo "FILE = $(FILE)"
	@echo "FILE_TEX  = $(FILE_TEX)"
	@echo "FILE_AUX  = $(FILE_AUX)"
	@echo "TEX_FILES = $(TEX_FILES)"
