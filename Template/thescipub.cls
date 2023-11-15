%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Science Publications
% LaTeX Template
% Version 1 (1/5/2018)
%
% Original author:
% Ali Asfour (ali.f.asfour@gmail.com)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thescipub}[1/5/2018, v1.0]
\RequirePackage{ifthen}
\RequirePackage{calc}
\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}
\RequirePackage{ifpdf}      % Needed to pick between latex and pdflatex

%----------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------

\RequirePackage{times}      % Loads the Times-Roman Fonts
\RequirePackage{mathptmx}   % Loads the Times-Roman Math Fonts

%----------------------------------------------------------------------
%	VARIOUS USEFUL PACKAGES
%----------------------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx,xcolor}
\RequirePackage{booktabs}

%----------------------------------------------------------------------
%	MARGINS	
%----------------------------------------------------------------------
	  	  
\RequirePackage[
left=2.01cm,%
right=2.01cm,%
top=2.94cm,%
bottom=3cm,%
headheight=17.8178pt,%
headsep=5pt,
paperwidth=20.98cm,%
paperheight=28.5cm]{geometry}%
				
%----------------------------------------------------------------------
%	FIGURES AND TABLES CAPTIONS
%----------------------------------------------------------------------

\RequirePackage[labelfont={bf,sf,small},%
labelsep=period,%
justification=raggedright]{caption}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}
\usepackage[figurename=Fig.]{caption}				
%----------------------------------------------------------------------
%	PAGE HEADER
%----------------------------------------------------------------------
\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\pagestyle{fancy}          % Enables the custom headers/footers
% Headers
\fancyhf{}
\lhead{
	\newheaderfont  Author Names/ \@JournalInfo 2018,  14 (3): Page Numbers \\
    [-0.1\normalbaselineskip]  \textbf{\newheaderfont DOI:} \\  [\normalbaselineskip] 
 }%
\chead{{\rule{\dimexpr\linewidth\relax}{0.4pt}}}%
\cfoot{\thepage}%
\fancypagestyle{plain}{%
   \fancyhf{}  
   \fancyfoot[R]{\newheaderfont\textcopyright\ 2018 Author Names. This open access article is distributed under a Creative Commons Attribution (CC-BY) 3.0 license.}
   \fancyfoot[L]{ \raisebox{-.9\height}{\includegraphics[height=0.79cm,width=3.23cm]{imgs/flogo.png}}}
   \renewcommand{\headrulewidth}{0pt}
}
\newcommand{\newheaderfont}{%
	\fontsize{7}{0}
	%\fontspec[WordSpace=0.2]{Times New Roman}
	\selectfont
	\spaceskip=1.5pt
}
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule
%----------------------------------------------------------------------
%	SECTION/SUBSECTION/PARAGRAPH SET-UP
%----------------------------------------------------------------------

\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\bfseries\fontsize{12}{15}\selectfont} 
  {}
  {0em}
  {{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{#1}}}
  []
\titleformat{name=\section,numberless}
  {\bfseries\fontsize{12}{15}\selectfont}
  {}
  {0em}
  {{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{#1}}}
  []  
\titleformat{\subsection}
  {\fontsize{11}{15}\itshape}
  {}
  {0em}
  {{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{#1}}}
  []
\titleformat{\subsubsection}
  {\fontsize{10}{15}\bfseries}
  { }
  {0em}
   {{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{#1}}}
  []    
  
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}
%----------------------------------------------------------------------
%	MULTIPLE AUTHOR SET
%----------------------------------------------------------------------  
  
\newcount\@authcnt
\newcount\@tmpcnt\@tmpcnt\z@

\def\@affiliation{%
  \ifnum\@tmpcnt<\@authcnt
   \global\advance\@tmpcnt1
    \raggedright \csname @auth\romannumeral\the\@tmpcnt\endcsname\hfill\\%
   \let\next\@affiliation \vskip1pt
  \else
   \let\next\relax
  \fi
\next}
	 
\newcommand{\affiliation}[1]{%
    \global\advance\@authcnt1
    \expandafter\gdef\csname @auth\romannumeral\the\@authcnt\endcsname
    {#1}}

%----------------------------------------------------------------------
%	LIST CONTROL
%----------------------------------------------------------------------  

\RequirePackage{enumitem}
%----------------------------------------------------------------------
%	ABSTRACT+AUTHOR 
%----------------------------------------------------------------------  

\newcommand{\PaperTitle}[1]{\def\@PaperTitle{#1}}
\newcommand{\Archive}[1]{\def\@Archive{#1}}
\newcommand{\Authors}[1]{\def\@Authors{#1}}
\newcommand{\JournalInfo}[1]{\def\@JournalInfo{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}

% ---------------------------------------------------------------------
\usepackage{array}% http://ctan.org/pkg/array
\renewcommand{\@maketitle}{%
\twocolumn[{%
\vskip-35pt%
\colorbox{color3}{%
\parbox[c][1.0cm][s]{16.65cm}{%
{\vskip2.5pt\raggedleft\itshape\bfseries\fontsize{12}{15}\selectfont\color{white}\@JournalInfo \space\space \par}%
}
}
\vskip4pt%
{\raggedright\fontsize{10}{25}\selectfont Original Research Paper\par}%
{\raggedright\bfseries\fontsize{18}{25}\selectfont \@PaperTitle\par}%
\vskip15pt%
\hspace{18pt}
{\raggedright\bfseries\fontsize{10}{16}\selectfont  \@Authors\par}%
\vskip11pt%
\hspace{15pt}
\colorbox{white}{%
\parbox[c][1.055cm][s]{16.74cm}{%
{\raggedright\fontsize{9}{0}\itshape\@affiliation\par}%
}
}
\vskip19pt%
 \hspace*{-7.5pt}
\begin{tabular}{p{4.0cm}|@{\hspace{0.5cm}}p{10.73cm}}
\begin{flushleft}
\vskip-13pt
\fontsize{9}{0}\itshape {Article history} \newline Received: \newline Revised: \newline Accepted: 

\end{flushleft}
\begin{flushleft}
\fontsize{9}{0} Corresponding Authors: \newline 
{ \{Corresponding Author\} } \newline Email: \{email\} \newline \newline 
\end{flushleft}

&%\vskip11pt
\textbf{\abstractname}: \@Abstract
\vskip15pt%
\textbf{\keywordname}: \@Keywords\\
\end{tabular}
\vskip11pt%
}]%
}