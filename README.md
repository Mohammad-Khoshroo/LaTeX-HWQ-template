# Formal Languages and Automata Theory — Homework Template

This repository provides a \LaTeX{} homework template tailored for the **Formal Languages and Automata Theory (FLAT)** course at the **University of Tehran**.

---

## Repository Structure

* **`Background/`** — Contains University of Tehran logos and header graphics.
* **`Fonts/`** — Houses Persian fonts (e.g., *IRLotus*, *XB Niloofar*, *XB Zar*, *XB Yas*) used across the assignments.
* **`homework.cls`** — The core \LaTeX{} document class:
  * Originally written by [jez](https://github.com/jez/latex-homework-class).
  * Extended by [Behzad Shayegh](https://github.com/BehzadShayegh), [Borna Tavasoli](https://github.com/borna-tl), and [Hesam Asadollahzadeh](https://github.com/HesamAsad) to support Persian typesetting and custom commands.
  * Adapted for the FLAT course by [Mehdi Jamalkhah](https://github.com/MehdiJmlkh).
  * Further enhanced by [Mohammad Khoshroo](https://github.com/Mohammad-Khoshroo) to provide full compatibility with TeX Live.
* **`HW.tex`** (or topic root files) — Main entry point aggregating question subfiles (`Q0.tex`, `Q1-2.tex`, etc.).
* **`LaTeX-build/`** — Target output directory for compilation artifacts (`.pdf`, `.aux`, `.log`).

---

## Usage & Compilation

### Text Direction & Bilingual Typesetting
* By default, text direction is set to **Right-to-Left (RTL)** for Persian.
* For English text, URLs, or mathematical expressions that require Left-to-Right orientation, enclose them within `\LRE{...}`:

```latex
\LRE{this is a sample text in English.}
```

### Homework Commands

| Command | Description |
| :--- | :--- |
| `\question` | Creates a question header with a black horizontal rule underneath. |
| `\question*{text}` | Creates a question header with custom title `text` and a black horizontal rule. |
| `\question#{text}{points}` | Creates a question header with custom title `text` and dedicated badge/points. |
| `\solution` | Produces a solution header followed by a colon. |
| `\solution*{text}` | Produces a solution header with custom title `text` and a red horizontal rule. |

### Code Highlighting with Minted

You can include syntax-highlighted source code using the `minted` package. Remember to wrap code inside `\LRE{...}` when writing within a Persian context:

```latex
\begin{LRE}
\begin{minted}{python}
import numpy as np

def incmatrix(genl1, genl2):
    m = len(genl1)
    n = len(genl2)
    M = None
    VT = np.zeros((n * m, 1), int)

    M1 = bitxormatrix(genl1)
    M2 = np.triu(bitxormatrix(genl2), 1)

    for i in range(m - 1):
        for j in range(i + 1, m):
            [r, c] = np.where(M2 == M1[i, j])
            for k in range(len(r)):
                VT[i * n + r[k]] = 1
                VT[i * n + c[k]] = 1
                VT[j * n + r[k]] = 1
                VT[j * n + c[k]] = 1

                if M is None:
                    M = np.copy(VT)
                else:
                    M = np.concatenate((M, VT), 1)

                VT = np.zeros((n * m, 1), int)

    return M
\end{minted}
\end{LRE}
```

---

## Compilation Requirements

To compile documents using this template:
* **Engine:** `xelatex` (required for `xepersian` and TrueType font loading)
* **Flag:** `-shell-escape` (required by `minted` for Pygments syntax highlighting)
* **Python:** Python 3 with `pygments` installed (`pip install pygments`)
