# University Homework & Quiz \LaTeX{} Template (HWQ)

A general-purpose, bilingual (Persian/English) academic document template for university courses, designed for the **University of Tehran** and adaptable to any academic institution.

This repository includes two specialized document classes:
1. **`homework.cls`** — For comprehensive homework assignments, problem sets, and lab reports with multiple header styles.
2. **`quiz.cls`** — For short exams, quizzes, and classroom assessments with student information fields and answer boxes.

---

## Key Features

* **Dual Academic Classes:**
  * **Homework (`homework.cls`):** Supports classic banner headers (`header-type=1`) and modern side-by-side headers (`header-type=2`).
  * **Quiz (`quiz.cls`):** Purpose-built for quizzes with student ID, name, duration, and framed answer boxes.
* **Course-Agnostic Architecture:** Easily adapt either template for any course (*Algorithms*, *Automata Theory*, *Operating Systems*, *Discrete Mathematics*, *Machine Learning*, *Circuits*) by updating simple metadata variables.
* **Smart Asset & Font Locator:** Automatically detects `Fonts/` and `Background/` directories up to 5 nested folder levels, allowing deep project organization without broken paths.
* **Full Bilingual Support (XePersian):** Native bidirectional typesetting with bundled high-quality Persian TrueType fonts (*XB Niloofar*, *XB Zar*, *IRZar*, *IRLotus*, *XB Yas*) and clean `\LRE{...}` / `\setlatin` direction switching.
* **Modular Question Management (Subfiles):** Organize complex assignments into separate question files (`Q1.tex`, `Q2.tex`) seamlessly combined via `\subfile{...}`.
* **Solution Visibility Switch:** Toggle solutions on or off globally using the `compileanswers` boolean flag.
* **Code Highlighting with Minted:** Typeset elegant, syntax-highlighted code blocks for Python, C/C++, Verilog, Java, and other languages.

---

## Repository Structure

* **`homework.cls`** — Homework document class:
  * Originally created by [jez](https://github.com/jez/latex-homework-class).
  * Enhanced by [Behzad Shayegh](https://github.com/BehzadShayegh), [Borna Tavasoli](https://github.com/borna-tl), and [Hesam Asadollahzadeh](https://github.com/HesamAsad) for Persian typography.
  * Adapted for FLAT by [Mehdi Jamalkhah](https://github.com/MehdiJmlkh).
  * Maintained & expanded by [Mohammad Khoshroo](https://github.com/Mohammad-Khoshroo) with multi-style headers, margin-extension layouts, and nested-directory font detection.
* **`quiz.cls`** — Specialized document class for quizzes and short exams (آزمونک / کوییز):
  * Built-in student information block (زمان پاسخگویی، نام و نام خانوادگی، شماره دانشجویی).
  * Answer box environment (`\answerbox{...}`).
  * Alphabetic (`alphaparts`) and Arabic (`arabicparts`) sub-item environments.
* **`Background/`** — High-resolution logos (University of Tehran seal & Faculty of Engineering emblem).
* **`Fonts/`** — Standard Persian TrueType fonts bundled directly in the repository (*XB Niloofar*, *XB Zar*, *IRZar*, *IRLotus*, *XB Yas*).
* **`HW.tex`** — Master document demonstrating homework configuration with `header-type=2`.
* **`latexmkrc`** — Universal build configuration for Overleaf and local `latexmk` XeLaTeX compilation.
* **`LaTeX-build/`** — Dedicated output directory for compilation artifacts (`.pdf`, `.log`, `.aux`).

---

## Homework Template (`homework.cls`)

### Header Types

The homework class supports two distinct header designs:

| Header Type | Flag / Command | Description |
| :--- | :--- | :--- |
| **Type 1 (Classic Banner)** | `header-type=1` (Default) | Classic centered academic banner featuring Faculty emblem on the right and University seal on the left. |
| **Type 2 (Modern Wide)** | `header-type=2` | Modern horizontal layout with prominent 2.0cm side-by-side logos on the right, bisecting dividing rule, and single-line course/instructor/deadline info utilizing the page margins. |

You can set the header type in the document options or in the preamble:
```latex
\documentclass[12pt,largemargins,header-type=2]{homework}
% Or dynamically:
% \setheadertype{2}
```

### Homework Configuration Example (`HW.tex`)

```latex
\documentclass[12pt,largemargins,header-type=2]{homework}

% --- Course & Assignment Metadata ---
\newcommand{\eventclass}{نظریه زبان‌ها و ماشین‌ها}  % Course Title
\newcommand{\eventsemester}{بهار ۱۴۰۵}              % Semester
\newcommand{\eventtype}{تمرین شماره}                % Assignment Type
\newcommand{\eventnum}{2}                           % Assignment Number
\newcommand{\eventinstructor}{دکتر فدایی و دکتر یعقوب‌زاده} % Instructors
\newcommand{\eventcntrbs}{محمد خوشرو}               % Contributor / TA
\newcommand{\hwemail}{mvrkhoshroo83@ut.ac.ir}       % Contact Email

% --- Submission Deadline ---
\newcommand{\eventdatetype}{آخرین مهلت تحویل:}
\newcommand{\eventDeadlineDay}{8}
\newcommand{\eventDeadlineMonth}{اردیبهشت}
\newcommand{\eventDeadlineYear}{1405}
\newcommand{\eventDeadlineHour}{23:59}              % Time (rendered as ۲۳:۵۹)

% --- Toggle Solutions ---
\newboolean{compileanswers}
% \setboolean{compileanswers}{true} % Uncomment to compile with solutions

\begin{document}
\makeheader

\subfile{Q-A/Q1.tex}
\clearpage
\subfile{Q-A/Q2.tex}

\end{document}
```

---

## Quiz Template (`quiz.cls`)

The `quiz.cls` class is tailored specifically for classroom quizzes, short tests, and mid-term assessments.

### Quiz Configuration Example

```latex
\documentclass[12pt,largemargins]{quiz}

% --- Quiz Metadata ---
\newcommand{\eventclass}{ریاضیات گسسته}        % Course Title
\newcommand{\eventtype}{آزمون کوتاه}           % Exam Type (default: کوییز شماره)
\newcommand{\eventnum}{نهم}                    % Quiz Number
\newcommand{\eventname}{نظریه اعداد}           % Topic / Chapter
\newcommand{\eventcntrbs}{استاد: فائزه محمدی}   % Instructor / Designer
\newcommand{\eventdatetype}{تاریخ برگزاری}      % Date Prefix
\newcommand{\eventdate}{۱۴۰۴/۱۰/۰۷}            % Date
\newcommand{\quiztime}{۱۵ دقیقه}               % Duration

\begin{document}
\maketitle

\question
همه‌ی اعداد طبیعی مانند $a$ و $b$ را بیابید به طوری که:
\[
\frac{1}{a} + \frac{1}{b} = \frac{1}{101}
\]

\answerbox{2.5cm} % Framed box for student answer

\solution
پاسخ تشریحی سوال در این بخش قرار می‌گیرد.

\question*{سوال تستی / تشریحی با زیربخش}
\begin{alphaparts}
  \questionpart بخش اول سوال
  \questionpart بخش دوم سوال
\end{alphaparts}

\end{document}
```

### Document Class Options

| Option | Classes | Description |
| :--- | :--- | :--- |
| `largemargins` | `homework`, `quiz` | Widens page margins to provide ample space for grading remarks and notes. |
| `newpage` | `homework`, `quiz` | Automatically inserts a page break (`\newpage`) before every question. |
| `anonymous` | `homework`, `quiz` | Suppresses author/contributor information for blind grading. |
| `header-type=1\|2` | `homework` | Selects between Classic Banner (`1`) and Modern Side-by-Side (`2`) headers. |
| `nostudentinfo` | `quiz` | Suppresses the student information block (نام، شماره دانشجویی، زمان). |

---

## Question, Solution & Quiz Commands

| Command / Environment | Class | Description |
| :--- | :--- | :--- |
| `\question` | Both | Generates a numbered question heading with a colored dividing line. |
| `\question*{Title}` | Both | Generates a custom-titled question heading. |
| `\question#{Points}` | `homework` | Generates a question heading with an allocated points badge (e.g., `سوال یک : (۱۰ نمره)`). |
| `\solution` | Both | Creates a solution header with a red dividing rule. |
| `\solution*{Title}` | Both | Creates a custom-titled solution header. |
| `\answerbox{height}` | `quiz` | Creates an empty framed box of specified height for student answers. |
| `\ExternalLink` | Both | Renders an inline external link TikZ icon. |
| `\begin{alphaparts} ... \end{alphaparts}` | Both | Formats sub-questions labeled as `(الف)`, `(ب)` or `(a)`, `(b)`. |
| `\begin{arabicparts} ... \end{arabicparts}` | Both | Formats sub-questions labeled as `1.1)`, `1.2)`. |

---

## 📁 Subfiles & Multi-File Architecture

This template utilizes the `subfiles` package so large assignments can be organized into modular question files inside `Q-A/` (e.g., `Q-A/Q1.tex`, `Q-A/Q2.tex`) and combined seamlessly into `HW.tex`.

### Always Compiling the Master Document (`HW.tex`)

When editing an isolated subfile inside `Q-A/`, TeX editors may attempt to compile only that individual subfile rather than the master `HW.tex` document.

1. **Magic Root Comment (Universal):**
   Every subfile in `Q-A/` starts with a standard TeX magic comment pointing to the parent root:
   ```latex
   %! TEX root = ../HW.tex
   ```
2. **VS Code LaTeX Workshop Configuration:**
   Add the following options to your `.vscode/settings.json`:
   ```json
   "latex-workshop.latex.rootFile.useSubFile": false,
   "latex-workshop.latex.rootFile.doNotPrompt": true
   ```
   A pre-configured `.vscode/settings.json` is included in this repository.

---

## Code Listings with Minted

Use the `minted` package to embed syntax-highlighted code. When working inside a Persian environment, wrap the code inside `\LRE{...}`:

```latex
\begin{LRE}
\begin{minted}[frame=lines,framesep=2mm,linenos,fontsize=\small]{python}
import numpy as np

def solve_system(A, b):
    """Solve linear system Ax = b and verify residual norm."""
    x = np.linalg.solve(A, b)
    residual = np.linalg.norm(np.dot(A, x) - b)
    return x, residual
\end{minted}
\end{LRE}
```

---

## Compilation Requirements

* **Compiler Engine:** `xelatex` (mandatory for `xepersian` font and script processing; do **not** use `pdflatex`).
* **Flag:** `-shell-escape` (required by `minted` for Pygments syntax highlighting).
* **Python Dependency:** Python 3 with `pygments` package (`pip install pygments`) when compiling locally with code blocks.
* **Two-Pass Compilation:** Run the compiler twice on initial build to populate cross-references, outlines, and minted cache files.

---

## Compilation & Setup Guide

### 1. Overleaf (Cloud — No Local Installation Required)

1. Compress the project folder into a `.zip` archive (exclude any local `LaTeX-build/` folder).
2. On [Overleaf](https://www.overleaf.com), click **New Project** $\rightarrow$ **Upload Project** and select your `.zip` archive.
3. The repository includes an official `latexmkrc` file at the root:
   ```perl
   $pdf_mode = 5; # Force XeLaTeX
   $xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -shell-escape %O %S';
   ```
   This automatically instructs Overleaf's build workers to compile with **XeLaTeX** and `-shell-escape`.
4. In Overleaf's top-left **Menu**, set **Main document** to `HW.tex` (or your quiz file).
5. Click **Recompile**. All Persian fonts bundled in `Fonts/` are loaded seamlessly!

#### Multi-Assignment Setup on Overleaf

```text
/ (Overleaf Project Root)
├── latexmkrc
├── homework.cls
├── quiz.cls
├── Fonts/
├── Background/
├── HW1/
│   ├── HW.tex
│   └── Q-A/
│       ├── Q1.tex
│       └── Q2.tex
└── Quiz1/
    └── Quiz.tex
```
Thanks to the smart font locator, `homework.cls` and `quiz.cls` automatically detect root assets from any subfolder level.

---

### 2. Visual Studio Code + LaTeX Workshop

1. Install the **LaTeX Workshop** extension (`Ctrl + Shift + X`).
2. Make sure Python and `pygments` are installed:
   ```powershell
   pip install pygments
   ```
3. Configure a two-pass XeLaTeX recipe in `settings.json`:
   ```json
   "latex-workshop.latex.tools": [
     {
       "name": "xelatex",
       "command": "xelatex",
       "args": [
         "-synctex=1",
         "-interaction=nonstopmode",
         "-output-directory=%OUTDIR%",
         "-file-line-error",
         "-shell-escape",
         "%DOC%"
       ]
     }
   ],
   "latex-workshop.latex.recipes": [
     {
       "name": "Compile with XeLaTeX",
       "tools": ["xelatex", "xelatex"]
     }
   ],
   "latex-workshop.latex.outDir": "%DIR%/LaTeX-build",
   "latex-workshop.latex.rootFile.useSubFile": false,
   "latex-workshop.latex.rootFile.doNotPrompt": true
   ```
4. Open `HW.tex` (or any quiz `.tex`) and press `Ctrl + Alt + B` to build.

---

### 3. TeXworks (MiKTeX / TeX Live Default Editor)

1. Open `HW.tex` or your quiz file in **TeXworks**.
2. Select **XeLaTeX** in the engine dropdown (never `pdfLaTeX`).
3. Add `-shell-escape` under **Edit** $\rightarrow$ **Preferences** $\rightarrow$ **Typesetting** $\rightarrow$ **XeLaTeX** arguments.
4. Press `Ctrl + T` to compile.
