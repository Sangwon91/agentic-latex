# LaTeX 논문 템플릿

한국어 학술 논문 작성을 위한 기본 LaTeX 템플릿입니다.

## 파일 구조

```
├── main.tex          # 메인 논문 파일
├── references.bib    # 참고문헌 데이터베이스
├── Makefile         # 컴파일 자동화
├── figures/         # 그림 파일 저장 디렉토리
└── README.md        # 사용 설명서
```

## 필요한 패키지

Ubuntu/Debian 기반 시스템:
```bash
sudo apt-get install texlive-full texlive-lang-korean
```

또는 최소 설치:
```bash
sudo apt-get install texlive-latex-base texlive-latex-extra texlive-fonts-recommended texlive-lang-korean
```

## 컴파일 방법

### 1. Makefile 사용 (권장)

```bash
# 완전 컴파일 (참고문헌 포함)
make

# 빠른 컴파일 (참고문헌 제외)
make quick

# 임시 파일 정리
make clean

# 모든 생성 파일 정리
make distclean

# 파일 변경 시 자동 컴파일
make watch

# 도움말 보기
make help
```

### 2. 수동 컴파일

```bash
# 참고문헌이 있는 경우
pdflatex main
bibtex main
pdflatex main
pdflatex main

# 참고문헌이 없는 경우
pdflatex main
```

## 템플릿 구성

### 메인 섹션
- **초록 (Abstract)**: 연구 요약
- **서론**: 연구 배경, 목적, 논문 구성
- **관련 연구**: 기존 연구 분석
- **제안 방법론**: 연구 방법 상세 설명
- **실험 및 결과**: 실험 설정과 결과 분석
- **논의**: 결과 해석과 한계점
- **결론**: 주요 기여점과 향후 연구

### 포함된 패키지들
- **kotex**: 한국어 지원
- **amsmath, amsfonts, amssymb**: 수학 기호
- **graphicx**: 그림 삽입
- **algorithm, algorithmic**: 알고리즘 표현
- **booktabs**: 표 스타일링
- **listings**: 코드 블록
- **hyperref**: 하이퍼링크

## 사용 방법

1. **제목과 저자 정보 수정**:
   ```latex
   \title{논문 제목을 여기에 입력하세요}
   \author{저자명\\소속\\이메일}
   ```

2. **그림 추가**:
   ```latex
   \begin{figure}[htbp]
       \centering
       \includegraphics[width=0.8\textwidth]{figures/그림파일명.png}
       \caption{그림 설명}
       \label{fig:그림라벨}
   \end{figure}
   ```

3. **참고문헌 인용**:
   ```latex
   \cite{참고문헌키}
   ```

4. **표 추가**:
   ```latex
   \begin{table}[htbp]
   \centering
   \caption{표 제목}
   \begin{tabular}{lcc}
   \toprule
   항목 & 값1 & 값2 \\
   \midrule
   데이터 & 10 & 20 \\
   \bottomrule
   \end{tabular}
   \end{table}
   ```

## 참고문헌 관리

`references.bib` 파일에 참고문헌을 추가하고, 논문에서 `\cite{키}` 명령어로 인용하세요.

### 참고문헌 타입별 예시:

- **학술지 논문**: `@article`
- **학회 논문**: `@inproceedings`
- **도서**: `@book`
- **웹사이트**: `@misc`
- **학위논문**: `@phdthesis`
- **기술보고서**: `@techreport`

## 문제 해결

### 한국어가 제대로 표시되지 않는 경우:
```bash
sudo apt-get install fonts-nanum texlive-lang-korean
```

### 컴파일 오류가 발생하는 경우:
```bash
make clean
make
```

### 참고문헌이 나타나지 않는 경우:
1. `references.bib` 파일에 참고문헌이 있는지 확인
2. 논문에서 `\cite{}` 명령어로 인용했는지 확인
3. `make` 명령어로 완전 컴파일 실행

## 추가 팁

- 그림 파일은 `figures/` 디렉토리에 저장하세요
- PDF, PNG, JPG 형식의 그림을 권장합니다
- 수식은 `$...$` (인라인) 또는 `\[...\]` (블록) 사용
- 코드는 `\begin{lstlisting}` 환경 사용
- 알고리즘은 `\begin{algorithm}` 환경 사용 