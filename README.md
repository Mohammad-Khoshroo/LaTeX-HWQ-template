# University Homework \LaTeX{} Template

A general-purpose, bilingual (Persian/English) academic homework and assignment template for university courses, designed for the **University of Tehran** and adaptable to any academic institution.

---

## Key Features

* **Course-Agnostic Architecture:** Easily adapt the template for any course (e.g., *Algorithms*, *Automata Theory*, *Operating Systems*, *Circuits*, *Machine Learning*) by updating simple metadata variables.
* **Official Academic Header:** Built-in `\makeheader` creates an official header with faculty and university logos, course title, semester, submission deadline, and instructor/TA details.
* **Full Bilingual Support (XePersian):** Native bidirectional typesetting with bundled high-quality Persian TrueType fonts (*XB Niloofar*, *XB Zar*, *IRLotus*, *XB Yas*) and clean `\LRE{...}` direction switching.
* **Modular Question Management (Subfiles):** Organize complex assignments into separate question files (`Q1.tex`, `Q2.tex`) seamlessly combined via `\subfile{...}`.
* **Solution Visibility Switch:** Toggle solutions on or off globally using the `compileanswers` boolean flag.
* **Code Highlighting with Minted:** Typeset elegant, syntax-highlighted code blocks for Python, C/C++, Verilog, Java, and other languages.

---

## Repository Structure

* **`homework.cls`** — The core document class:
  * Originally created by [jez](https://github.com/jez/latex-homework-class).
  * Enhanced by [Behzad Shayegh](https://github.com/BehzadShayegh), [Borna Tavasoli](https://github.com/borna-tl), and [Hesam Asadollahzadeh](https://github.com/HesamAsad) for Persian typography and custom environments.
  * Adapted for FLAT by [Mehdi Jamalkhah](https://github.com/MehdiJmlkh).
  * Further updated by [Mohammad Khoshroo](https://github.com/Mohammad-Khoshroo) for complete offline compatibility with modern TeX Live distributions.
* **`Background/`** — High-resolution logos (University of Tehran & Faculty of Engineering).
* **`Fonts/`** — Standard Persian TrueType fonts bundled directly in the workspace.
* **`HW.tex`** — Master document setting course variables and loading question subfiles.
* **`LaTeX-build/`** — Dedicated output directory for compilation artifacts (`.pdf`, `.log`, `.aux`).

---

## Quick Start: Configuring for Any Course

To adapt this template to your course, configure the metadata variables in your master `.tex` file:

```latex
\documentclass[12pt,largemargins]{homework}

% --- Course & Assignment Metadata ---
\newcommand{\eventclass}{طراحی و تحلیل الگوریتم‌ها} % Course Name
\newcommand{\eventsemester}{پاییز ۱۴۰۵}             % Semester
\newcommand{\eventtype}{تمرین شماره}               % Assignment Type (Homework, Quiz, Project)
\newcommand{\eventnum}{1}                          % Assignment Number
\newcommand{\eventcntrbs}{نام استاد / دستیار آموزشی} % Contributor or TA
\newcommand{\hwemail}{ta-email@ut.ac.ir}           % Contact Email

% --- Submission Deadline ---
\newcommand{\eventdatetype}{آخرین مهلت تحویل:}
\newcommand{\eventDeadlineDay}{۲۵}
\newcommand{\eventDeadlineMonth}{آبان}
\newcommand{\eventDeadlineYear}{۱۴۰۵}

% --- Toggle Solutions ---
\newboolean{compileanswers}
% \setboolean{compileanswers}{true} % Uncomment to compile with solutions

\begin{document}
\makeheader

\subfile{./Q1.tex}
\clearpage
\subfile{./Q2.tex}

\end{document}
```

### Document Class Options

| Option         | Description                                                                  |
| :------------- | :--------------------------------------------------------------------------- |
| `largemargins` | Widens page margins to provide ample space for grading remarks and comments. |
| `newpage`      | Automatically inserts a page break (`\newpage`) before every question.       |
| `anonymous`    | Suppresses author/contributor information for blind grading.                 |

---

## Question & Solution Commands

| Command / Environment                       | Description                                                                                |
| :------------------------------------------ | :----------------------------------------------------------------------------------------- |
| `\question`                                 | Generates a numbered question heading with a black dividing line.                          |
| `\question*{Title}`                         | Generates a custom-titled question heading with a black dividing line.                     |
| `\question#{Points}`                        | Generates a question heading with an allocated points badge (e.g., `سوال یک : (۱۰ نمره)`). |
| `\solution`                                 | Creates a solution header followed by a colon.                                             |
| `\solution*{Title}`                         | Creates a custom-titled solution header with a red dividing rule.                          |
| `\begin{alphaparts} ... \end{alphaparts}`   | Formats sub-questions labeled as `(الف)`, `(ب)` or `(a)`, `(b)`.                           |
| `\begin{arabicparts} ... \end{arabicparts}` | Formats sub-questions labeled as `1.1)`, `1.2)`.                                           |
| `\answerbox{height}`                        | Creates an empty framed box for student answers.                                           |

---

## 📁 Subfiles & Multi-File Architecture

This template utilizes the `subfiles` package so large assignments can be organized into modular question files inside `Q-A/` (e.g., `Q-A/Q1.tex`, `Q-A/Q2.tex`) and combined seamlessly into `HW.tex`.

### 🎯 Always Compiling the Master Document (`HW.tex`)

When editing an isolated subfile inside `Q-A/`, TeX editors (such as VS Code with LaTeX Workshop or TeXworks) may attempt to compile only that individual subfile rather than the master `HW.tex` document, which can cause missing-header or relative-path errors.

To ensure your editor **always compiles the master `HW.tex`** regardless of which question file is currently active:

1. **Magic Root Comment (Universal):**
   Every subfile in `Q-A/` starts with a standard TeX magic comment pointing to the parent root:
   ```latex
   %! TEX root = ../HW.tex
   ```
   All files in `Q-A/` in this repository are pre-configured with this line.

2. **VS Code LaTeX Workshop Configuration:**
   Add the following options to your `.vscode/settings.json` or User Settings:
   ```json
   "latex-workshop.latex.rootFile.useSubFile": false,
   "latex-workshop.latex.rootFile.doNotPrompt": true
   ```
   This tells LaTeX Workshop to ignore standalone subfile builds and always invoke the compiler on `HW.tex`. A bundled `.vscode/settings.json` is included in this repository.

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

Overleaf provides a full, pre-configured TeX Live cloud environment without requiring any local software installation on your PC:

1. Compress the project folder into a `.zip` archive (be sure to exclude any local `LaTeX-build/` folder).
2. On [Overleaf](https://www.overleaf.com), click **New Project** $\rightarrow$ **Upload Project** and select your `.zip` archive.
3. The repository includes an official `latexmkrc` file at the root:
   ```perl
   $pdf_mode = 5; # Force XeLaTeX
   $xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -shell-escape %O %S';
   ```
   This automatically instructs Overleaf's build workers to compile with **XeLaTeX** and `-shell-escape`. You can also double-check this in Overleaf's top-left **Menu** $\rightarrow$ **Compiler** $\rightarrow$ **XeLaTeX**.
4. In the Overleaf **Menu**, set **Main document** to `HW.tex` (or `README.tex`).
5. Click **Recompile**. All Persian fonts bundled in `Fonts/` are loaded seamlessly!

---

### 2. Visual Studio Code + LaTeX Workshop

For local development with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension:

1. Install the **LaTeX Workshop** extension from the VS Code Extensions panel (`Ctrl + Shift + X`).
2. Make sure Python and `pygments` are installed in your system terminal:
   ```powershell
   pip install pygments
   ```
3. Open your VS Code `settings.json` (`Ctrl + Shift + P` $\rightarrow$ `Preferences: Open User Settings (JSON)`) and configure a two-pass XeLaTeX recipe:
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
   > [!IMPORTANT]
   > Ensure that the recipe runs `xelatex` twice (`["xelatex", "xelatex"]`) so `minted` generates and embeds code snippets on the second pass.
4. Open `HW.tex` (or `README.tex`) and press `Ctrl + Alt + B` (or click the green Play icon in the editor title bar) to build. Click the magnifying glass icon or press `Ctrl + Alt + V` to view the PDF in the built-in tab.

---

### 3. TeXworks (MiKTeX / TeX Live Default Editor)

TeXworks is the standard lightweight editor bundled by default with both MiKTeX and TeX Live on Windows.

1. Open `HW.tex` or `README.tex` in **TeXworks**.
2. In the dropdown selector next to the green Play button, select **XeLaTeX** (never `pdfLaTeX`).
3. **Configure `-shell-escape` for Minted:**
   - Go to menu **Edit** $\rightarrow$ **Preferences** $\rightarrow$ **Typesetting**.
   - Under the **Processing tools** section, highlight **XeLaTeX** and click **Edit**.
   - Click the **`+`** button to add an argument: type `-shell-escape`.
   - Use the up arrow button to move `-shell-escape` above `$synctexoption`.
   - Click **OK** twice to save preferences.
4. Click the green **Play** button (or press `Ctrl + T`) to compile. Click it a second time if compiling for the first time to resolve all code blocks and references.

---

### 4. Working Without TeX Live (MiKTeX Notes)

If your computer does not have the large TeX Live suite installed:
* **MiKTeX Option:** Download and install [MiKTeX](https://miktex.org/download) (a lightweight Windows TeX distribution). During installation (or in the MiKTeX Console $\rightarrow$ Settings), ensure that **"Install missing packages on-the-fly"** is set to **Yes**. When you compile for the first time, MiKTeX will automatically download any missing packages (such as `xepersian`, `bidi`, `minted`, `subfiles`).
* **Zero-Install Option:** If you don't want to install anything locally (no MiKTeX, no Python), simply use **Overleaf** as described above. All needed engines and packages are already available in the cloud.
