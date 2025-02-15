%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                            %%
%% Class ''CU PhD Thesis''                                                    %%
%%                                                                            %%
%% For the PhD thesis LaTeX template for Coventry University                  %%
%%                                                                            %%
%% Version: v1.0.4                                                            %%
%% By: Daniel S. Fowler                                                       %%
%% GitHub: https://github.com/GR8DAN/coventry-thesis                          %%
%% From: PhDThesisPSnPDF v2.3.1                                               %% 
%% Authors: Krishna Kumar                                                     %%
%% License: MIT License (c) 2016 Krishna Kumar                                %%
%% GitHub: https://github.com/kks32/phd-thesis-template/                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ************************** Class Identification ******************************
\newcommand\fileversion{1.0.3}
\newcommand\filedate{2020/01/03}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Classes/CUPhDThesis}[\filedate\space The CU PhD thesis template class file
 by Daniel S. Fowler based on work by Krishna Kumar (v\fileversion)]
\typeout{https://github.com/GR8DAN/coventry-thesis}

% ******************************************************************************
% **************************** Class Definition ********************************
% ******************************************************************************

% *********************** Define a Print/Online Version ************************
\newif\if@print\@printfalse
\DeclareOption{print}{\@printtrue}

% ****************************** Define index **********************************
\newif\ifPHD@index\PHD@indexfalse
\DeclareOption{index}{\PHD@indextrue}

% ******************************* Font Option **********************************
\newif\ifsetFont\setFontfalse                 % Font is not set

\newif\ifPHD@times\PHD@timesfalse             % Times with Math Support
\DeclareOption{times}{
  \ifsetFont
    \ClassWarning{CUPhDThesis}{Font selection conflict: A font package was
      already specified. Please check the document class options in case you 
      have defined two fonts.}
  \else
    \PHD@timestrue
    \setFonttrue
  \fi
}

\newif\ifPHD@fourier\PHD@fourierfalse         % Fourier with Math Support
\DeclareOption{fourier}{
  \ifsetFont
    \ClassWarning{CUPhDThesis}{Font selection conflict: A font package was
      already specified. Please check the document class options in case you 
      have defined two fonts.}
  \else
    \PHD@fouriertrue
    \setFonttrue
  \fi
}

\newif\ifsetCustomFont\setCustomFontfalse     % Custom Font with Math Support
\DeclareOption{customfont}{
  \ifsetFont
    \ClassWarning{CUPhDThesis}{Font selection conflict: A font package was
      already specified. Please check the document class options in case you 
      have defined two fonts.}
  \else
    \setCustomFonttrue
    \setFonttrue
  \fi
}

% ************************* Header / Footer Styling ****************************
\newif\ifPHD@textJustify\PHD@textJustifytrue % Set Justification true
\DeclareOption{flushleft}{\PHD@textJustifyfalse}


% ************************* Header / Footer Styling ****************************
\newif\ifPHD@pageStyleI\PHD@pageStyleIfalse % Set Page StyleI
\DeclareOption{PageStyleI}{\PHD@pageStyleItrue}

\newif\ifPHD@pageStyleII\PHD@pageStyleIIfalse % Set Page StyleII
\DeclareOption{PageStyleII}{\PHD@pageStyleIItrue}

% ***************************** Custom Margins  ********************************
\newif\ifsetCustomMargin\setCustomMarginfalse % Set Custom Margin
\newif\ifsetMargin\setMarginfalse % Set Custom Margin
\DeclareOption{custommargin}{\setCustomMargintrue}

% **************************** Separate Abstract  ******************************
\newif \ifdefineAbstract\defineAbstractfalse %To enable Separate abstract

\newif\ifPHD@abstract\PHD@abstractfalse % Enable Separate Abstract
\DeclareOption{abstract}{
  \PHD@abstracttrue
  \ClassWarning{CUPhDThesis}{You have chosen an option that generates only
    the Title page and an abstract with PhD title and author name, if this was
    intentional, ignore this warning. Congratulations on submitting your thesis!
    If not, please remove the option 'abstract' from the document class and
    recompile. Good luck with your writing!}
  \PassOptionsToClass{oneside}{book}
}

% ****************** Chapter Mode - To print only selected chapters ************
\newif \ifdefineChapter\defineChapterfalse %To enable Separate abstract

\newif\ifPHD@chapter\PHD@chapterfalse % Enable Separate Abstract
\DeclareOption{chapter}{
  \PHD@chaptertrue
  \ClassWarning{CUPhDThesis}{You have chosen an option that generates only 
    selected chapters with references, if this was intentional, ignore this
    warning. If not, please remove the option 'chapter' from the document class
    and recompile. Good luck with your writing!}
}

% ******************* Final or first submission ********************************
\newif\ifdefinefinalsub\definefinalsubfalse
\newif\if@finalsub\@finalsubfalse 
\DeclareOption{finalsub}{\@finalsubtrue \definefinalsubtrue
    \ClassWarning{CUPhDThesis}{Final submission declared}
}

% *************************** Pre-defined Options ******************************
% Font Size
\DeclareOption{10pt}{
  \ClassWarning{CUPhDThesis}{The Coventry University PhD thesis guidelines
recommend using a minimum font size of 10pt.}
  \PassOptionsToClass{10pt}{book}%
}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}%
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}%

% Page Size, Coventry University Academic Regulations for Higher Degrees requires A4 paper
\newcommand\PHD@papersize{a4paper} % Set Default as a4paper

\DeclareOption{a4paper}{\renewcommand\PHD@papersize{a4paper}}
\DeclareOption{a5paper}{
  \ClassWarning{CUPhDThesis}{Coventry University Academic Regulations for Higher Degrees requires use of A4 paper}
  \renewcommand\PHD@papersize{a5paper}}
\DeclareOption{letterpaper}{
  \ClassWarning{CUPhDThesis}{Coventry University Academic Regulations for Higher Degrees requires use of A4 paper}
  \renewcommand\PHD@papersize{letterpaper}
}

\PassOptionsToClass{\PHD@papersize}{book}%

% Column layout
\newif\if@oneside\@onesidefalse
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}\@onesidetrue}%
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{book}}%

% ****************************** Draft Option **********************************
\newif\ifsetDraft\setDraftfalse
\newif\ifsetDraftClassic\setDraftClassicfalse
% Draft Mode
\DeclareOption{draftclassic}{\PassOptionsToClass{draft}{book}
  \setDraftClassictrue
  \ClassWarning{CUPhDThesis}{Draft is ON. Don't forget to turn it
    off in your final version. This is the classic version of draft.
    Use 'draft' for enhanced mode, which adds watermark with timestamp, 
    line numbering, and version number.}}%

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}
  \setDrafttrue 
  \ClassWarning{CUPhDThesis}{Draft is ON. Don't forget to turn it
    off in your final version. This enhanced 'draft' mode adds watermark 
    with timestamp, line numbering, and version number. Use 'draftclassic'
    if you prefer the \cite{} lassic draft mode. To tweak options see
    'preamble.tex'}}%


% Line Numbers
\newif\ifPHD@lineno\PHD@linenotrue
\DeclareOption{lineno}{\PHD@linenotrue}
\DeclareOption{nolineno}{\PHD@linenofalse}


% Generates Warning for unknown options
\DeclareOption*{
  \ClassWarning{CUPhDThesis}{Unknown or non-standard option
'\CurrentOption'. I'll see if I can load it from the book class. If you get a
warning unused global option(s): '\CurrentOption' then the option is not
supported!}
  \PassOptionsToClass{\CurrentOption}{book}
}

% Process options and load class
\ProcessOptions\relax%
\LoadClass{book}%

% ******************************************************************************
% ******************************** Packages ************************************
% ******************************************************************************
% ************************** Layout and Formatting *****************************

\RequirePackage{lscape}   % Supports Landscape Layout
\RequirePackage{setspace} % Define line spacing in paragraph
\RequirePackage{calc}     % calculate vertical spacing

% ************************* Conditional Statements *****************************
\RequirePackage{ifthen}   % Conditional statements
\RequirePackage{ifpdf}    % Check for pdfLaTeX
\RequirePackage{ifxetex}  % XeLaTeX

% *********************** Table of Contents & Appendices ***********************
% add Bibliography, List of figures and tables to contents
\RequirePackage[nottoc]{tocbibind}
% Add appendices
\RequirePackage[title,titletoc]{appendix}

\renewcommand{\contentsname}{Table of contents}
\renewcommand{\listfigurename}{List of figures}
\renewcommand{\listtablename}{List of tables}

% Hides Contents appearing from TOC, but adds it to bookmarks
\let\temptableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
  \cleardoublepage
  \pdfbookmark[0]{\contentsname}{Contents}
  \temptableofcontents
}

% *************************** Graphics and Figures *****************************
\RequirePackage[usenames, dvipsnames]{xcolor}
\ifpdf
  % Convert eps figures to pdf
  \RequirePackage{epstopdf}
  \RequirePackage[pdftex]{graphicx}
  \DeclareGraphicsExtensions{.png, .jpg, .pdf}
  \pdfcompresslevel=9
  \graphicspath{{Figs/Raster/}{Figs/}}
\else
  \RequirePackage{graphicx}
  \DeclareGraphicsExtensions{.eps, .ps}
  \graphicspath{{Figs/Vector/}{Figs/}}
\fi



% ******************************* Time Stamp ***********************************
% Compute the timestamp based on an idea of
% Tim Piessens \texttt{<Tim.Piessens@esat.kuleuven.ac.be>}.

\RequirePackage{datetime}

\newcount\PHD@hour \newcount\PHD@minute
\PHD@hour=\time
\divide \PHD@hour by 60
\PHD@minute=\time
\count@=\PHD@hour
\multiply \count@ by -60
\advance \PHD@minute by \count@
\newcommand{\PHD@daytime}{%
  \today\space--\space%
  \ifnum\PHD@hour=0 00\else\ifnum\PHD@hour<10 0\fi%
  \number\PHD@hour\fi:\ifnum\PHD@minute<10 0\fi\number\PHD@minute
}

% ******************************* Draft Mode ***********************************
% Initializing Draft Text
\newcommand\SetDraftText[1]{}
% Initializing Draft Version
\newcommand\SetDraftVersion[1]{}
% Initializing Draft Content
\newcommand\SetDraftWMPosition[1]{}
% Initializing Draft Gray Scale
\newcommand\SetDraftGrayScale[1]{}

% Classic Draft Mode
\ifsetDraftClassic
% Disable figures in 'draft'\
\setkeys{Gin}{draft=true}
\fi

% If Draft Mode is active
\ifsetDraft
% Disable figures in 'draft'\
\setkeys{Gin}{draft=false}

% Line numbering (can be switched off)
\ifPHD@lineno
\RequirePackage[switch,pagewise,mathlines]{lineno}
\renewcommand{\frontmatter}{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
  \nolinenumbers
}
\renewcommand{\mainmatter}{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \linenumbers
}
\renewcommand{\backmatter}{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse
  \linenumbers
}

% Fix display lineno issue in mathmode
\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
  \renewenvironment{#1}%
     {\linenomath\csname old#1\endcsname}%
     {\csname oldend#1\endcsname\endlinenomath}%
}% 

\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
  \patchAmsMathEnvironmentForLineno{#1}%
  \patchAmsMathEnvironmentForLineno{#1*}%
}%

\AtBeginDocument{%
  \patchBothAmsMathEnvironmentsForLineno{equation}%
  \patchBothAmsMathEnvironmentsForLineno{align}%
  \patchBothAmsMathEnvironmentsForLineno{flalign}%
  \patchBothAmsMathEnvironmentsForLineno{alignat}%
  \patchBothAmsMathEnvironmentsForLineno{gather}%
  \patchBothAmsMathEnvironmentsForLineno{multline}%
}

\fi % End \ifPDH@lineno

% Creates a Watermark Draft at the specified location.
% The settings can be tweaked in the preamble

% Draft text
\newcommand\drafttext{Draft}
\renewcommand\SetDraftText[1]{%
  \renewcommand\drafttext{#1}
}

% Draft Version
\newcommand\draftVersion{v1.0}
\renewcommand\SetDraftVersion[1]{%
  \renewcommand\draftVersion{#1}
}

% Draft Gray Scale
\newcommand\draftGrayScale{0.75}
\renewcommand\SetDraftGrayScale[1]{%
  \renewcommand\draftGrayScale{#1}
}

% Draft Content
\newcommand\DraftContent{%
  \hspace*{\fill}
  \Large
  \textcolor[gray]{\draftGrayScale}{%
    {\drafttext}\space-\space{\draftVersion}\hspace{\stretch{1}}{\PHD@daytime}
    \hspace*{\fill}
  }
}

% Adding watermark in draft mode with time stamp
\RequirePackage{everypage}
\RequirePackage[absolute]{textpos}
% Default values for draft watermark
\newcommand\draftposition{top}
\newcommand\draftnodeanchor{1in+\voffset-\topmargin}
\AddEverypageHook{%
  \begin{textblock*}{\paperwidth}[0.,2.5](0\paperwidth,\draftnodeanchor)
    \DraftContent
  \end{textblock*}
}

% Conditional evaluation to position the draft water mark  (top / bottom)
\renewcommand\SetDraftWMPosition[1]{%
  \renewcommand\draftposition{#1}
  \ifthenelse{\equal{\draftposition}{bottom}}
    {\renewcommand\draftnodeanchor{\paperheight-\voffset}} %Bottom
    {\ifthenelse{\equal{\draftposition}{top}}
      {\renewcommand\draftnodeanchor{1in+\voffset-\topmargin}} %Top
      {\ClassWarning{PDThesisPSnPDF}{Unrecognised draft position
          using default value of top}
        \renewcommand\draftnodeanchor{1in+\voffset-\topmargin}}} %Top
    
    \AddEverypageHook{%
    \begin{textblock*}{\paperwidth}[0.,2.5](0\paperwidth,\draftnodeanchor)
      \DraftContent
    \end{textblock*}
  }
}

% If NOT Draft
\else 

\renewcommand\SetDraftText[1]{\ClassWarning{CUPhDThesis}{Draft is
    inactive, to use SetDraftText include 'draft' in the document 
    class options.}}
% Draft Version
\renewcommand\SetDraftVersion[1]{\ClassWarning{CUPhDThesis}{Draft is
    inactive, to use SetDraftVersion include 'draft' in the document
    class options.}}
% Draft Content
\renewcommand\SetDraftWMPosition[1]{\ClassWarning{CUPhDThesis}{Draft
    is inactive, to use SetDraftWMPosition include 'draft' in the document
    class options.}}

\renewcommand\SetDraftGrayScale[1]{\ClassWarning{CUPhDThesis}{Draft is
    inactive, to use SetDraftWMPosition include 'draft' in the document
    class options.}}
\fi

% ********************************** Fonts **********************************
% Text companion fonts
\RequirePackage{textcomp}
% Use line below for stix mathematical glyphs but comment out amssyb later
%\RequirePackage[notextcomp]{stix}

% Font Selection
\ifPHD@times
  \ifxetex
  \else
    \RequirePackage{mathptmx}  % times roman, including math (where possible)
  \fi
  \setFonttrue
  \message{CUPhDThesis: Using Times Roman font}
\else
  \ifPHD@fourier
    \RequirePackage{fourier} % Fourier
    \setFonttrue
    \message{CUPhDThesis: Using Fourier font}
  \else
    \ifsetCustomFont
      \setFonttrue
      \message{CUPhDThesis: Using custom font}
    \else
      \setFontfalse
      \message{CUPhDThesis: No font is set}
    \fi % custom font
  \fi % Fourier font
\fi % Times font

% If Font is not set throw a warning.
\ifsetFont
\else
  \ClassWarning{CUPhDThesis}{Using the default font. (The Coventry 
	University PhD thesis guidelines recommends any clear and readable
	font is acceptable, i.e. Arial or Times New Roman)}
  \RequirePackage{tgbonum}
\fi


\ifxetex
  % XeLaTeX
  \usepackage{amsmath}
  \expandafter\let\csname not=\endcsname\relax
  \expandafter\let\csname not<\endcsname\relax
  \expandafter\let\csname not>\endcsname\relax
  \usepackage{fontspec}
  \usepackage[]{unicode-math}

  \setmainfont[
    Extension = .otf,
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    BoldItalicFont = *-BoldItalic,
  ]{XITS}
  
  \setmathfont[ 
    Extension = .otf,
    BoldFont = XITSMath-Bold,
  ]{XITSMath-Regular}
  
\else
  % default: pdfLaTeX
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[italian]{babel}
  \RequirePackage[T1]{fontenc}
  
  % If building with PDFLaTeX, use microtype spacing adjustments
  \RequirePackage[final]{microtype}
  
  \input{glyphtounicode}
  \pdfglyphtounicode{f_f}{FB00}
  \pdfglyphtounicode{f_i}{FB01}
  \pdfglyphtounicode{f_l}{FB02}
  \pdfglyphtounicode{f_f_i}{FB03}
  \pdfglyphtounicode{f_f_l}{FB04}
  \pdfgentounicode=1

  \RequirePackage{amsfonts}
  \RequirePackage{amsmath}
  % Comment out below line if using stix package
  \RequirePackage{amssymb}
\fi

%Uncomment below if you want \hbar (reduced Planke constant) not resemble \hslash
%(only in math mode)
%\renewcommand\hbar{\mathit{^^^^0127}}

% Don't break enumeration (etc.) across pages in an ugly manner
\clubpenalty=10000
\widowpenalty=10000

%******************************* Print / Online ********************************
% Defines a print / online version to define page-layout and hyperrefering

% Moved below other usepackage definitions to fix PDFLaTeX footnote warning
% Based on the suggestion by John Plaice

\RequirePackage[unicode=true]{hyperref}

\if@print
  % For Print version
  \hypersetup{
    final=true,
    plainpages=false,
    pdfstartview=FitV,
    pdftoolbar=true,
    pdfmenubar=true,
    bookmarksopen=true,
    bookmarksnumbered=true,
    breaklinks=true,
    linktocpage,
    colorlinks=true,
    linkcolor=black,
    urlcolor=black,
    citecolor=black,
    anchorcolor=black
  }
  \ifsetCustomMargin
  % Margin to be define in preamble using geometry package
  \else
    \RequirePackage[paper=\PHD@papersize,hmarginratio=1:1,
      vmarginratio=1:1,scale=0.75,bindingoffset=5mm]{geometry}
  \fi

  \if@twoside
    \hypersetup{pdfpagelayout=TwoPageRight}
  \else
    \hypersetup{pdfpagelayout=OneColumn}
  \fi

\else
  % For PDF Online version
  \hypersetup{
    final=true,
    plainpages=false,
    pdfstartview=FitV,
    pdftoolbar=true,
    pdfmenubar=true,
    bookmarksopen=true,
    bookmarksnumbered=true,
    breaklinks=true,
    linktocpage,
    colorlinks=true,
    linkcolor=blue,
    urlcolor=blue,
    citecolor=blue,
    anchorcolor=green
  }

  \ifsetCustomMargin
    % Margin to be define in preamble using geometry package
    \else
      % No Margin staggering on Odd and Even side
      \RequirePackage[paper=\PHD@papersize,hmarginratio=1:1,
        vmarginratio=1:1,scale=0.75]{geometry} % dvips
    \fi
    \hypersetup{pdfpagelayout=OneColumn}
\fi

% ************************ URL Package and Definition **************************
\RequirePackage{url}
% Redefining urlstyle to use smaller fontsize in References with URLs
\newcommand{\url@leostyle}{%
 \@ifundefined{selectfont}{\renewcommand{\UrlFont}{\sffamily}}
 {\renewcommand{\UrlFont}{\normalsize}}}
\urlstyle{leo}

% option to split urls over multiple lines for latex >> DVIPS >> PDF option
\ifpdf
  % PDFLaTeX does it automatically.
\else
  \ifxetex
    %breakurl doesn't work with XeLaTeX
  \else
    % dvips
    \RequirePackage{breakurl} % to split the url over multiple lines
  \fi
\fi
  
% ******************************************************************************
% **************************** Pre-defined Settings ****************************
% ******************************************************************************

% *************************** Setting PDF Meta-Data ****************************
\ifpdf
\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author},
    pdfsubject={\@subject},
    pdfkeywords={\@keywords}
  }
}
\fi

% ******************************** Line Spacing ********************************
% Set spacing as 1.5 line spacing for the PhD Thesis
% In practice, fortunately, nobody knows really what “one-and-a-half spaced
% type” means exactly (in terms of millimetres baseline distance). The following
% LaTeX setting has routinely been considered perfectly acceptable:

\renewcommand\baselinestretch{1.2}

% ******************************** Justification *******************************
% Left aligned as per University identity guidelines
\ifPHD@textJustify
\message{CUPhDThesis: The University identity guidelines recommend using 
left aligned text. Please use 'flushleft' in the documentclass option, if you
wish to left align your text}
\else
\AtBeginDocument{
\raggedright
}
\fi


% ************************** TOC and Hide Sections *****************************
\newcommand{\nocontentsline}[3]{}
\newcommand{\tochide}[2]{
	\bgroup\let
	\addcontentsline=\nocontentsline#1{#2}
	\egroup}
% Removes pagenumber appearing from TOC
\addtocontents{toc}{\protect\thispagestyle{empty}}


% ***************************** Header Formatting ******************************
% Custom Header with Chapter Number, Page Number and Section Numbering

\RequirePackage{fancyhdr} % Define custom header

% Style 1: Sets Page Number at the Top and Chapter/Section Name on LE/RO
\fancypagestyle{PageStyleI}{
  \renewcommand{\chaptermark}[1]{\markboth{##1}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1\ }}
  \fancyhf{}
  \fancyhead[RO]{\nouppercase \rightmark\hspace{0.25em} | 
    \hspace{0.25em} \bfseries{\thepage}}
  \fancyhead[LE]{ {\bfseries\thepage} \hspace{0.25em} | 
    \hspace{0.25em} \nouppercase \leftmark}
}

% Style 2: Sets Page Number at the Bottom with Chapter/Section Name on LO/RE
\fancypagestyle{PageStyleII}{
  \renewcommand{\chaptermark}[1]{\markboth{##1}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
  \fancyhf{}
  \fancyhead[RO]{\bfseries\nouppercase \rightmark}
  \fancyhead[LE]{\bfseries \nouppercase \leftmark}
  \fancyfoot[C]{\thepage}
}

% Set Fancy Header Command is defined to Load FancyHdr after Geometry is defined
\newcommand{\setFancyHdr}{

\pagestyle{fancy}

\ifPHD@pageStyleI
  % Style 1: Sets Page Number at the Top and Chapter/Section Name on LE/RO
  \pagestyle{PageStyleI}

\else
  \ifPHD@pageStyleII

  % Style 2: Sets Page Number at the Bottom with Chapter/Section Name on LO/RE
  \pagestyle{PageStyleII}

  \else
  % Default Style: Sets Page Number at the Top (LE/RO) with Chapter/Section Name
  % on LO/RE and an empty footer
    \renewcommand{\chaptermark}[1]{\markboth {##1}{}}
    \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
    \fancyhf{}
    \fancyhead[LO]{\nouppercase \rightmark}
    \fancyhead[LE,RO]{\bfseries\thepage}
    \fancyhead[RE]{\nouppercase \leftmark}
  \fi
\fi
}

\setlength{\headheight}{14.5pt}
%\renewcommand{\headrulewidth}{0.5pt}
%\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

% If Margin has been set (default margin print/online version)
\ifsetCustomMargin
\AtBeginDocument{
\@ifpackageloaded{geometry}{}{\ClassWarning{CUPhDThesis}{%
  Custom margin is chosen, but geometry package is not loaded. Please load the
  'geometry' package in the preamble.}}}
\else
\setFancyHdr % Apply fancy header settings otherwise apply it in preamble
\fi

% **************** Clear Header Style on the Last Empty Odd pages **************
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else%
	\hbox{}%
	\thispagestyle{empty}  % Empty header styles
	\newpage%
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% ******************************************************************************
% **************************** Macro Definitions *******************************
% ******************************************************************************
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% Subtitle (optional)
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}

% The year and term the degree will be officially conferred
\newcommand{\@degreedate}{\monthname[\the\month]\space\the\year}
\newcommand{\degreedate}[1]{\renewcommand{\@degreedate}{#1}}

% The full (unabbreviated) name of the degree
\newcommand{\@degreetitle}{}
\newcommand{\degreetitle}[1]{\renewcommand{\@degreetitle}{#1}}

% The name of your department(eg. Engineering, Maths, Physics)
\newcommand{\@dept}{}
\newcommand{\dept}[1]{\renewcommand{\@dept}{#1}}

% The name of your college (eg. King's)
\newcommand{\@college}{}
\newcommand{\college}[1]{\renewcommand{\@college}{#1}}

% The name of your University
\newcommand{\@university}{}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}

% Defining the crest (logo)
\newcommand{\@crest}{}
\newcommand{\crest}[1]{\renewcommand{\@crest}{#1}}

% Supervisor
\newif\ifPHD@supervisor\PHD@supervisorfalse
\newcommand{\@supervisor}{}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}\PHD@supervisortrue}

% Supervisor Title (Supervisor - Default, can be changed)
\newcommand{\@supervisorrole}{Supervisor: }
\newcommand{\supervisorrole}[1]{\renewcommand{\@supervisorrole}{#1}}

% Supervisor width to align
\newcommand{\@supervisorlinewidth}{0.35\textwidth}
\newcommand{\supervisorlinewidth}[1]{\renewcommand{\@supervisorlinewidth}{#1}}

% Advisor
\newif\ifPHD@advisor\PHD@advisorfalse
\newcommand{\@advisor}{}
\newcommand{\advisor}[1]{\renewcommand{\@advisor}{#1}\PHD@advisortrue}

% Advisor Title (Advisor - Default, can be changed)
\newcommand{\@advisorrole}{Advisor: }
\newcommand{\advisorrole}[1]{\renewcommand{\@advisorrole}{#1}}

% Advisor width to align
\newcommand{\@advisorlinewidth}{0.25\textwidth}
\newcommand{\advisorlinewidth}[1]{\renewcommand{\@advisorlinewidth}{#1}}

% Submission Text
\newcommand{\submissiontext}{This dissertation is submitted for the degree of }

% keywords (These keywords will appear in the PDF meta-information
% called 'pdfkeywords'.)
\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}

% subjectline (This subject will appear in the PDF meta-information
% called 'pdfsubject'.)
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}


% These macros define an environment for front matter that is always
% single column even in a double-column document.
\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

% Set single column even under two column layout
\newcommand{\setsinglecolumn}{
\if@twocolumn
   \onecolumn
\else
\fi
}


% ******************************************************************************
% *************************** Front Matter Layout ******************************
% ******************************************************************************

% ******************************** Title Page **********************************
\renewcommand{\maketitle}{

% To compute the free vertical space in Title page
\computeTitlePageSpacing

\thispagestyle{empty}

\begin{singlespace}
\begin{center}

% Title
{\usebox{\PHD@Title}} % subtitle is defined
\vspace{.4\PHD@titlepagespacing}

% Author
{\usebox{\PHD@author}}
\vspace{.02\PHD@titlepagespacing}

% Degree title on first submission)
\if@finalsub
\else
  {\usebox{\PHD@award}}
  \vspace{.15\PHD@titlepagespacing}
\fi

% Supervisor
\ifPHD@supervisor%
{\usebox{\PHD@supervisor}}
\vspace{.05\PHD@titlepagespacing}
\fi

% Advisor
\ifPHD@advisor%
{\usebox{\PHD@advisor}}
\vspace{.05\PHD@titlepagespacing}
\fi

% Date
{\usebox{\PHD@awarddate}}
\vspace{.05\PHD@titlepagespacing}

% University Logo
{\usebox{\PHD@crest}}
\vspace{.025\PHD@titlepagespacing}

% Department and University
{\usebox{\PHD@dept}}
\vspace{.01\PHD@titlepagespacing}

% Optional School or Centre
{\usebox{\PHD@collegedept}}

% Submission Text
\ifdefinefinalsub
\else
\vfill
{\usebox{\PHD@submission}}
\fi

\end{center}

\end{singlespace}
}

% ********************************* Dedication *********************************
% The dedication environment makes sure the dedication gets its
% own page, centered

\newenvironment{dedication}
{
\cleardoublepage
\setsinglecolumn
\vspace*{0.2\textheight}
\thispagestyle{empty}
\centering
}



% ******************************* Declaration **********************************
% The declaration environment puts a large, bold, centered
% "Declaration" label at the top of the page.

\newenvironment{declaration}{
\cleardoublepage
\setsinglecolumn
\chapter*{\centering \Large Declaration}
\thispagestyle{empty}
}{
\flushright
\@author{}\\
\@degreedate{}
\vfill
}



% ****************************** Acknowledgements ********************************
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page.

\newenvironment{acknowledgements}{
\cleardoublepage
\setsinglecolumn
\chapter*{\centering \Large Acknowledgements}
\thispagestyle{empty}
}



% ******************************* Nomenclature *********************************
\RequirePackage[intoc]{nomencl}
\makenomenclature
\renewcommand{\nomgroup}[1]{%
\ifthenelse{\equal{#1}{A}}{\item[\textbf{Roman Symbols}]}{%
\ifthenelse{\equal{#1}{G}}{\item[\textbf{Greek Symbols}]}{%
\ifthenelse{\equal{#1}{Z}}{\item[\textbf{Acronyms / Abbreviations}]}{%
\ifthenelse{\equal{#1}{R}}{\item[\textbf{Superscripts}]}{%
\ifthenelse{\equal{#1}{S}}{\item[\textbf{Subscripts}]}{%
\ifthenelse{\equal{#1}{X}}{\item[\textbf{Other Symbols}]}
{}
}% matches mathematical symbols > X
}% matches Subscripts           > S
}% matches Superscripts         > R
}% matches Abbreviations        > Z
}% matches Greek Symbols        > G
}% matches Roman Symbols        > A

% To add nomenclature in the header
\renewcommand{\nompreamble}{\markboth{\nomname}{\nomname}}

% Add nomenclature to contents and print out nomenclature
\newcommand{\printnomencl}[1][]{
\ifthenelse{\equal {#1}{}}
{\printnomenclature}
{\printnomenclature[#1]}
%\addcontentsline{toc}{chapter}{\nomname}
}


% ***************************** Create the index *******************************
\ifPHD@index
    \RequirePackage{makeidx}
    \makeindex
    \newcommand{\printthesisindex}{
        \cleardoublepage
        \phantomsection
        \printindex}
\else
    \newcommand{\printthesisindex}{}
\fi

% ***************************** Chapter Mode ***********************************
% The chapter mode allows user to only print particular chapters with references
% All other options are disabled by default
% To include only specific chapters without TOC, LOF, Title and Front Matter
% To send it to supervisior for changes

\ifPHD@chapter
    \defineChaptertrue
    % Disable the table of contents, figures, tables, index and nomenclature
    \renewcommand{\maketitle}{}
    \renewcommand{\tableofcontents}{}
    \renewcommand{\listoffigures}{}
    \renewcommand{\listoftables}{}
    \renewcommand{\printnomencl}{}
    \renewcommand{\printthesisindex}{}
\else
    \defineChapterfalse
\fi

% ******************************** Abstract ************************************
% The abstract environment puts a large, bold, centered "Abstract" label at
% the top of the page. Defines both abstract and separate abstract environment

% To include only the Title and the abstract pages for submission to BoGS
\ifPHD@abstract
    \defineAbstracttrue
    % Disable the table of contents, figures, tables, index and nomenclature
    \renewcommand{\tableofcontents}{}
    \renewcommand{\listoffigures}{}
    \renewcommand{\listoftables}{}
    \renewcommand{\printnomencl}{}
    \renewcommand{\printnomencl}[1][2]{}
    \renewcommand{\printthesisindex}{}
    \renewcommand{\bibname}{}
    \renewcommand{\bibliography}[1]{\thispagestyle{empty}}
\else
    \defineAbstractfalse
\fi


\newenvironment{abstract} {
\ifPHD@abstract
% Separate abstract as per Student Registry guidelines
  \thispagestyle{empty}
  \setsinglecolumn
  \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1em} \@author} \par}
  \end{center}
\else
% Normal abstract in the thesis
  \cleardoublepage
  \setsinglecolumn
  \chapter*{\centering \Large Abstract}
  \thispagestyle{empty}
\fi
}


% ******************** To compute empty space in title page *******************
% Boxes below are used to space different contents on the title page
% Based on https://github.com/cambridge/thesis

\newcommand{\computeTitlePageSpacing}{


% Title Box
\newsavebox{\PHD@Title}
\begin{lrbox}{\PHD@Title}
  \begin{minipage}[c]{0.98\textwidth}
    \centering \Huge \bfseries{\@title}
    \ifthenelse{\equal{\@subtitle}{}}{
      % subtitle is not defined
    }{
      \\
      \centering \Large {\@subtitle}
    } % subtitle is defined
  \end{minipage}
\end{lrbox}

% Author Box
\newsavebox{\PHD@author}
\begin{lrbox}{\PHD@author}
  \begin{minipage}[c]{\textwidth}
    \centering \Large \bfseries{a cura di} \par
        \vspace{0.5em}
    \centering \LARGE \bfseries{\@author}
        \vspace{0.5em}
  \end{minipage}
\end{lrbox}

% Award Box
\newsavebox{\PHD@award}
\begin{lrbox}{\PHD@award}
  \begin{minipage}[c]{\textwidth}
  \ifthenelse{\equal{\@degreetitle}{}}{
      % degree type not defined
  }{
    \ifdefinefinalsub
        \centering \large \bfseries{\@degreetitle}
    \fi
  } %degree defined
  \end{minipage}
\end{lrbox}

% Supervisor Box
\newsavebox{\PHD@supervisor}
\begin{lrbox}{\PHD@supervisor}
  \begin{minipage}[c]{\textwidth}
    \ifthenelse{\equal{\@supervisor}{}}{
      % supervisor is not defined
    }{
      \begin{center}
        \makebox[\widthof{supervisorrole} + \@supervisorlinewidth][c]{
          \Large
          \@supervisorrole \parbox[t]{\@supervisorlinewidth}{\@supervisor}
        }
      \end{center}
      \vspace{0.5em}
    } % supervisor is defined
  \end{minipage}
\end{lrbox}

% Advisor Box
\newsavebox{\PHD@advisor}
\begin{lrbox}{\PHD@advisor}
  \begin{minipage}[c]{\textwidth}
    \ifthenelse{\equal{\@advisor}{}}{
      % advisor is not defined
    }{
      \begin{center}
        \makebox[\widthof{advisorrole} + \@advisorlinewidth][c]{
          \Large
          \@advisorrole \parbox[t]{\@advisorlinewidth}{\@advisor}
        }
      \end{center}
      \vspace{0.5em}
    } % advisor is defined
  \end{minipage}
\end{lrbox}

% University Crest Box
\newsavebox{\PHD@crest}
\begin{lrbox}{\PHD@crest}
  {\@crest}
\end{lrbox}

% Date Box
\newsavebox{\PHD@awarddate}
\begin{lrbox}{\PHD@awarddate}
\begin{minipage}[c]{\textwidth}
  \Large
  \begin{center}
    \bfseries{\@degreedate}
  \end{center}
\end{minipage}
\end{lrbox}

% Department Box
\newsavebox{\PHD@dept}
\begin{lrbox}{\PHD@dept}
  \begin{minipage}[c]{\textwidth}
  \ifthenelse{\equal{\@dept}{}}{
      % dept is not defined
  }{
    \centering {\large \@dept}
  } %dept defined
  \end{minipage}
\end{lrbox}

% College/Centre/School
\newsavebox{\PHD@collegedept}
\begin{lrbox}{\PHD@collegedept}
\begin{minipage}[c]{\textwidth}
\ifthenelse{\equal{\@college}{}}{
      % school or centre is not defined
  }{
    \centering {\large \@college}
  } %college defined
  \end{minipage}
\end{lrbox}

% Submission Box
\newsavebox{\PHD@submission}
\begin{lrbox}{\PHD@submission}
  \begin{minipage}[c]{\textwidth}
    \begin{center}
        \large \bfseries{\textit{\submissiontext { }\@degreetitle}}
    \end{center}
  \end{minipage}
\end{lrbox}

%  Now to compute the free vertical space
\newlength{\PHD@titlepagespacing}
\setlength{\PHD@titlepagespacing}{ \textheight %
			- \totalheightof{\usebox{\PHD@Title}}
			- \totalheightof{\usebox{\PHD@author}}
            - \totalheightof{\usebox{\PHD@supervisor}}
            - \totalheightof{\usebox{\PHD@advisor}}
			- \totalheightof{\usebox{\PHD@award}}
			- \totalheightof{\usebox{\PHD@awarddate}}
			- \totalheightof{\usebox{\PHD@crest}}
			- \totalheightof{\usebox{\PHD@dept}}
			- \totalheightof{\usebox{\PHD@collegedept}}
			- \totalheightof{\usebox{\PHD@submission}}
}
}