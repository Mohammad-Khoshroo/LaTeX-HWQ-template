\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesClass{quiz}[2026/11/14 Class file for quiz assignments]

% ----- Options ---------------------------------------------------------------
\newcommand\@opanon{0}
\DeclareOption{anonymous}{\renewcommand\@opanon{1}}
\newcommand\@opnewpage{0}
\DeclareOption{newpage}{\renewcommand\@opnewpage{1}}
\newcommand\@oplargemargins{0}
\DeclareOption{largemargins}{\renewcommand\@oplargemargins{1}}
\newcommand\@opnostudentinfo{0}
\DeclareOption{nostudentinfo}{\renewcommand\@opnostudentinfo{1}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% ----- Packages --------------------------------------------------------------
% Better fonts with accents
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage[a4paper, total={6in, 9.5in}]{geometry}
\RequirePackage{tikz}

% Required for starred commands
\RequirePackage{suffix}

% Math symbols
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{centernot}
\RequirePackage{slashed}

% Nice lists
\RequirePackage{enumerate}
\RequirePackage{enumitem}

% Nice images, figures, and listings
\RequirePackage{graphicx}
\RequirePackage{grffile}
\RequirePackage[all]{xy}
\RequirePackage{wrapfig}
\RequirePackage{fancyvrb}
\RequirePackage{listings}
\RequirePackage{float}
\RequirePackage{booktabs}
\RequirePackage[english]{babel}
\RequirePackage{placeins}
\RequirePackage{subfiles}
\RequirePackage{framed}

% Conditionals
\RequirePackage{ifthen}

% Header & Page Setup
\RequirePackage{fancyhdr}
\ifthenelse{\equal{\@oplargemargins}{1}}{}{\RequirePackage{fullpage}}

% Links
\RequirePackage{hyperref}

% XePersian
\RequirePackage[extrafootnotefeatures]{xepersian}

% Auto-detect Fonts directory (supports root up to 5 nested subfolders)
\IfFileExists{./Fonts/IRZar.ttf}{%
  \newcommand{\quizFontPath}{./Fonts/}%
}{%
  \IfFileExists{../Fonts/IRZar.ttf}{%
    \newcommand{\quizFontPath}{../Fonts/}%
  }{%
    \IfFileExists{../../Fonts/IRZar.ttf}{%
      \newcommand{\quizFontPath}{../../Fonts/}%
    }{%
      \IfFileExists{../../../Fonts/IRZar.ttf}{%
        \newcommand{\quizFontPath}{../../../Fonts/}%
      }{%
        \IfFileExists{./fonts/IRZar.ttf}{%
          \newcommand{\quizFontPath}{./fonts/}%
        }{%
          \IfFileExists{../fonts/IRZar.ttf}{%
            \newcommand{\quizFontPath}{../fonts/}%
          }{%
            \newcommand{\quizFontPath}{../Fonts/}%
          }%
        }%
      }%
    }%
  }%
}

\settextfont[Path={\quizFontPath}, BoldFont={IRLotusICEE_Bold.ttf}, BoldItalicFont={IRLotusICEE_BoldIranic.ttf}, ItalicFont={IRLotusICEE_Iranic.ttf}]{IRZar.ttf}
\setdigitfont[Path={\quizFontPath}, BoldFont={IRLotusICEE_Bold.ttf}, BoldItalicFont={IRLotusICEE_BoldIranic.ttf}, ItalicFont={IRLotusICEE_Iranic.ttf}]{IRZar.ttf}

\newcommand{\RN}[1]{%
  \textup{\uppercase\expandafter{\romannumeral#1}}%
}

% ----- Questions -------------------------------------------------------------
\newcounter{questionCounter}
\newcounter{partCounter}[questionCounter]

% Prefix for questions
\newcommand{\questiontype}[0]{سؤال}

% Use this if your "written" questions are all under one section
% For example, if the homework handout has Section 5: Written Questions
% and all questions are 5.1, 5.2, 5.3, etc. set this to 5
% Use for 0 no prefix. Redefine as needed per-question.
\newcommand{\writtensection}[0]{0}

% Numbered question
\providecommand{\question}{}
\renewcommand{\question}[0]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage
  }{}

  \color{blue}
  % Wrap in minipage so that we don't get a line break anywhere in between
  \begin{minipage}{\linewidth}%
    \stepcounter{questionCounter}%
    \vspace{.2in}%
    \ifx\writtensection\undefined{}
      \noindent{\bf \questiontype\ \arabic{questionCounter}.}%
    \else
      \if\writtensection0
        \noindent{\bf \questiontype\ \arabic{questionCounter}.}%
      \else
        \noindent{\bf \questiontype\ \writtensection.\arabic{questionCounter}}%
      \fi
    \fi
    \vspace{0.3em} \hrule \vspace{.1in}%
  \end{minipage}
  \color{black}
  \nopagebreak
}

% Named question, takes one argument
\WithSuffix\providecommand\question*{}
\WithSuffix\renewcommand\question*[1]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage%
  }{}%
  % Wrap in minipage so that we don't get a line break anywhere in between
  
  \color{blue}
  \begin{minipage}{\linewidth}%
    \addtocounter{questionCounter}{1}%
    \setcounter{partCounter}{0}%
    \vspace{.2in}%
    \noindent{\bf \arabic{questionCounter}. #1}%
    \vspace{0.3em} \hrule \vspace{.1in}%
  \end{minipage}
  \color{black}
  \nopagebreak
}

% Override normal section definitions
\renewcommand{\section}[0]{\question}
\WithSuffix\newcommand\section*[1]{\question*{#1}}

% ----- Solution -------------------------------------------------------------
% Prefix for solutions
\newcommand{\solutiontype}[0]{پاسخ}

% Numbered solution
\providecommand{\solution}{}
\renewcommand{\solution}[0]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage
  }{}

  \color{red}
  % Wrap in minipage so that we don't get a line break anywhere in between
  \begin{minipage}{\linewidth}%
    \vspace{.2in}%
    \ifx\writtensection\undefined{}
      \noindent{\bf \solutiontype\ : \vspace{.1in}}%
    \else
      \if\writtensection0
        \noindent{\bf \solutiontype\ : \vspace{.1in}}%
      \else
        \noindent{\bf \solutiontype\ \writtensection : \vspace{.1in}}%
      \fi
    \fi
  \end{minipage}
  \color{black}
  \nopagebreak
}

% Named solution, takes one argument
\WithSuffix\providecommand\solution*{}
\WithSuffix\renewcommand\solution*[1]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage%
  }{}%
  % Wrap in minipage so that we don't get a line break anywhere in between
  
  \color{red}
  \begin{minipage}{\linewidth}%
    \setcounter{partCounter}{0}%
    \vspace{.2in}%
    \noindent{\bf . #1}%
    \vspace{0.3em} \hrule \vspace{.1in}%
  \end{minipage}
  \color{black}
  \nopagebreak
}

% ----- Question Parts --------------------------------------------------------

\newenvironment{alphaparts}[0]{%
  \begin{enumerate}[label=\textbf{(\alph*)}]%
}{\end{enumerate}}

\newenvironment{arabicparts}[0]{%
  \begin{enumerate}[label=\textbf{\arabic{questionCounter}.\arabic*})]%
}{\end{enumerate}}

\newcommand{\questionpart}[0]{\item}

% ----- Answer Box ------------------------------------------------------------

\newcommand{\answerbox}[1]{%
\begin{framed}
\vspace{#1}
\end{framed}}

% ----- Answer ExternalLink ---------------------------------------------------

\newcommand{\ExternalLink}{%
    \tikz[x=1.2ex, y=1.2ex, baseline=-0.05ex]{% 
        \begin{scope}[x=1ex, y=1ex]
            \clip (-0.1,-0.1) 
                --++ (-0, 1.2) 
                --++ (0.6, 0) 
                --++ (0, -0.6) 
                --++ (0.6, 0) 
                --++ (0, -1);
            \path[draw, 
                line width = 0.5, 
                rounded corners=0.5] 
                (0,0) rectangle (1,1);
        \end{scope}
        \path[draw, line width = 0.5] (0.5, 0.5) 
            -- (1, 1);
        \path[draw, line width = 0.5] (0.6, 1) 
            -- (1, 1) -- (1, 0.6);
    }%
}

% ----- Page Setup ------------------------------------------------------------

% Use block style paragraphs
\setlength{\parskip}{5pt plus 1pt}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

% ----- Title & Header --------------------------------------------------------
\pagestyle{empty}
\pagestyle{fancy}

\ifthenelse{\equal{\@opanon}{0}}{%
  \newcommand{\makeheader}[0]{%
    % Setup header
    \setlength{\headheight}{15.2pt}
    \setlength{\headsep}{0.2in}
    \lhead{\ifdefined\eventclass\eventclass\fi}%
    \rhead{\ifdefined\eventtype\eventtype\else کوییز شماره\fi{} \ifdefined\eventnum\eventnum\fi%
      \ifdefined\eventname\ifx\eventname\@empty\else{} - \eventname{}\fi\fi%
    }%

    % Setup hrule in header
    \renewcommand{\headrulewidth}{0pt}
    \headrule{}

    % Don't put header on first page
    \thispagestyle{plain}

    \begin{center}
      \ifdefined\eventclass{\Huge \eventclass}\par\vspace{3mm}\fi
      
      {\LARGE \ifdefined\eventtype\eventtype\else کوییز شماره\fi{} \ifdefined\eventnum\eventnum\fi%
        \ifdefined\eventname\ifx\eventname\@empty\else{} - \eventname{}\fi\fi%
      }\par\vspace{3mm}

      \ifdefined\eventcntrbs\ifx\eventcntrbs\@empty\else{\large \eventcntrbs}\par\vspace{2mm}\fi\fi

      {\large \ifdefined\eventdatetype\eventdatetype\else تاریخ برگزاری:\fi{} \ifdefined\eventdate\eventdate\fi}
    \end{center}

    \ifthenelse{\equal{\@opnostudentinfo}{0}}{%
      \vspace{4mm}
      \noindent
      \begin{minipage}{\linewidth}
        \raggedleft
        \normalsize
        \textbf{\ifdefined\quiztimelabel\quiztimelabel\else زمان پاسخگویی:\fi}%
        \space
        \ifdefined\quiztime\quiztime\else\ifdefined\eventtime\eventtime\fi\fi\par\vspace{2.5mm}%
        \textbf{\ifdefined\studentnamelabel\studentnamelabel\else نام و نام خانوادگی:\fi}\par\vspace{2.5mm}%
        \textbf{\ifdefined\studentidlabel\studentidlabel\else شماره دانشجویی:\fi}\par
      \end{minipage}%
      \par\vspace{3mm}%
    }{%
      \vspace{0.2in}%
    }%
    \renewcommand{\headrulewidth}{0.4pt}
  }
}{%
  \newcommand{\makeheader}[0]{%
    % Make all pages plain
    \pagestyle{plain}

    % Put header on its own page
    \begin{center}
      {\Large \ifdefined\eventclass\eventclass\fi{} \ifdefined\eventtype\eventtype\else کوییز شماره\fi{} \ifdefined\eventnum\eventnum\fi%
        \ifdefined\eventname\ifx\eventname\@empty\else{} - \eventname{}\fi\fi%
      }\par\vspace{3mm}

      \ifdefined\eventcntrbs\ifx\eventcntrbs\@empty\else\eventcntrbs\par\vspace{2mm}\fi\fi

      {\ifdefined\eventdatetype\eventdatetype\else تاریخ برگزاری:\fi{} \ifdefined\eventdate\eventdate\fi}
    \end{center}
    \renewcommand{\headrulewidth}{0.4pt}
    \newpage
  }
}

\AtBeginDocument{%
  \renewcommand{\maketitle}[0]{\makeheader}%
}

% ----- For usage with pandoc converted documents -----------------------------

\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% -----------------------------------------------------------------------------
