\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fcuniphysicslab}[2017/09/28 v1.0 Physics lab report class]
\DeclareOption{english}{\PassOptionsToPackage{\CurrentOption}{babel}}
% English is also needed in English thesis for the abstract
\DeclareOption{spanish}{\PassOptionsToPackage{main=\CurrentOption,english}{babel}}
\ProcessOptions\relax

%% ---------------------------------------------------------------
%% | Based on KOMAscript by Markus Kohm http://www.komascript.de |
%% ---------------------------------------------------------------

\LoadClass[12pt,twoside,headsepline,a4paper,titlepage=true,DIV=15,BCOR=20mm]{scrbook}

%% -----------------------
%% | Headers and footers |
%% -----------------------
\RequirePackage[automark]{scrpage2}

\clubpenalty=10000 %prevent orphans
\widowpenalty=10000 %prvent widows

%% --------------
%% | Typography |
%% --------------

% T1 font encoding
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc} % ¡No uses utf8x en este caso!

% serif type: Linux Libertine
\RequirePackage{libertine}
% Linux Libertine in math mode
\RequirePackage[libertine]{newtxmath}

% grotesque type: Adobe Source Sans Pro
\RequirePackage[scaled=.92]{sourcesanspro}

% monospace type: Bera Mono
\RequirePackage[scaled=.78]{beramono}

% semi-bold type (for subsections and paragraphs)
\newcommand*{\sbdefault}{sb}
\DeclareRobustCommand{\sbseries}{%
  \not@math@alphabet\sbseries\relax
  \fontseries\sbdefault\selectfont}

\DeclareTextFontCommand{\textsb}{\sbseries}

\addtokomafont{subsection}{\sbseries}
\addtokomafont{subsubsection}{\sbseries}
\addtokomafont{paragraph}{\sbseries}

% all in Helvetica
% \RequirePackage{helvet}
% \RequirePackage[scaled=.92]{beramono}
% \renewcommand{\familydefault}{\sfdefault}
% \RequirePackage[italic]{mathastext}
% \RequirePackage{isomath}

% microtype for nicer typography
\RequirePackage[protrusion=true,expansion=true]{microtype}

% commands for code and model keywords in text
\newcommand{\code}[1]{\texttt{\hyphenchar\font45\relax #1}}
\newcommand{\model}[1]{\textsf{#1}}

% nicer spacing for enumerations
\RequirePackage{enumerate}
\RequirePackage[shortlabels]{enumitem}

%% --------------
%% | Title page |
%% --------------

% Logos
\newcommand{\thegrouplogo}{fciencias}
\newcommand{\grouplogo}[1]{\renewcommand{\thegrouplogo}{#1}}
\newcommand{\printgrouplogo}{\includegraphics[height=3.1cm]{logos/\thegrouplogo}}%1.8 en el inicio ambos
\newcommand{\nogrouplogo}{\renewcommand{\printgrouplogo}{}}

\titlehead{%
% KIT logo german/spanish
\iflanguage{english}
{\includegraphics[height=3.8cm]{logos/kitlogo_de_cmyk}}
{%\includegraphics[height=3.8cm]{}
}%logos/6
\hfill
% SDQ logo
\printgrouplogo
\ThisCenterWallPaper{1}{title-background.pdf}
}
		
%
\setkomafont{title}{\huge\sffamily\bfseries}
\setkomafont{subtitle}{\normalfont\large}

\uppertitleback{Universidad Nacional de Ingeniería\\ Facultad de Ciencias\\ Av. Túpac Amaru Nº 210 - Rímac\\ Lima, Perú}

%% variables for title page
\newcommand{\theinstitute}{\iflanguage{spanish}
    {Universidad Nacional de Ingeniería (UNI)}
    {Institut für Programmstrukturen und Datenorganisation (IPD)}}
\newcommand{\thethesistype}{}
\newcommand{\thereviewerone}{}
\newcommand{\thereviewertwo}{}
\newcommand{\theadvisorone}{}
\newcommand{\theadvisortwo}{}
\newcommand{\theeditstart}{}
\newcommand{\theeditend}{}

%% formatting commands for titlepage
\newcommand{\thesistype}[1]{\subtitle{\vskip2em #1 \iflanguage{spanish}{del grupo conformado por}{von}}%
\renewcommand{\thethesistype}{#1}}
\newcommand{\myinstitute}[1]{\renewcommand{\theinstitute}{#1}}
\newcommand{\reviewerone}[1]{\renewcommand{\thereviewerone}{#1}}
\newcommand{\reviewertwo}[1]{\renewcommand{\thereviewertwo}{#1}}
\newcommand{\advisorone}[1]{\renewcommand{\theadvisorone}{#1}}
\newcommand{\advisortwo}[1]{\renewcommand{\theadvisortwo}{#1}}

\newcommand{\editingtime}[2]{%
\renewcommand{\theeditstart}{#1}%
\renewcommand{\theeditend}{#2}%
%% do not show the date
\date{}
}

\newcommand{\settitle}{%
\publishers{%
\large
\begin{tabular}{l l}
	\iflanguage{spanish}{Profesor de teoría}{Erstgutachter}: & \thereviewerone\\
	\iflanguage{spanish}{Profesor de laboratorio}{Zweitgutachter}: & \thereviewertwo\\
	%\iflanguage{spanish}{Tutor}{Betreuender Mitarbeiter}: &  \theadvisorone\\
	% if there is no second advisor, do not output this line
	\ifthenelse{\equal{\theadvisortwo}{}}{}{%
		\iflanguage{spanish}{Segundo tutor}{Zweiter betreuender Mitarbeiter}: & \theadvisortwo\\
	}
\end{tabular}\\
\iflanguage{spanish}{de la Facultad de Ciencias}%
{an der Fakultät für Informatik}\\
\theinstitute\\[2em]

\vskip2em
\theeditstart{} -- \theeditend
}
}

%% -----------------------------
%% | Abstract/Acknowledgements |
%% -----------------------------

\newcommand{\abstract}[1][\abstractname]{\chapter*{#1}}
\newcommand{\Abstract}[1][\abstractname]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1}} 

\def\ackname{Acknowledgments}
\def\abstractname{Abstract}
\def\switcht@english{\svlanginfo
	\def\ackname{Danksagung}
	\def\abstractname{Kurzfassung}
}
\def\switcht@spanish{\svlanginfo
	\def\ackname{Acknowledgements}
	\def\abstractname{Abstract}
}

%% In English theses, an additional German Abstract is needed.
\newcommand{\includeabstract}{
\iflanguage{spanish}{
% include English and German abstracts
\input{sections/abstract_es.tex}
%\begin{otherlanguage}{ngerman}
%\input{sections/abstract_de.tex}
%\end{otherlanguage}
}{
% include only German abstract
%\include{sections/abstract_de}
}
}

%% ------------
%% | Packages |
%% ------------

% draft mode
\RequirePackage{ifdraft}
\RequirePackage{ifthen}

% enumerate subsubsections
\setcounter{secnumdepth}{3}

% wallpaper for title page (KIT-Frame)
\RequirePackage{wallpaper}

% subimport of files
\RequirePackage{import}

% languages
\RequirePackage{babel}

% hyphenation for compound words
\RequirePackage[shortcuts]{extdash}

% nice tables
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{rotating}
\RequirePackage{geometry}

% show graphics in draft mode
\RequirePackage{graphicx}
\setkeys{Gin}{draft=false}
\RequirePackage{float}

% % Mathematics package
\RequirePackage{amsmath}
\let\openbox\relax
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{siunitx}
\RequirePackage{marvosym}
\RequirePackage{pifont}
\RequirePackage{tkz-fct}
\RequirePackage{tikz}
% appendix
\RequirePackage[toc,title,header]{appendix}
\noappendicestocpagenum

% todo-notes
\RequirePackage[obeyDraft]{todonotes}
\presetkeys{todonotes}{inline}{}

% PDF specific packages
\RequirePackage[hyphens]{url}
\RequirePackage[breaklinks,colorlinks=false,ocgcolorlinks]{hyperref}		
\newcommand\setpdf{\hypersetup{%
    pdftitle={\thethesistype},%
    pdfsubject={\@title},%
    pdfauthor={Oromion},%
    pdfborder={0 0 0},%
   	linkcolor=black,%
    citecolor=kit-green100,%
    urlcolor=black,
    linkbordercolor=black,
	}%
    \let\theauthor\@author
}

%% naming of sections with autoref
\addto\extrasspanish{
\renewcommand{\sectionautorefname}{Section}
\renewcommand{\subsectionautorefname}{Subsection}
\renewcommand{\subsubsectionautorefname}{Subsection}
\renewcommand{\paragraphautorefname}{Paragraph}
}