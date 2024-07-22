%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of 
% the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without 
% modification,are permitted in any medium without royalty 
% provided the copyright notice and this notice are preserved. 
% This file is offered as-is, without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
% Further modified by Rui-Hao Bi (2024-07)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------
%   Package and Class Setup
%-----------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2024/07/22 v0.1 Modified Resume class]
\LoadClass[11pt,letterpaper]{article} % Font size and paper type

%-----------------------------------------------------------
%   PREAMBLE
%-----------------------------------------------------------
\RequirePackage[parfill]{parskip} % Remove paragraph indentation
\RequirePackage{array} % Required for boldface (\bfseries) tabular columns
\RequirePackage{ifthen} % Required for ifthenelse statements

\RequirePackage[colorlinks]{hyperref}
\AtBeginDocument{%
\hypersetup{
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=blue,
    citecolor=magenta,
}
}

\pagestyle{empty} % Suppress page numbers

%-----------------------------------------------------------
%    FONT: set the fonts used in the document
% - require XeLaTeX
% - Main font is Stix, which is shipped with this template
% - Small caps font is Times Small Caps, which is also shipped 
%   with this template
%-----------------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage[T1]{fontenc}
\setmainfont{STIX2Text}[
  Path = ./STIX2fonts/,
  Extension = .otf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-BoldItalic,
]
% Load small caps font, located in ./TimesSmallCaps
% Load the Times Small Caps font for bold small caps
\newfontfamily\timessmallcaps[
  Path = ./TimesSmallCaps/,
  Extension = .otf,
  UprightFont = TimesSmallCapsOldStyleFiBold,
  Letters=SmallCaps
]{TimesSmallCapsOldStyleFiBold}
\DeclareRobustCommand{\scshape}{%
  \timessmallcaps\fontshape{sc}\selectfont}


%-----------------------------------------------------------
%    GEOMETRY: set the margins of the CV page
%-----------------------------------------------------------
\RequirePackage[left=0.6in, right=0.6in, top=0.6in, bottom=0.6in]{geometry} % Document margins


%-----------------------------------------------------------
%    NEW COMMANDS
%-----------------------------------------------------------
\newcommand{\tab}[1]{\hspace{.2667\textwidth}\rlap{#1}} 
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}


%-----------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%-----------------------------------------------------------
\usepackage[USenglish]{isodate} % Prints the Last Updated date in US English format

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \datestring#1{\def\@datestring{#1}} % Defines the \name command to set name
\def \@datestring {} % Sets \@name to empty by default
% define the date string
\datestring{Curriculum Vitae, dated \today}

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\namesize\bfseries\scshape\@name}\hfil
    \nameskip\break 
  \endgroup
}

% \printdated is used to print the date as a page header, right under the name
\def \printdated {
  \begingroup
    \nameskip
    \makebox[\textwidth]{\@datestring}
  \endgroup
}


%-----------------------------------------------------------
%	PRINT THE HEADING LINES
%-----------------------------------------------------------
\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \printdated % Print the date specified with \datestring
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%-----------------------------------------------------------
%	SECTION FORMATTING
%-----------------------------------------------------------
\newcommand{\thickerhrule}{\hrule height 1.5pt \relax} % Defines a thicker horizontal rule for the sections

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  {\sectionsize\bfseries\scshape #1} % Section title
  \sectionlineskip % Whitespace after the section title
  \thickerhrule % Horizontal line after the section title   
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%-----------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%-----------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\sectionsize\bfseries\scshape #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\em #3} \hfill {\em #4} % Italic job title and location
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\LARGE}            % Size of the name (CV title)
\def\sectionsize{\large}         % Size of the sections
\def\addressskip{\smallskip}     % The space between the two address lines
\def\sectionlineskip{\smallskip} % The space above the horizontal line for each section 
\def\nameskip{\smallskip}        % The space after your name at the top
\def\sectionskip{\smallskip}     % The space after the heading section

\newenvironment{cvitems}{
\vspace{-5pt}
\begin{itemize}
  \setlength{\itemsep}{1pt}
  \setlength{\parskip}{0pt}
  \setlength{\parsep}{0pt}
}{\end{itemize}}


%-----------------------------------------------------------
%   FORMATTING	
%-----------------------------------------------------------

% School items: 
% left align school name, bold
% right align school location, upright
\newcommand{\lrone}[2]{%
    {\bfseries #1} \hfill {\upshape #2} 
}

% degree items:
% left align degree name, italic
% right align degree date, upright
\newcommand{\lrtwo}[2]{%
    {\itshape #1} \hfill {\upshape #2}
}

% show code:
\newcommand{\showcode}[1]{%
  \hypersetup{urlcolor=magenta} % adjust link color for code
  [\href{#1}{code}]
  \hypersetup{urlcolor=blue}
}

\newcommand{\showpdf}[1]{%
  \hypersetup{urlcolor=magenta} % adjust link color for code
  [\href{#1}{pdf}]
  \hypersetup{urlcolor=blue}
}


