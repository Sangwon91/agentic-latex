# LaTeX 논문 컴파일을 위한 Makefile

# 변수 설정
MAIN = main
TEX = $(MAIN).tex
PDF = $(MAIN).pdf
BIB = references.bib

# 기본 타겟
all: $(PDF)

# PDF 생성 (참고문헌 포함)
$(PDF): $(TEX) $(BIB)
	pdflatex --shell-escape $(MAIN)
	bibtex $(MAIN)
	pdflatex --shell-escape $(MAIN)
	pdflatex --shell-escape $(MAIN)

# 빠른 컴파일 (참고문헌 없이)
quick: $(TEX)
	pdflatex --shell-escape $(MAIN)

# 정리
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz

# 완전 정리 (PDF 포함)
distclean: clean
	rm -f $(PDF)

# 연속 컴파일 (파일 변경 감지)
watch:
	@echo "파일 변경을 감지하여 자동 컴파일합니다. Ctrl+C로 중단하세요."
	@while true; do \
		inotifywait -e modify $(TEX) $(BIB) 2>/dev/null && make quick; \
	done

# 도움말
help:
	@echo "사용 가능한 명령어:"
	@echo "  make       - 참고문헌을 포함한 완전 컴파일"
	@echo "  make quick - 빠른 컴파일 (참고문헌 제외)"
	@echo "  make clean - 임시 파일 정리"
	@echo "  make distclean - 모든 생성 파일 정리"
	@echo "  make watch - 파일 변경 시 자동 컴파일"
	@echo "  make help  - 이 도움말 표시"

.PHONY: all quick clean distclean watch help 