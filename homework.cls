\NeedsTeXFormat{LaTeX2e}
\LoadClassWithOptions{article}
\ProvidesClass{homework}[2014/12/16 Class file for homework assignments]

% ----- Options ---------------------------------------------------------------
\newcommand\@opanon{0}
\DeclareOption{anonymous}{\renewcommand\@opanon{1}}
\newcommand\@opnewpage{0}
\DeclareOption{newpage}{\renewcommand\@opnewpage{1}}
\newcommand\@oplargemargins{0}
\DeclareOption{largemargins}{\renewcommand\@oplargemargins{1}}

% Header type selection (1 = classic centered, 2 = modern wide, 3 = upcoming)
\def\@hwHeaderType{1}
\DeclareOption{header-type=1}{\def\@hwHeaderType{1}}
\DeclareOption{header-type=2}{\def\@hwHeaderType{2}}
\DeclareOption{header-type=3}{\def\@hwHeaderType{3}}
\DeclareOption{headertype=1}{\def\@hwHeaderType{1}}
\DeclareOption{headertype=2}{\def\@hwHeaderType{2}}
\DeclareOption{headertype=3}{\def\@hwHeaderType{3}}
\DeclareOption{header-type-1}{\def\@hwHeaderType{1}}
\DeclareOption{header-type-2}{\def\@hwHeaderType{2}}
\DeclareOption{header-type-3}{\def\@hwHeaderType{3}}
\newcommand{\setheadertype}[1]{\def\@hwHeaderType{#1}}

\ProcessOptions

% ----- Packages --------------------------------------------------------------
% Better fonts with accents
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage[a4paper, total={6in, 9.5in}]{geometry}
\RequirePackage{tikz}
\RequirePackage{geometry}
% Required for starred commands
\RequirePackage{suffix}

% Math symbols
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{centernot}
\usepackage{slashed}
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
\RequirePackage{trimclip}
\RequirePackage{tikz}
\usetikzlibrary{angles,quotes,intersections}
\RequirePackage{pgfplots}
% \RequirePackage[utf8]{inputenc}
\RequirePackage{minted}
%you can change the code theme by selecting a style
\RequirePackage{colortbl}

% Conditionals
\RequirePackage{ifthen}

% Header & Page Setup
\RequirePackage{fancyhdr}
\ifthenelse{\equal{\@oplargemargins}{1}}{}{\RequirePackage{fullpage}}

% Links
\RequirePackage{hyperref}

\hypersetup{
  colorlinks=true,
  linkcolor={cyan},
  linkbordercolor={white},
  urlcolor={cyan},
}

\newcommand{\RN}[1]{%
  \textup{\uppercase\expandafter{\romannumeral#1}}%
}

% For figure names
\RequirePackage[figurename=شکل]{caption}

\newcommand\picdims[4][]{%
  \setbox0=\hbox{\includegraphics[#1]{#4}}%
  \clipbox{.5\dimexpr\wd0-#2\relax{} %
    .5\dimexpr\ht0-#3\relax{} %
    .5\dimexpr\wd0-#2\relax{} %
    .5\dimexpr\ht0-#3\relax}{\includegraphics[#1]{#4}}}
\geometry{letterpaper, portrait, margin=0.8in}
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

\renewcommand{\Large}{\fontsize{14pt}{16pt}\selectfont\rmfamily}
\renewcommand{\LARGE}{\fontsize{18pt}{20pt}\selectfont\rmfamily}

\setlength{\parindent}{0pt}

\newcommand{\numtopersian}[1]{%
  \ifcase#1 %
    صفر%
  \or یک%
  \or دو%
  \or سه%
  \or چهار%
  \or پنج%
  \or شش%
  \or هفت%
  \or هشت%
  \or نه%
  \else عدد خارج از محدوده%
  \fi
}

\WithSuffix\providecommand\question#{}{}
\WithSuffix\renewcommand\question#[1]{%
% Emit \newpage if option `newpage` is present
\ifthenelse{\equal{\@opnewpage}{1}}{%
  \newpage%
}{}%
% Wrap in minipage so that we don't get a line break anywhere in between

\begin{minipage}{\linewidth}%
  \addtocounter{questionCounter}{1}%
  \setcounter{partCounter}{0}%
  \vspace{.2in}%
  \noindent{\underline{\Large \bf سوال  \numtopersian{\value{questionCounter}}}}%
  {\noindent{\Large \bf : (#1 نمره)}}%
  \noindent
  % \vspace{0.3em} \hrule \vspace{.1in}%
\end{minipage}%
\nopagebreak
}
\RequirePackage{ragged2e}
\RequirePackage[extrafootnotefeatures]{xepersian}
% Auto-detect Fonts directory (supports root up to 4-5 nested subfolders)
\IfFileExists{./Fonts/XB Niloofar.ttf}{%
  \newcommand{\hwFontPath}{./Fonts/}%
}{%
  \IfFileExists{../Fonts/XB Niloofar.ttf}{%
    \newcommand{\hwFontPath}{../Fonts/}%
  }{%
    \IfFileExists{../../Fonts/XB Niloofar.ttf}{%
      \newcommand{\hwFontPath}{../../Fonts/}%
    }{%
      \IfFileExists{../../../Fonts/XB Niloofar.ttf}{%
        \newcommand{\hwFontPath}{../../../Fonts/}%
      }{%
        \newcommand{\hwFontPath}{../../../../Fonts/}%
      }%
    }%
  }%
}
% Auto-detect Background directory (supports root up to 4-5 nested subfolders)
\IfFileExists{./Background/eng_logo.png}{%
  \newcommand{\hwBgPath}{./Background/}%
}{%
  \IfFileExists{../Background/eng_logo.png}{%
    \newcommand{\hwBgPath}{../Background/}%
  }{%
    \IfFileExists{../../Background/eng_logo.png}{%
      \newcommand{\hwBgPath}{../../Background/}%
    }{%
      \IfFileExists{../../../Background/eng_logo.png}{%
        \newcommand{\hwBgPath}{../../../Background/}%
      }{%
        \newcommand{\hwBgPath}{../../../../Background/}%
      }%
    }%
  }%
}

\settextfont[Path={\hwFontPath}, BoldFont={XB NiloofarBd.ttf}, BoldItalicFont={XB NiloofarBdIt.ttf}, ItalicFont={XB NiloofarIt.ttf}]{XB Niloofar.ttf}
\setdigitfont[Path={\hwFontPath}, BoldFont={XB NiloofarBd.ttf}, BoldItalicFont={XB NiloofarBdIt.ttf}, ItalicFont={XB NiloofarIt.ttf}]{XB Niloofar.ttf}

% Override normal section defintions
\renewcommand{\section}[0]{\question}
\WithSuffix\newcommand\section*[1]{\question*{#1}}

% ----- Solution -------------------------------------------------------------
% Prefix for solutions
\newcommand{\solutiontype}[0]{پاسخ}

% Use this if your "written" solutions are all under one section
% For example, if the homework handout has Section 5: Written Solutions
% and all solutions are 5.1, 5.2, 5.3, etc. set this to 5
% Use for 0 no prefix. Redefine as needed per-solution.

% Numbered solution
\providecommand{\solution}{}
\renewcommand{\solution}[0]{%
  % Emit \newpage if option `newpage` is present
  \ifthenelse{\equal{\@opnewpage}{1}}{%
    \newpage
  }{}

  % \color{red}
  \color{blue}
  % Wrap in minipage so that we don't get a line break anywhere in between
  \begin{minipage}{\linewidth}%
    \vspace{.2in}%
    \ifx\writtensection\undefined{}
    \noindent{\bf \solutiontype\ :}%
    \else
    \if\writtensection0
      \noindent{\bf \solutiontype\ :}%
    \else
      \noindent{\bf \solutiontype\ \writtensection :}%
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
  % Wrap in minipage so that we don't get a line break enywhere in between

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

% Override normal section defintions
\renewcommand{\section}[0]{\solution}
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

% ----- Answer ExternalLink ------------------------------------------------------------

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
  }
}

% ----- Page Setup ------------------------------------------------------------

% Use block style paragraphs
% \setlength{\parindent}{0pt}
\setlength{\parskip}{5pt plus 1pt}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

% ----- Title & Header --------------------------------------------------------
\pagestyle{empty}
\pagestyle{fancy}

\newcommand{\makeheader}[0]{%
  \ifthenelse{\equal{\@opanon}{1}}{%
    % Anonymous Header
    \thispagestyle{plain}%
    \begin{center}%
      {\LARGE \ifdefined\eventclass\eventclass\fi\ifdefined\eventnum{} - \ifdefined\eventtype\eventtype\else تمرین شماره\fi{} \eventnum\fi}\par\vspace{2mm}%
      {\normalsize \ifdefined\eventdatetype\eventdatetype\else آخرین مهلت تحویل:\fi{} \ifdefined\eventdate\eventdate\else\ifdefined\eventDeadlineDay\eventDeadlineDay{} \eventDeadlineMonth{} \eventDeadlineYear{}\fi\fi}%
    \end{center}%
    \vspace{0.2in}%
    \renewcommand{\headrulewidth}{0.4pt}%
  }{%
    % Setup header
    \setlength{\headheight}{15.2pt}%
    \setlength{\headsep}{0.2in}%
    \lhead{\ifdefined\eventclass\eventclass\fi}%
    \rhead{\ifdefined\eventtype\eventtype\else تمرین شماره\fi{} \ifdefined\eventnum\eventnum\fi}%

    % Setup hrule in header
    \renewcommand{\headrulewidth}{0pt}%
    \headrule{}%

    % Don't put header on first page
    \thispagestyle{plain}%

    \ifdefined\headertype
      \let\@hwActiveHeaderType\headertype
    \else
      \let\@hwActiveHeaderType\@hwHeaderType
    \fi

    \ifthenelse{\equal{\@hwActiveHeaderType}{2}}{%
      % ============================================================
      % HEADER TYPE 2: Modern side-by-side header with margin extension
      % ============================================================
      \noindent
      \makebox[\linewidth][c]{%
        \begin{minipage}{\dimexpr\linewidth + 2.6cm\relax}%
          \noindent
          \begin{minipage}[c]{0.23\linewidth}
            \raggedright
            \raisebox{3.2mm}{%
              \includegraphics[height=2.0cm,keepaspectratio]{\hwBgPath utlogo}%
              \hspace{2.5mm}%
              \includegraphics[height=2.0cm,keepaspectratio]{\hwBgPath eng_logo}%
            }%
          \end{minipage}%
          \hfill
          \begin{minipage}[c]{0.75\linewidth}
            \noindent
            {\textbf{\LARGE \ifdefined\eventclass\eventclass\fi}}%
            \hfill
            {\textbf{\LARGE \ifdefined\eventtype\eventtype\else تمرین شماره\fi{} \ifdefined\eventnum\eventnum\fi}}

            \par\vspace{0.6mm}%
            \rule{\linewidth}{0.9pt}%
            \par\vspace{2.5mm}%

            \noindent
            \begin{minipage}[t]{0.58\linewidth}
              \raggedleft
              \normalsize
              \ifdefined\eventinstructor
                \ifx\eventinstructor\@empty
                \else
                  \textbf{\ifdefined\eventinstructortype\eventinstructortype\else مدرس\fi:} \eventinstructor{}%
                \fi
              \fi
              \par\vspace{1.8mm}%
              \ifdefined\eventdatetype\eventdatetype\else آخرین مهلت تحویل:\fi%
              \space
              \ifdefined\eventdate
                \eventdate{}%
              \else
                \ifdefined\eventDeadlineDay\eventDeadlineDay{}\space\fi
                \ifdefined\eventDeadlineMonth\eventDeadlineMonth{}\space\fi
                \ifdefined\eventDeadlineYear\eventDeadlineYear{}\fi
                \ifdefined\eventDeadlineHour
                  \ifx\eventDeadlineHour\@empty
                  \else
                    ، ساعت \hbox{\setlatin\eventDeadlineHour{}}%
                  \fi
                \fi
              \fi
            \end{minipage}%
            \hfill
            \begin{minipage}[t]{0.40\linewidth}
              \raggedright
              \normalsize
              \textbf{\ifdefined\eventcntrbstype\eventcntrbstype\else طراحان\fi:}%
              \space
              \ifdefined\hwemail
                \ifx\hwemail\@empty
                  {\textcolor{magenta!85!black}{\ifdefined\eventcntrbs\eventcntrbs\fi}}%
                \else
                  \href{mailto:\hwemail}{\textcolor{magenta!85!black}{\ifdefined\eventcntrbs\eventcntrbs\fi}}%
                \fi
              \else
                {\textcolor{magenta!85!black}{\ifdefined\eventcntrbs\eventcntrbs\fi}}%
              \fi
            \end{minipage}%
          \end{minipage}%
        \end{minipage}%
      }%
      \par\vspace{0.35in}%
    }{%
    \ifthenelse{\equal{\@hwActiveHeaderType}{3}}{%
      % ============================================================
      % HEADER TYPE 3: (Reserved for upcoming model)
      % ============================================================
      % Fallback to Type 1
      \noindent
      \begin{minipage}{0.2\linewidth}%
        \picdims[width=\linewidth]{\linewidth}{5cm}{\hwBgPath eng_logo}
      \end{minipage}%
      \begin{minipage}{0.59\linewidth}%
        \centering

        {به نام خدا}

        \vspace{2mm}

        {\LARGE \ifdefined\eventclass\eventclass\fi\ifdefined\eventsemester\ifx\eventsemester\@empty\else{} - \eventsemester\fi\fi}

        \vspace{4mm}

        {\ifdefined\eventtype\eventtype\else تمرین شماره\fi{} \ifdefined\eventnum\eventnum\fi}
        \vspace{2mm}

        \ifdefined\eventcntrbs
          \ifx\eventcntrbs\@empty\else
            {دستیار آموزشی این مجموعه:\space%
            \ifdefined\hwemail
              \ifx\hwemail\@empty
                \eventcntrbs{}%
              \else
                \href{mailto:\hwemail}{\eventcntrbs{}}%
              \fi
            \else
              \eventcntrbs{}%
            \fi
            }
            \vspace{2mm}
          \fi
        \fi

        \ifdefined\eventdatetype\eventdatetype\else آخرین مهلت تحویل:\fi\space
        \ifdefined\eventdate
          \eventdate{}%
        \else
          \ifdefined\eventDeadlineDay\eventDeadlineDay{}\space\fi
          \ifdefined\eventDeadlineMonth\eventDeadlineMonth{}\space\fi
          \ifdefined\eventDeadlineYear\eventDeadlineYear{}\fi
          \ifdefined\eventDeadlineHour
            \ifx\eventDeadlineHour\@empty\else
              ، ساعت \hbox{\setlatin\eventDeadlineHour{}}%
            \fi
          \fi
        \fi
        \ifdefined\eventcourselink\space(\href{\eventcourselink}{صفحه درس})\fi
      \end{minipage}%
      \begin{minipage}{0.2\linewidth}%
        \picdims[width=0.85\linewidth]{\linewidth}{5cm}{\hwBgPath utlogo}
      \end{minipage}
      \vspace{0.3em} \hrule \vspace{.1in}%
    }{%
      % ============================================================
      % HEADER TYPE 1: Classic centered header (Default)
      % ============================================================
      \noindent
      \begin{minipage}{0.2\linewidth}%
        \picdims[width=\linewidth]{\linewidth}{5cm}{\hwBgPath eng_logo}
      \end{minipage}%
      \begin{minipage}{0.59\linewidth}%
        \centering

        {به نام خدا}

        \vspace{2mm}

        {\LARGE \ifdefined\eventclass\eventclass\fi\ifdefined\eventsemester\ifx\eventsemester\@empty\else{} - \eventsemester\fi\fi}

        \vspace{4mm}

        {\ifdefined\eventtype\eventtype\else تمرین شماره\fi{} \ifdefined\eventnum\eventnum\fi}
        \vspace{2mm}

        \ifdefined\eventcntrbs
          \ifx\eventcntrbs\@empty\else
            {دستیار آموزشی این مجموعه:\space%
            \ifdefined\hwemail
              \ifx\hwemail\@empty
                \eventcntrbs{}%
              \else
                \href{mailto:\hwemail}{\eventcntrbs{}}%
              \fi
            \else
              \eventcntrbs{}%
            \fi
            }
            \vspace{2mm}
          \fi
        \fi

        \ifdefined\eventdatetype\eventdatetype\else آخرین مهلت تحویل:\fi\space
        \ifdefined\eventdate
          \eventdate{}%
        \else
          \ifdefined\eventDeadlineDay\eventDeadlineDay{}\space\fi
          \ifdefined\eventDeadlineMonth\eventDeadlineMonth{}\space\fi
          \ifdefined\eventDeadlineYear\eventDeadlineYear{}\fi
          \ifdefined\eventDeadlineHour
            \ifx\eventDeadlineHour\@empty\else
              ، ساعت \hbox{\setlatin\eventDeadlineHour{}}%
            \fi
          \fi
        \fi
        \ifdefined\eventcourselink\space(\href{\eventcourselink}{صفحه درس})\fi
      \end{minipage}%
      \begin{minipage}{0.2\linewidth}%
        \picdims[width=0.85\linewidth]{\linewidth}{5cm}{\hwBgPath utlogo}
      \end{minipage}
      \vspace{0.3em} \hrule \vspace{.1in}%
    }}%

    \renewcommand{\headrulewidth}{0.4pt}%
  }%
}

\renewcommand{\figurename}{شکل}

\AtBeginDocument{%
  \renewcommand{\maketitle}[0]{\makeheader}%
}

% ----- For usage with pandoc converted documents -----------------------------

\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% -----------------------------------------------------------------------------
