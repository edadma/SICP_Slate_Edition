#!/bin/bash

# Script to preview individual sections of SICP Slate Edition
# Usage: ./preview-section.sh [section-name]
# Available sections: programming-in-slate, section-1-1, section-1-2

SECTION=${1:-section-1-1}
PREVIEW_FILE="section-preview.tex"
OUTPUT_FILE="section-preview"

echo "Previewing section: $SECTION"

# Create temporary preview file with the specified section
cat > "$PREVIEW_FILE" << 'EOF'
\documentclass[11pt]{book}
\usepackage[utf8]{inputenc}
\usepackage[english]{babel}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{listings}
\usepackage{xcolor}
\usepackage{geometry}
\usepackage{fancyhdr}
\usepackage{graphicx}
\usepackage{tikz}
\usepackage{enumitem}

% Geometry settings
\geometry{margin=1in, headheight=14pt}

% Code listing style for Slate
\lstdefinestyle{slate}{
    basicstyle=\ttfamily\small,
    keywordstyle=\color{blue}\bfseries,
    keywordstyle=[2]\color{purple}\bfseries,
    keywordstyle=[3]\color{teal}\bfseries,
    keywordstyle=[4]\color{orange!80!black},
    keywordstyle=[5]\color{violet}\bfseries,
    commentstyle=\color{gray}\itshape,
    stringstyle=\color{red},
    numberstyle=\tiny\color{gray},
    identifierstyle=\color{black},
    breaklines=true,
    breakatwhitespace=true,
    tabsize=4,
    showspaces=false,
    showstringspaces=false,
    frame=single,
    rulecolor=\color{black!30},
    backgroundcolor=\color{gray!5},
    keywords={def, val, var, if, then, else, elif, end, and, or, not, match, case, default, while, do, for, loop, break, continue, return, import, package},
    keywords=[2]{true, false, null, undefined, NaN, Infinity},
    keywords=[3]{print, abs, sqrt, floor, ceil, sin, cos, tan, exp, ln, max, min, type, input, random},
    literate={//}{{{\color{orange!80!black}//}}}2
             {**}{{{\color{orange!80!black}**}}}2
             {==}{{{\color{orange!80!black}==}}}2
             {!=}{{{\color{orange!80!black}!=}}}2
             {<=}{{{\color{orange!80!black}<=}}}2
             {>=}{{{\color{orange!80!black}>=}}}2
             {+=}{{{\color{orange!80!black}+=}}}2
             {-=}{{{\color{orange!80!black}-=}}}2
             {*=}{{{\color{orange!80!black}*=}}}2
             {/=}{{{\color{orange!80!black}/=}}}2
             {&&}{{{\color{orange!80!black}\&\&}}}2
             {||}{{{\color{orange!80!black}||{}}}}2,
    otherkeywords={+, -, *, /, \%, <, >, =, !},
    morekeywords=[4]{+, -, *, /, \%, <, >, =, !},
    keywords=[5]{Array, String, Buffer, Object, Date, Duration, Period}
}

% Define Slate keywords
\lstset{
    morekeywords={def, val, var, if, then, else, elif, end, and, or, not, true, false, null, undefined, match, case, default},
    morecomment=[l]{\\}
}

\lstset{style=slate}

% Define a command for inline Slate code
\newcommand{\slate}[1]{\lstinline[basicstyle=\ttfamily,mathescape=true]{#1}}

% Plain style for syntax templates (no highlighting)
\lstdefinestyle{plain}{
    basicstyle=\ttfamily\small,
    frame=single,
    rulecolor=\color{black!30},
    backgroundcolor=\color{gray!5},
    breaklines=true,
    showspaces=false,
    showstringspaces=false,
    language={},
    keywordstyle={},
    commentstyle={},
    stringstyle={},
    identifierstyle={},
    keywords={},
    mathescape=true
}

% Page style
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[LO]{\nouppercase{\rightmark}}
\fancyhead[RE]{\nouppercase{\leftmark}}

\title{SICP Slate Edition - Section Preview}
\author{Previewing: SECTION_NAME}
\date{\today}

\begin{document}

\maketitle

\input{sections/SECTION_NAME}

\end{document}
EOF

# Replace SECTION_NAME with the actual section
sed -i "s/SECTION_NAME/$SECTION/g" "$PREVIEW_FILE"

# Compile the document
echo "Compiling $PREVIEW_FILE..."
pdflatex "$PREVIEW_FILE"
pdflatex "$PREVIEW_FILE"  # Run twice for cross-references

if [ -f "$OUTPUT_FILE.pdf" ]; then
    echo "Success! Generated $OUTPUT_FILE.pdf"
    echo "You can view it with: xdg-open $OUTPUT_FILE.pdf"
else
    echo "Compilation failed. Check the log for errors."
fi

# Clean up auxiliary files
rm -f "$OUTPUT_FILE.aux" "$OUTPUT_FILE.log" "$OUTPUT_FILE.toc" "$OUTPUT_FILE.out"