% multiple1902 <multiple1902@gmail.com>
% xjtuthesis.cls
% Copyright 2011~2013, multiple1902 (Weisi Dai)
% https://code.google.com/p/xjtuthesis/
%
% It is strongly recommended that you read documentations located at
%   http://code.google.com/p/xjtuthesis/wiki/Landing?tm=6
% in advance of your compilation if you have not read them before.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Weisi Dai.
%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{xjtuthesis}
[2011/7/15 0.0.1 Xi'an Jiaotong University Dissertation Template]

% Brand marks, and version info
\def\xjtuthesis{XJTUthesis}
\def\meta@version{0.6.6}
\def\meta@codename{Monet}
\def\metaversion{\meta@version}

% Option switches
% \newif\ifxjtu@bachelor  \xjtu@bachelorfalse
% \newif\ifxjtu@master    \xjtu@masterfalse
% \newif\ifxjtu@doctor    \xjtu@doctorfalse
\newif\ifxjtu@bigskip   \xjtu@bigskipfalse
\newif\ifxjtu@nofont    \xjtu@nofontfalse
\newif\ifxjtu@pdflinks  \xjtu@pdflinksfalse
\newif\ifxjtu@colorlinks\xjtu@colorlinksfalse
\newif\ifxjtu@compact   \xjtu@compactfalse
\newif\ifxjtu@content	  \xjtu@contentfalse

% \DeclareOption{bachelor}    {\xjtu@bachelortrue}
% \DeclareOption{master}      {\xjtu@mastertrue}
% \DeclareOption{doctor}      {\xjtu@doctortrue}
\DeclareOption{bigskip}     {\xjtu@bigskiptrue} % bachelor only
\DeclareOption{pdflinks}    {\xjtu@pdflinkstrue}
\DeclareOption{colorlinks}  {\xjtu@colorlinkstrue}
\DeclareOption{compact}     {\xjtu@compacttrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ProcessOptions\relax

\LoadClass[openany]{book}

% if-condition
\newif\ifxjtu@inmainbody\xjtu@inmainbodyfalse


% Math & format packages
% \RequirePackage{showframe}
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{indentfirst}
\RequirePackage{tabularx}
\RequirePackage{threeparttable}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{subfig}
\RequirePackage[numbers,super,square,sort&compress]{natbib}
\RequirePackage{setspace}
\RequirePackage[shortlabels]{enumitem}
\setenumerate[1]{1),fullwidth,itemindent=\parindent,listparindent=\parindent,itemsep=0.05\baselineskip,partopsep=0pt,parsep=0ex,topsep=0.1\baselineskip}
\setenumerate[2]{\qquad(1),itemindent=\parindent,listparindent=\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex,topsep=0\baselineskip}
\RequirePackage{pdfpages}
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

% CJK character support
\RequirePackage[no-math]{fontspec}
\RequirePackage{xltxtra,xunicode}
\RequirePackage[slantfont,boldfont,CJKnumber]{xeCJK}
\punctstyle{hangmobanjiao}

% Padding
\RequirePackage[left=2.6cm, right=2.6cm, top=3.0cm, bottom=2.5cm, a4paper]{geometry}

% Header & footer
\RequirePackage{fancyhdr}
\RequirePackage[perpage]{footmisc}
\RequirePackage{tikz}

% titleformat
\RequirePackage{titlesec, titletoc}

\AtBeginDocument{
	\renewcommand{\d}{\mathrm d}
	\newcommand{\ud}{\,\d}
	\newcommand*{\dfr}[2]{\frac{\d #1}{\d #2}}
	\newcommand*{\pfr}[2]{\frac{\partial #1}{\partial #2}}
}

% l10n here
\renewcommand{\ALG@name}{算法}
\renewcommand{\tablename}{表}
\renewcommand{\figurename}{图}
\renewcommand{\bibname}{\vskip -0.5em 参考文献}
\renewcommand\@biblabel[1]{{[#1]\hfill}}
\renewcommand\contentsname{目\quad 录}
\renewcommand\thefigure{% thanks to fitsir<at>gmail.com
     \ifnum \c@chapter>\z@\thechapter-\fi\@arabic\c@figure%
}
\renewcommand\thetable{%
    \ifnum \c@chapter >\z@ \thechapter-\fi \@arabic \c@table%
}
\renewcommand\theequation{%
    \ifnum \c@chapter >\z@ \thechapter-\fi \@arabic \c@equation%
}
\captionsetup{labelsep=quad}
\captionsetup[longtable]{labelsep=quad}

\let\@oldparen\paren
\def\paren{\@ifstar{\@oldparen}{\@oldparen*}}
\let\@oldbkt\bkt
\def\bkt{\@ifstar{\@oldbkt}{\@oldbkt*}}

\ifxjtu@pdflinks
    \RequirePackage[unicode=true]{hyperref}
    \RequirePackage{bookmark}
    \ifxjtu@colorlinks
        \hypersetup{
            bookmarksnumbered=true,
            bookmarksopen=true,
            bookmarksopenlevel=1,
            breaklinks=true,
            colorlinks=true,
            linkcolor=blue,
            anchorcolor=blue,
            citecolor=green,
            plainpages=false,
            % pdfpagelabels, % comment this to reduce warning
            pdfborder=0 0 0,
        }
    \else
        \hypersetup{
            bookmarksnumbered=true,
            bookmarksopen=true,
            bookmarksopenlevel=1,
            breaklinks=true,
            colorlinks=false,
            plainpages=false,
            % pdfpagelabels, % comment this to reduce warning
            pdfborder=0 0 0,
        }
    \fi
    \urlstyle{same}
\fi

% Font-size
\RequirePackage{calc}
% Used code from THUthesis. Many thanks!
\newlength\thu@linespace
\newcommand{\thu@choosefont}[2]{%
  \setlength{\thu@linespace}{#2*\real{#1}}%
  \fontsize{#2}{\thu@linespace}\selectfont}
\def\thu@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \thu@choosefont{##1}{#2}}}
\thu@define@fontsize{chuhao}{42bp}
\thu@define@fontsize{xiaochu}{36bp}
\thu@define@fontsize{yihao}{26bp}
\thu@define@fontsize{xiaoyi}{24bp}
\thu@define@fontsize{erhao}{22bp}
\thu@define@fontsize{xiaoer}{18bp}
\thu@define@fontsize{sanhao}{16bp}
\thu@define@fontsize{xiaosan}{15bp}
\thu@define@fontsize{sihao}{14bp}
\thu@define@fontsize{banxiaosi}{13bp}
\thu@define@fontsize{xiaosi}{12bp}
\thu@define@fontsize{dawu}{11bp}
\thu@define@fontsize{wuhao}{10.5bp}
\thu@define@fontsize{xiaowu}{9bp}
\thu@define@fontsize{liuhao}{7.5bp}
\thu@define@fontsize{xiaoliu}{6.5bp}
\thu@define@fontsize{qihao}{5.5bp}
\thu@define@fontsize{bahao}{5bp}
\renewcommand\normalsize{%
   \@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\DeclareCaptionFont{wuhao}{\wuhao}\captionsetup{font=wuhao,labelsep=quad} % thanks to @wanderxjtu
\DeclareCaptionFont{xiaowu}{\xiaowu}\captionsetup[subfloat]{font=xiaowu} % issue 4

% Subfloat
\captionsetup[subfloat]{labelformat=simple,captionskip=6bp,nearskip=6bp,farskip=0bp,topadjust=0bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})} % referencing
\setlength{\floatsep}{5bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{5bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{5bp \@plus4pt \@minus2pt}

% Header & footer styles
\def\ps@thu@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty}
\def\ps@thu@plain{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@oddfoot{\hfil\wuhao\thepage\hfil}%
  \let\@evenfoot=\@oddfoot}

% Font-family
\setmainfont[Ligatures=TeX]{Times New Roman}

\def\thu@define@term#1{
\long\expandafter\gdef\csname #1\endcsname##1{% defines a macro like \ctitle#1: \def\xjtu@ctitle{#1}
    \long\expandafter\gdef\csname xjtu@#1\endcsname{##1}}
  \csname #1\endcsname{}} % the initial value is NULLSTR

% % Table of contents, in English
% \newcommand\engcontentsname{CONTENTS}
% \newcommand\tableofengcontents{%
%     \if@twocolumn
%       \@restonecoltrue\onecolumn
%     \else
%       \@restonecolfalse
%     \fi
%     \chapter*{\engcontentsname
%         \@mkboth{%
%           \MakeUppercase\engcontentsname}{\MakeUppercase\engcontentsname}}%
%     \@starttoc{toe}%
%     \if@restonecol\twocolumn\fi
%     }
% \newcommand\addengcontents[2]{%
%     \addcontentsline{toe}{#1}{\protect\numberline{\csname the#1\endcsname}#2}}
% \newcommand\addengappendice[2]{%
%     \addcontentsline{toe}{#1}{theappendix}#2}

% \newcommand\echapter[1]{\addengcontents{chapter}{#1}}
% \newcommand\esection[1]{\addengcontents{section}{#1}}
% \newcommand\esubsection[1]{\addengcontents{subsection}{#1}}
% \newcommand\esubsubsection[1]{} % do nothing
% \newcommand\eappendix[1]{\addengappendice{#1}}

% Circled footnote number
% http://tex.stackexchange.com/questions/133264/circled-footnote-symbols-with-pifont-showing-arrows-instead-of-circled-numbers
\newcommand*\circled[1]{
    \tikz[baseline=(char.base)]
    \node[shape=circle,draw,inner sep=0.5pt,minimum size=8pt] (char) {#1};
}
\renewcommand\thefootnote{\protect\circled{\arabic{footnote}}}
\setlength{\footnotesep}{\baselineskip}
\renewcommand\@makefntext[1]{
    \setstretch{1.2}%
    \noindent\@thefnmark #1
}

\thu@define@term{type}

% Interfaces, or commands
\newcommand\xjtucover{}
\newcommand\xjtuchead{}
\newcommand\xjtuehead{}
\newcommand\xjtucinfopage{}
\newcommand\xjtueinfopage{}
\newcommand\xjtucontent{}
\newcommand\xjtuendcontent{}
\newcommand\xjtutoc{
    \tableofcontents
    \chaptermark{目\quad 录}
    \clearpage
}
\newcommand\xjtuspchapter[2]{
    \chapter*{#2}
    \chaptermark{#1}
    \addcontentsline{toc}{chapter}{#1}
}
\newcommand\xjtuincite[1]{ {%
    \citestyle{plain}%
    \cite{#1}%
    }%
}

% Interfaces, or terms
\thu@define@term{cauthor}
\thu@define@term{ctitle}
\thu@define@term{csupervisor}
\thu@define@term{cabstract}
\thu@define@term{ckeywords}
% \thu@define@term{csubject}
% \thu@define@term{cproddate}
% \thu@define@term{ctype}
\thu@define@term{acknowledgement}

\thu@define@term{eauthor}
\thu@define@term{etitle}
\thu@define@term{ecate}
\thu@define@term{esupervisor}
\thu@define@term{eabstract}
\thu@define@term{ekeywords}
% \thu@define@term{esubject}
% \thu@define@term{eproddate}
% \thu@define@term{etype}

% \thu@define@term{zhongtufenlei}
% \thu@define@term{UDC}
% \thu@define@term{secrettype}
% \thu@define@term{stunum}
% \thu@define@term{degreetype}

% \newcommand\xjtutype{\xjtu@type}

% Geometry specifications
% raggedbottom 令latex倾向于在页低添加空白，而不是拉伸段间距或列表前后间距、公式图片前后间距。按照工作手册，要求段间不空行。
% \parskip 0pt 也可以实现段间不空行，但是在无法填充页面时会导致列表前后、图片前后等位置被拉伸。
\raggedbottom
\topmargin=-1in % 消除页眉-边界距离初始值
\headheight=5.5mm % 该设定使得效果与官方doc模板相似
\textheight=242mm % 297-30-25
\footskip=7.5mm
\setlength\voffset{2cm} % 规范：页眉距边界2.0cm, one inch + \voffset + \topmargin = 2cm.
% 规范：上装订线边距3cm，即上边距到正文3cm。
% 需要 1 inch + \voffset + \topmargin + \headheight + \headsep = 3.0cm
\headsep= 4.5mm
\pagenumbering{Roman}
\xiaosi
\setlength{\parindent}{2em}

% Table of contents, style
\setcounter{secnumdepth}{3}

% Section titles, style
\titleformat{\chapter}[block]{\sanhao}{}{1em}{\begin{center}}[\end{center}]
\titlespacing{\chapter}{0em}{0\baselineskip}{1\baselineskip}
\titleformat{\section}[hang]{\xiaosan}{\thesection}{1em}{}
\titlespacing{\section}{0em}{1\baselineskip}{0.5\baselineskip}
\titleformat{\subsection}{\sihao}{\thesubsection}{1em}{}
\titlespacing{\subsection}{2em}{0.5\baselineskip}{0\baselineskip}
\titleformat{\subsubsection}{}{\arabic{subsubsection})~}{1em}{}
\titlespacing{\subsubsection}{2em}{0.2\baselineskip}{0\baselineskip}
\renewcommand{\l@chapter}{\@dottedtocline{1}{0em}{1.5em}}

\titlecontents{chapter}[0em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{section}[1.5em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{subsection}[3.8em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}

\let\oldfigure=\figure
\renewcommand\figure[1][]{
    \oldfigure[#1]
    \wuhao
}

\let\oldtable=\table
\renewcommand\table[1][]{
    \vskip0.5\baselineskip
    \oldtable[#1]
    \wuhao
    \renewcommand{\arraystretch}{1.5}
}

% algorithm/pseudocode
\renewcommand\thealgorithm{%
    \ifnum \c@chapter >\z@ \thechapter-\fi \@arabic \c@algorithm%
}
\newcommand\fs@ruled@notop{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@ruled
  %\def\@fs@pre{\hrule height.8pt depth0pt \kern2pt}% <----removed
  \def\@fs@pre{\vskip0.5\baselineskip}%
  \def\@fs@mid{\vskip1ex\kern2pt\hrule height1.5pt\kern2pt}%
  \def\@fs@post{\kern2pt\hrule height1.5pt\relax}%
  \let\@fs@iftopcapt\iftrue}
\renewcommand\fst@algorithm{\fs@ruled@notop}

% following codes are defining breakable pseudocode block.
% this solution cannot prevent pagebreak before the ending hline.
\newenvironment{breakablealgorithm}[1][\relex] %dismiss float placement specifier
  {% \begin{breakablealgorithm}
  {\par\baselineskip}%
     \refstepcounter{algorithm}% New algorithm
     \renewcommand{\caption}[2][\relax]{% Make a new \caption
       {\centerline{\wuhao \ALG@name~\thealgorithm\quad ##2}\par}%
       \ifx\relax##1\relax % #1 is \relax
         \addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##2}%
       \else % #1 is not \relax
         \addcontentsline{loa}{algorithm}{\protect\numberline{\thealgorithm}##1}%
       \fi
       \vskip1ex\kern2pt\hrule height 1.5pt\kern2pt
     }
  }{% \end{breakablealgorithm}
    \kern2pt\hrule height 1.5pt\vskip0.5\baselineskip
  }
% end algorithm

\newcommand{\monthname}[1]{%
\ifcase#1
\or January%
\or February%
\or March%
\or April%
\or May%
\or June%
\or July%
\or August%
\or September%
\or October%
\or November%
\or December%
\fi}


% The denotation environment
\newenvironment{denotation}[1][2.5cm]{ % many thanks to THUthesis!
  \chapter*{主要符号表}
  \addcontentsline{toc}{chapter}{主要符号表}
  \chaptermark{主要符号表}
  \noindent\begin{list}{}%
    {\vskip-30bp %\xiaosi[1.6]
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1} % 标签盒子宽度
     \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
     \setlength{\itemindent}{1em} % 标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
   }}{\end{list}}

\newcommand{\xjtuappendix}{
    \begin{appendix}
    \renewcommand{\thechapter}{附录\arabic{chapter}}
    \chaptermark{附录}
}
\newcommand{\xjtuendappendix}{\end{appendix}}
\newcommand{\xjtuappendixchapter}[1]{
    \stepcounter{chapter}
    \chapter*{\thechapter\quad#1}
    \addcontentsline{toc}{chapter}{\thechapter\texorpdfstring{\quad}{\ }#1}
}
\newcommand{\xjtuappendixsection}[1]{
    \stepcounter{section}
    \section*{#1}
    \addcontentsline{toc}{section}{\thesection\texorpdfstring{\quad}{\ }#1}
}
\newcommand{\xjtuappendixsubsection}[1]{
    \stepcounter{subsection}
    \subsection*{#1}
    \addcontentsline{toc}{subsection}{\thesubsection\texorpdfstring{\quad}{\ }#1}
}
\newcommand{\xjtuappendixsubsubsection}[1]{
    \stepcounter{subsubsection}
    \subsubsection*{#1}
    \addcontentsline{toc}{subsubsection}{\thesubsubsection\texorpdfstring{\quad}{\ }#1}
}
% \newcommand{\xjtuappendixechapter}[1]{
%     \echapter*{\thechapter\quad#1}
%     \addcontentsline{toe}{chapter}{\thechapter\texorpdfstring{\quad}{\ }#1}
% }
% \newcommand{\xjtuappendixesection}[1]{
%     \esection*{#1}
%     \addcontentsline{toe}{section}{\thesection\texorpdfstring{\quad}{\ }#1}
% }
% \newcommand{\xjtuappendixesubsection}[1]{
%     \esubsection*{#1}
%     \addcontentsline{toe}{subsection}{\thesubsection\texorpdfstring{\quad}{\ }#1}
% }
% \newcommand{\xjtuappendixesubsubsection}[1]{
% }
\newcommand{\xjtuacknowledgement}{
    \xjtuspchapter{致\texorpdfstring{\quad }{\ }谢}{致\qquad 谢}
    \xjtu@acknowledgement
}

\let\oldtableofcontents=\tableofcontents
\def\tableofcontents{
    \oldtableofcontents
}

% The ``compact'' option eliminates the empty pages
\ifxjtu@compact
    \let\oldcleardoublepage=\cleardoublepage
    \def\cleardoublepage{
        \clearpage
    }
\fi

% \ifxjtu@bachelor

    % LaTeX and MS word calculate line space differently.
    % Experiments shown that using \linespread{1.175} and \linespread{0.94}
    % will give the same result of using 1.5 and 1.2 line spacing, respectively.
    
\ifxjtu@bigskip
  \linespread{1.175} \selectfont
\else
  \linespread{0.94} \selectfont
\fi

\renewcommand\footnoterule{\vspace*{-3pt}% eggache!
    \hrule width 0.25\textwidth height 0.4pt
        \vspace*{2.6pt}}

\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyhead[CO]{\if@mainmatter\wuhao \ifxjtu@inmainbody\thechapter\quad\fi \leftmark\fi}
  \fancyhead[CE]{\wuhao 西安交通大学本科毕业设计（论文）}
  \fancyfoot[OR,EL]{\xiaowu ~\thepage~}
  \renewcommand{\headrulewidth}{\if@mainmatter 0.5pt\else 0pt \fi}
  \renewcommand{\headrule}{\hrule \@height \headrulewidth \@width \headwidth \vskip .5pt
  \hrule \@height \headrulewidth \@width \headwidth \vskip -\headrulewidth}
}

\pagestyle{plain}
% \type{本科}
\renewcommand\xjtucinfopage{
    \chaptermark{摘\quad 要}
    {\noindent \bf
    	论文题目： \xjtu@ctitle\\
        学生姓名： \xjtu@cauthor\\
        指导教师： \xjtu@csupervisor\\
    }

    \begin{center}
      \sanhao
      摘\quad 要
    \end{center}

    \xjtu@cabstract

    \mbox{}

    {\wuhao \noindent 
        \textbf{关\ 键\ 词}：\xjtu@ckeywords
    }
    \clearpage
}

\renewcommand\xjtueinfopage{
    \chaptermark{ABSTRACT}
    \noindent {\bf
    Title: \xjtu@etitle\\
    Name: \xjtu@eauthor\\
    Supervisor: \xjtu@esupervisor\\
    }

    \begin{center}
      \sanhao
      ABSTRACT
    \end{center}


    {
    \setlength{\parindent}{0em}
    \setlength{\parskip}{1em}
    \xjtu@eabstract
    }

    \mbox{ }

    {\wuhao \noindent
        {\bf KEY WORDS: }
        \xjtu@ekeywords
    }

    \clearpage
}

% booktabs parameters
\setlength\cmidrulewidth {1.0pt}
\setlength\lightrulewidth{1.0pt}
\setlength\heavyrulewidth{1.5pt}

\renewcommand\xjtucontent{
    \cleardoublepage
    % \ifodd\arabic{page}\else
    %     \fancypagestyle{plain}{%
    %         \fancyhf{}
    %         \fancyhead[CE]{\if@mainmatter\wuhao \thechapter\quad\leftmark\fi}
    %         \fancyhead[CO]{\wuhao 西安交学本科毕业设计（论文）}
    %         \fancyfoot[ER,OL]{\small ~\thepage~}
    %         \renewcommand{\headrulewidth}{\if@mainmatter 0.5pt\else 0pt \fi}
    %         \renewcommand{\headrule}{\hrule \@height \headrulewidth \@width \headwidth \vskip .5pt
    %         \hrule \@height \headrulewidth \@width \headwidth \vskip -\headrulewidth}
    %     }
    %     \pagestyle{plain}
    % \fi
    \pagenumbering{arabic}
    \titleformat{\chapter}[block]{\sanhao}{}{0em}{\begin{center}\thechapter\quad}[\end{center}]
    \xjtu@inmainbodytrue
}

\renewcommand\xjtuendcontent{
    \newpage
    \titleformat{\chapter}[block]{\sanhao}{}{0em}{\begin{center}}[\end{center}]
    \titleformat{\section}[hang]{\xiaosan}{}{0em}{\thesection\quad }[\vskip -0.5em]
    \titleformat{\subsection}{\sihao}{}{0em}{\vskip -1.5em \thesubsection\quad{}}
    \titleformat{\subsubsection}{}{}{0em}{\thesubsubsection\quad}[]
    \titlecontents{chapter}[0em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
    \titlecontents{section}[1.5em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
    \titlecontents{subsection}[3.8em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
    \titlespacing{\subsection}{0em}{0.5\baselineskip}{0\baselineskip}
    \titlespacing{\subsubsection}{0em}{0.2\baselineskip}{0\baselineskip}
    \xjtu@inmainbodyfalse
}

\newcommand{\xjtubib}[1]{ {
    \clearpage
    \phantomsection % http://www.tex.ac.uk/cgi-bin/texfaq2html?label=tocbibind
    \addcontentsline{toc}{chapter}{参考文献}

    \wuhao
    \bibliographystyle{gbt7714-2005-xjtu}
    \bibliography{#1}
    \clearpage
    } }

\let\oldfootnote\footnote
\renewcommand \footnote[1]{\oldfootnote{\xiaowu #1}}

\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}{}}

% \else % postgraduate
%     % booktabs parameters
%     \setlength\cmidrulewidth {1.0pt}
%     \setlength\lightrulewidth{1.0pt}
%     \setlength\heavyrulewidth{2.0pt} % or 2.25pt

%     \fancypagestyle{plain}{%
%       \setlength{\voffset}{1.8cm}
%       \setlength{\headsep}{1.2cm-\headheight}
%       \fancyhf{}
%       \fancyhead[CO]{\if@mainmatter\wuhao \ifxjtu@inmainbody\thechapter\quad\fi \leftmark\fi}
%       \fancyhead[CE]{\wuhao 西安交通大学\xjtu@type 学位论文}
%       \fancyfoot[OR,EL]{\xiaowu ~\thepage~}
%       \renewcommand{\headrulewidth}{\if@mainmatter .4pt \else 0pt \fi}
%       \renewcommand{\headrule}{\vskip 3pt \hrule \@height \headrulewidth \@width \headwidth \vskip .6pt
%       \hrule \@height \headrulewidth \@width \headwidth
%       }
%     }
%     \pagestyle{plain}

%     \renewcommand\xjtucover{
%         \thispagestyle{empty}
%         \setlength\hoffset{0.8cm}
%         \hspace*{-3.8cm}
%         \rotatebox{-90}{
%             \makebox[\textheight][c]{
%                 \bf \CJKmove \xiaowu \CJKfamily{vert}
%                 西安交通大学\xjtu@type 学位论文
%                 \hspace{2cm}
%                 \xjtu@ctitle
%                 \hspace{2cm}
%                 \xjtu@cauthor
%                 \hspace{2cm}
%                 \xjtu@cproddate
%             }
%         }
%         \vspace*{-\textheight}\vspace*{-1.4cm}
%         \begin{center}
%             {
%                 \sihao 分类号\underline{\makebox[5.2cm][c]{\xjtu@zhongtufenlei}}
%                 \quad 密级\underline{\makebox[5.2cm][c]{\xjtu@secrettype}} \\
%                 \vskip 0.4cm U~D~C\underline{\makebox[5.4cm][c]{\xjtu@UDC}}
%                 \quad 学号\underline{\makebox[5.2cm][c]{\xjtu@stunum}}
%             }
%             \vskip 9cm
%             {\xiaoyi {\bf \xjtu@ctitle}}

%             \vskip 4cm
%             \begin{spacing}{1.5}
%               \sihao
%               {\CJKfamily{hei}学位申请人：}  \underline{\makebox[6.2cm][c]{\xjtu@cauthor}}\\
%               {\CJKfamily{hei}指~导~教~师~：} \underline{\makebox[6.2cm][c]{\xjtu@csupervisor}}\\
%               {\CJKfamily{hei}学~科~专~业~：} \underline{\makebox[6.2cm][c]{\xjtu@csubject}}\\
%               {\CJKfamily{hei}学~位~类~别~：} \underline{\makebox[6.2cm][c]{\xjtu@degreetype}}
%               \vskip 2cm
%               {\CJKfamily{hei}\xjtu@cproddate}
%             \end{spacing}
%         \end{center}

%         \ifxjtu@compact\else
%             \clearpage
%             \phantom{x}
%             \thispagestyle{empty}
%         \fi
%         \clearpage
%         \setlength\hoffset{0cm}
%     }

%     \renewcommand\xjtuchead{
%         \thispagestyle{empty}
%         \begin{center}
%         \vspace*{1.5cm}
%             \includegraphics[width=8cm]{XJTU.pdf} \\
%             \vskip 1.2cm
%             {\erhao \xjtu@type 学位论文}

%             \vskip 3.5cm
%             {\bf \sanhao {\bf \xjtu@ctitle}}

%             \vskip 6cm
%         \begin{spacing}{1.5}\sanhao
%             申请人： \xjtu@cauthor\\
%             学科专业： \xjtu@csubject\\
%             指导教师： \xjtu@csupervisor\\
%             \xjtu@cproddate
%         \end{spacing}

%         \end{center}
%         \ifxjtu@compact\else
%             \clearpage
%             \phantom{x}
%             \thispagestyle{empty}
%         \fi
%         \clearpage
%     }

%     \renewcommand\xjtuehead{
%         \thispagestyle{empty}
%         \begin{center}
%         \vspace*{1.5cm}
%             {\bf \sanhao \xjtu@etitle}

%             \vskip 4.2cm
%             \begin{spacing}{1.3}\sanhao
%             A \thesis\ submitted to \\
%             Xi'an Jiaotong University\\
%             in partial fulfillment of the requirement\\
%             for the degree of\\
%             \Master\ of \xjtu@ecate

%             \vskip 3cm
%             By\\ \xjtu@eauthor\\
%             (\xjtu@esubject)\\
%             Supervisor: \xjtu@esupervisor\\
%             \xjtu@eproddate
%             \end{spacing}

%         \end{center}
%         \ifxjtu@compact\else
%             \clearpage
%             \phantom{x}
%             \thispagestyle{empty}
%         \fi
%         \clearpage

%     }

%     \renewcommand\xjtucinfopage{
%         \chaptermark{摘\quad 要}
%         \pagestyle{plain}
%         \pagenumbering{Roman}
%         \noindent {\textsf \xiaosi
%         论文题目： \xjtu@ctitle\\
%         学科专业： \xjtu@csubject\\
%         申\:\;请\:\;人： \xjtu@cauthor\\
%         指导教师： \xjtu@csupervisor\\
%         }

%         \vskip 0\baselineskip
%         \begin{center}
%           \sanhao
%           摘\quad 要
%         \end{center}
%         \vskip 1.1\baselineskip

%         \xjtu@cabstract

%         \mbox{}

%         {\wuhao \noindent
%             {\bf 关\:\;键\:\;词}：
%         \xjtu@ckeywords

%         \noindent {\bf 论文类型}：
%         \xjtu@ctype
%         }
%         \clearpage
%     }
%     \renewcommand\xjtueinfopage{
%         \chaptermark{ABSTRACT}
%         \noindent {\bf
%         Title: \xjtu@etitle\\
%         Speciality: \xjtu@esubject\\
%         Applicant: \xjtu@eauthor\\
%         Supervisor: \xjtu@esupervisor\\
%         }

%         \vskip 1.1\baselineskip
%         \begin{center}
%           \sanhao
%           ABSTRACT
%         \end{center}
%         \vskip 0.5\baselineskip


%         {
%         \begin{spacing}{0.9}
%         \setlength{\parindent}{0em}
%         \setlength{\parskip}{1em}
%         \xjtu@eabstract
%         \end{spacing}
%         }

%         \vskip 1em

%         {\wuhao\noindent
%             {\bf KEY WORDS: }
%             \xjtu@ekeywords

%             \noindent {\bf TYPE OF \MakeUppercase{\thesis}} :
%             \xjtu@etype
%         }

%         \clearpage
%     }
%     \let\oldxjtutoc=\xjtutoc
%     \def\xjtutoc{
%         \cleardoublepage
%         \oldxjtutoc
%     }

%     \renewcommand\xjtucontent{
%         \cleardoublepage
%         \pagenumbering{arabic}
%         \titleformat{\chapter}[block]{\sanhao}{}{0em}{\begin{center}\thechapter\quad}[\end{center}]
%         \xjtu@inmainbodytrue
%     }
%     \renewcommand\xjtuendcontent{
%         \newpage
%         \titleformat{\chapter}[block]{\sanhao}{}{0em}{\begin{center}}[\end{center}]
%         \titleformat{\section}[hang]{\xiaosan}{}{0em}{\thesection\quad }[\vskip -0.5em]
%         \titleformat{\subsection}{\sihao}{}{0em}{\vskip -1.5em \thesubsection\quad{}}
%         \titleformat{\subsubsection}{}{}{0em}{\thesubsubsection\quad}[]
%         \titlecontents{chapter}[0em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
%         \titlecontents{section}[1.5em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
%         \titlecontents{subsection}[3.8em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
%         \titlespacing{\subsection}{0em}{0.5\baselineskip}{0\baselineskip}
%         \titlespacing{\subsubsection}{0em}{0.2\baselineskip}{0\baselineskip}
%         \xjtu@inmainbodyfalse
%     }

%     \newcommand{\xjtubib}[1]{ {
%         \clearpage
%         \phantomsection
%         \addcontentsline{toc}{chapter}{参考文献}
%         \addcontentsline{toe}{chapter}{References}
%         \setlength{\bibsep}{0pt}
%         \begin{spacing}{1.2}
%         \wuhao
%         \bibliographystyle{GBT7714-2005NLang-UTF8}
%         \bibliography{#1}
%         \end{spacing}
%         \clearpage
%         } }

%   \let\oldfootnote\footnote
%   \renewcommand \footnote[1]{\oldfootnote{\xiaowu #1}}

%     \renewcommand{\chaptermark}[1]{\markboth{#1}{}}
%     \renewcommand{\sectionmark}[1]{\markright{#1}{}}

%     \renewcommand\xjtuspchapter[3]{
%         \chapter*{#2}
%         \chaptermark{#1}
%         \addcontentsline{toc}{chapter}{#1}
%         \addcontentsline{toe}{chapter}{#3}
%     }

%     \newcommand{\xjtuacademicintegrity}{\thispagestyle{fancy}\fancyfoot{}{ % 仅供参考
%         \cleardoublepage
%         \chaptermark{声明}
%         \begin{center}
%             \sanhao 学位论文独创性声明（1）
%         \end{center}
%     本人声明：所呈交的学位论文系在导师指导下本人独立完成的研究成果。文中依法引用他人的成果，均已做出明确标注或得到许可。论文内容未包含法律意义上已属于他人的任何形式的研究成果，也不包含本人已用于其他学位申请的论文或成果。

%     本人如违反上述声明，愿意承担以下责任和后果：
%     \begin{enumerate}[1] \itemsep1pt \parskip0pt \parsep0pt
%         \item 交回学校授予的学位证书；
%         \item 学校可在相关媒体上对作者本人的行为进行通报；
%         \item 本人按照学校规定的方式，对因不当取得学位给学校造成的名誉损害，进行公开道歉。
%         \item 本人负责因论文成果不实产生的法律纠纷。
%     \end{enumerate}

%     论文作者（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日 \vskip 1cm

%     \begin{center}
%         \sanhao 学位论文独创性声明（2）
%     \end{center}
%     本人声明：研究生\hskip 2cm 所提交的本篇学位论文已经本人审阅，确系在本人指导下由该生独立完成的研究成果。

%     本人如违反上述声明，愿意承担以下责任和后果：
%     \begin{enumerate}[1] \itemsep1pt \parskip0pt \parsep0pt
%         \item 学校可在相关媒体上对本人的失察行为进行通报；
%         \item 本人按照学校规定的方式，对因失察给学校造成的名誉损害，进行公开道歉。
%         \item 本人接受学校按照有关规定做出的任何处理。
%     \end{enumerate}

%     指导教师（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日 \vskip 1cm


% \begin{center}
%     \sanhao 学位论文知识产权权属声明
% \end{center}
% 我们声明，我们提交的学位论文及相关的职务作品，知识产权归属学校。学校享有以任何方式发表、复制、公开阅览、借阅以及申请专利等权利。学位论文作者离校后，或学位论文导师因故离校后，发表或使用学位论文或与该论文直接相关的学术论文或成果时，署名单位仍然为西安交通大学。

%     论文作者（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日

%     指导教师（签名）：\hskip 5cm 日期：\hskip 2cm 年\hskip 1cm 月\hskip 1cm日

%     \noindent (本声明的版权归西安交通大学所有，未经许可，任何单位及任何个人不得擅自使用)
%     } }
% \fi

% borrowed from nenuthesis
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{{\normalfont\sffamily 定理}}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注释}[chapter]
\newtheorem{problem}{问题}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
\newenvironment{proof}[1][证明]{\noindent\textbf{#1.} }{\ \rule{0.5em}{0.5em}}

\RequirePackage[shortlabels]{enumitem}
\setenumerate[1]{1),fullwidth,itemindent=\parindent,listparindent=\parindent,itemsep=0.05\baselineskip,partopsep=0pt,parsep=0ex,topsep=0.1\baselineskip}
\setenumerate[2]{\qquad(1),itemindent=\parindent,listparindent=\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex,topsep=0\baselineskip}

%\makeatletter
%\renewcommand{\l@chapter}{\@dottedtocline{1}{0em}{1.5em}}
%\makeatother

\titlecontents{chapter}[0em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{section}[1em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}
\titlecontents{subsection}[2em]{}{\thecontentslabel\quad}{}{\dotfill\contentspage[{\makebox[0pt][r]{\thecontentspage}}]}