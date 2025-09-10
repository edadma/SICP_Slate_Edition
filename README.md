# SICP: Slate Edition

An adaptation of the classic **Structure and Interpretation of Computer Programs** (SICP) for the [Slate programming language](https://github.com/your-slate-repo).

## Overview

This project adapts Harold Abelson, Gerald Jay Sussman, and Julie Sussman's seminal computer science textbook from Scheme/Lisp to Slate, a modern expression-oriented programming language. While preserving the original's pedagogical approach and fundamental concepts, this adaptation leverages Slate's unique features including significant whitespace, prototype-based objects, and arrow function syntax.

## Current Status

**Chapter 1: Building Abstractions with Procedures** ✅ Complete
- Programming in Slate introduction
- 1.1 The Elements of Programming
- 1.2 Procedures and the Processes They Generate  
- 1.3 Formulating Abstractions with Higher-Order Procedures

**Future Chapters** (Planned)
- Chapter 2: Building Abstractions with Data
- Chapter 3: Modularity, Objects, and State
- Chapter 4: Metalinguistic Abstraction
- Chapter 5: Computing with Register Machines

## Key Adaptations

### Syntax Transformations
- **Function definitions**: `(define (name params) body)` → `def name(params) = body`
- **Anonymous functions**: `(lambda (x) body)` → `x -> body`
- **Arithmetic**: `(+ a b)` → `a + b` (infix notation)
- **Local bindings**: `(let ((x val)) body)` → `let x = val in body`

### Language Features
- **Expression-oriented**: Like Scheme, most constructs return values
- **First-class functions**: Functions as values with closures
- **Dynamic typing**: Runtime type system similar to Scheme
- **Significant whitespace**: Python-like indentation for blocks

### Example Transformation
```scheme
;; Original Scheme
(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))
```

```slate
\ Slate adaptation
def factorial(n) =
    if n == 0 then 1 else n * factorial(n - 1)
```

## Building the Book

### Requirements
- LaTeX distribution (TeX Live recommended)
- pdflatex
- Required LaTeX packages: listings, xcolor, geometry, fancyhdr, amsmath, tikz

### Compilation
```bash
# Generate complete book
pdflatex SICP-Slate-Book.tex
pdflatex SICP-Slate-Book.tex  # Run twice for complete table of contents

# Preview individual sections
./preview-section.sh section-1-1
./preview-section.sh section-1-2  
./preview-section.sh section-1-3
```

## Project Structure

```
├── SICP-Slate-Book.tex           # Main document
├── sections/                     
│   ├── programming-in-slate.tex   # Slate language introduction
│   ├── section-1-1.tex           # The Elements of Programming
│   ├── section-1-2.tex           # Procedures and Processes
│   └── section-1-3.tex           # Higher-Order Procedures
├── preview-section.sh             # Individual section compilation
├── LICENSE                       # CC BY-SA 4.0 license
└── README.md                     # This file
```

### Translation Principles
1. **Preserve core concepts**: Abstraction, recursion, higher-order functions
2. **Adapt syntax naturally**: Use Slate's expression-oriented features  
3. **Maintain pedagogical flow**: Keep the same teaching progression
4. **Leverage Slate features**: Introduce ranges, pattern matching appropriately

## License

This work is based on *Structure and Interpretation of Computer Programs* (Second Edition) by Harold Abelson, Gerald Jay Sussman, and Julie Sussman, published by MIT Press. The original work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.

This Slate Edition adaptation is also licensed under the [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).

**Original Authors**: Harold Abelson, Gerald Jay Sussman, and Julie Sussman  
**Original Publisher**: MIT Press  
**Adaptation**: Slate Edition Team

## Acknowledgments

- **MIT Press** for releasing SICP under Creative Commons
- **Harold Abelson, Gerald Jay Sussman, and Julie Sussman** for the original masterwork
- **The Slate language community** for developing an excellent language for teaching programming concepts

## Download

The latest compiled PDF is available in the [Releases](../../releases) section.

For the most current version, clone this repository and compile from source using the instructions above.
