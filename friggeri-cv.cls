\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{heros}{
  \def\@cv@fontface{texgyreheros}
}
\DeclareOption{alegreya}{
    \def\@cv@fontface{AlegreyaSans}
}
\DeclareOption{merriweather}{
    \def\@cv@fontface{MerriweatherSans}
}
\DeclareOption{nunito}{
    \def\@cv@fontface{Nunito}
}
\DeclareOption{roboto}{
    \def\@cv@fontface{Roboto}
}

\DeclareOption{nocolors}{\def\@cv@nocolors{}}
\DeclareOption{print}{\def\@cv@print{}}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption,10pt}{article}%
}
\ExecuteOptions{alegreya}


\ProcessOptions\relax
\LoadClass{article}
\RequirePackage{longtable}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{404040}
\definecolor{lightgray}{HTML}{909090}
\definecolor{bggray}{HTML}{EAEAEA}

\definecolor{friggerigreen}{HTML}{C2E15F}
\definecolor{friggeriorange}{HTML}{FDA333}
\definecolor{friggeripurple}{HTML}{D3A4F9}
\definecolor{friggerired}{HTML}{FB4485}
\definecolor{friggeriblue}{HTML}{6CE0F1}
\definecolor{friggeriyellowgreen}{HTML}{13B4CD}
\definecolor{friggeribrickred}{HTML}{8913CD}
\definecolor{friggerisepia}{HTML}{CD8913}
\definecolor{friggeribrown}{HTML}{A52A2A}

\definecolor{viridis0}{HTML}{FFEA46}
\definecolor{viridis1}{HTML}{E7D159}
\definecolor{viridis2}{HTML}{BAAD70}
\definecolor{viridis3}{HTML}{908B79}
\definecolor{viridis4}{HTML}{6B6C71}
\definecolor{viridis5}{HTML}{434F6B}
\definecolor{viridis6}{HTML}{00326F}
\definecolor{viridis7}{HTML}{00204D}



\ifdefined\@cv@print
  \colorlet{friggerigreen}{gray}
  \colorlet{friggeriorange}{gray}
  \colorlet{friggeripurple}{gray}
  \colorlet{friggeribrown}{gray}
  \colorlet{friggerired}{gray}
  \colorlet{friggeriblue}{gray}
  \colorlet{friggeriyellowgreen}{gray}
  \colorlet{friggeribrickred}{gray}
  \colorlet{friggerisepia}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
  \colorlet{bgcolor}{white}
\else
  \colorlet{fillheader}{viridis7}
  \colorlet{header}{viridis0}
  \colorlet{bgcolor}{bggray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{viridis7}

%\def\colorPallete{{"friggeriblue","friggerired","friggeriorange","friggerigreen","friggeripurple","friggeribrown","friggeriyellowgreen","friggeribrickred"}}
\def\colorPallete{{"viridis1","viridis2","viridis3","viridis4","viridis5","viridis6"}}

\ifdefined\@cv@nocolors
  \colorlet{friggerigreen}{gray}
  \colorlet{friggeriorange}{gray}
  \colorlet{friggeripurple}{gray}
  \colorlet{friggeribrown}{gray}
  \colorlet{friggerired}{gray}
  \colorlet{friggeriblue}{gray}
  \colorlet{friggeriyellowgreen}{gray}
  \colorlet{friggeribrickred}{gray}
  \colorlet{friggerisepia}{gray}
\fi

%%%%%%%%%
% Fonts %g
%%%%%%%%%
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}
\RequirePackage{fontawesome}
\RequirePackage{calc}

% \RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
% 
% \newfontfamily\bodyfont[]{Helvetica Neue}
% \newfontfamily\thinfont[]{Helvetica Neue UltraLight}
% \newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
% 
% \defaultfontfeatures{Mapping=tex-text}
% \setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}
% 
% \setmathfont{XITS Math}

%%% modified by Karol Kozioł for ShareLaTex use
%\RequirePackage[quiet]{fontspec}
%\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont
[Path=fonts/\@cv@fontface/,
BoldFont=\@cv@fontface-Bold.ttf,
ItalicFont=\@cv@fontface-Italic.ttf,
BoldItalicFont=\@cv@fontface-BoldItalic.ttf]
{\@cv@fontface-Regular.ttf}
\newfontfamily\thinfont[Path=fonts/\@cv@fontface/]{\@cv@fontface-Light.ttf}
\newfontfamily\headingfont[Path=fonts/\@cv@fontface/]{\@cv@fontface-Bold.ttf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
Path=fonts/\@cv@fontface/,
BoldFont=\@cv@fontface-Bold.ttf,
ItalicFont=\@cv@fontface-Italic.ttf,
BoldItalicFont=\@cv@fontface-BoldItalic.ttf
]
{\@cv@fontface-Regular.ttf}

\setmathfont[Path=fonts/\@cv@fontface/]{\@cv@fontface-Regular.ttf}
%%%

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        %viridis1\or%
        viridis2\or%
        viridis3\or%
        viridis4\or%
        viridis5\or%
        viridis6\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%
% Translations %
%%%%%%%%%%%%%%%%
\newcommand{\sweeng}[2]{\ifthenelse{\equal{\swelanguage}{sv}}{#1}{#2}}
\newcommand{\secsweeng}[2]{\ifthenelse{\equal{\swelanguage}{sv}}{\section{#1}}{\section{#2}}}

#\newcommand{\testempty}[3]{\ifthenelse{\equal{#1}{}}{#2}{#3}}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%
\usepackage{multirow, makecell}
\newcommand{\tablewidth}{11.2cm}
\setlength{\tabcolsep}{4pt}
\newenvironment{entrylist}{%
  \begin{longtable}{@{\extracolsep{\fill}}rl}
}{%
  \end{longtable}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newcommand{\entry}[5]{%
  #1&\parbox[t]{\tablewidth}{%
    \textbf{#3}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #4}}\\%
    \multicolumn{1}{p{2cm}}{#2} & \parbox{\tablewidth}{#5}\vspace{2.5\parsep}%
  \\}
  
  
\newcommand{\jobentry}[6]{%
  \multirowcell{2}{{\centering \textbf{#1} }\\ {\centering #2}}&\parbox[t]{\tablewidth}{%
    \textbf{#3}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray}#4}}\\%
    &\parbox{\tablewidth}{\emph{#5}\\#6}\vspace{2.5\parsep}%
  \\}
  
\newcommand{\programmeentry}[6]{%
  \textbf{#1} &\parbox[t]{\tablewidth}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}}\\%
  \multicolumn{1}{r}{\footnotesize \sweeng{Uppsats}{Thesis}}&\parbox[t]{\tablewidth}{#5}\\%
  \multicolumn{1}{r}{\footnotesize \sweeng{Kurser}{Coursework}}&\parbox[t]{\tablewidth}{{\footnotesize#6}%
  \vspace{2.5\parsep}}\\}
  
  \newcommand{\courseentry}[5]{%
  \textbf{#1} &\parbox[t]{\tablewidth}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4}\\%
  \multicolumn{1}{r}{\footnotesize \sweeng{}{}}&\parbox[t]{\tablewidth}{{\footnotesize#5}%
  \vspace{2.5\parsep}}\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{4.3}(0.6, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[backend=biber, style=verbose, maxnames=99, sorting=ydnt, defernumbers=true]{biblatex}

\DeclareFieldFormat[article,%
                    thesis,%
                    book,%
                    inproceedings,%
                    misc,%
                    software,%
                    report]{title}{\small#1\par}

\DeclareBibliographyDriver{thesis}{%
  \printfield{title}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit*{\addcomma\space}%
    \usebibmacro{institution+location+date}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
  }
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{doi}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
  }
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{doi}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \newunit%
  }
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{doi}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{eprint}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{software}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{url}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \ifgiveninits
    {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiveni}
      {\namepartprefix}
      {\namepartsuffix}}
    {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiven}
      {\namepartprefix}
      {\namepartsuffix}}%
  \usebibmacro{name:andothers}}

\setlength{\bibitemsep}{0.5ex}

 \defbibheading{bibheading}[\bibname]{%
   \vspace{0.3\baselineskip}%
   \large\headingfont\color{headercolor}#1%
   \markboth{#1}{#1}
 }

 \newcommand{\printbibsection}[3][]{
  \begin{refsection}
     \nocite{*}
     \ifblank{#1}{%
         \printbibliography[sorting=chronological, type={#2}, title={#3}, heading=bibheading]%
     }{%
     \ifblank{#2}{%
         \printbibliography[sorting=chronological, #1, title={#3}, heading=bibheading]%
         }{%
         \printbibliography[sorting=chronological, #1, type={#2}, title={#3}, heading=bibheading]%
         }
     }
  \end{refsection}
 }
  

  
  
 \DeclareSortingScheme{chronological}{
   \sort[direction=descending]{\field{year}}
   \sort[direction=descending]{\field{month}}
 }



%%%%%%%%%%%%%%
% References %
%%%%%%%%%%%%%%

\newlength{\listdoubleitemmaincolumnwidth}
\setlength{\listdoubleitemmaincolumnwidth}{5.5cm}%

\newcommand{\cvref}[7]{%
    {\bf#1}\newline% Name
    {\addfontfeature{Color=lightgray}\itshape%
    \ifthenelse{\equal{#2}{}}{}{#2\newline}% Department
    \ifthenelse{\equal{#3}{}}{}{#3\newline}% Adresse
    \ifthenelse{\equal{#4}{}}{}{#4\newline}% PLZ
    \ifthenelse{\equal{#5}{}}{}{#5\newline}}% Land
  	\ifthenelse{\equal{#6}{}}{}{\href{mailto:#6}{#6}\newline} %email
	\ifthenelse{\equal{#7}{}}{}{#7}\\\vspace{.3\baselineskip}%Phone
}

\newcommand{\refrow}[2]{%
    \begin{minipage}[t]{\listdoubleitemmaincolumnwidth}{#1}\end{minipage}%
    \hspace{2cm}%
    \begin{minipage}[t]{\listdoubleitemmaincolumnwidth}{#2}\end{minipage}\\%
}

%%%%%%%%%%%%%%
% Points %
%%%%%%%%%%%%%%

\usetikzlibrary{shapes}
\newcommand\score[1]{
\pgfmathsetmacro\pgfxa{#1+1}
\tikzstyle{scorestars}=[star,star points=5, draw,inner sep=2.25pt,anchor=south]
  \begin{tikzpicture}[baseline]
    \foreach \i in {1,...,5} {
    \pgfmathparse{(\i<=#1?\colorPallete[5-#1]:"bgcolor")}
    \edef\starcolor{\pgfmathresult}
    \draw (\i*1.75ex,0) node[name=star\i,scorestars,fill=\starcolor]  {};
   }
  \end{tikzpicture}
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[a4paper, left=6.1cm,top=2cm,right=2cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}
