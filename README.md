# Bash Scripting Homework <!-- omit in toc -->

> **CSE3033 – Operating Systems**
> Marmara University · Department of Computer Engineering

A collection of five independent Bash scripts tackling common filesystem and text‑processing problems. They were developed as **Programming Assignment #1 (Spring 2024)** for the Operating Systems course.

---

## Table of Contents

1. [Project Structure](#project-structure)
2. [Scripts & Usage](#scripts--usage)

   * [1 · Cipher Script `myprog1.sh`](#1--cipher-script-myprog1sh)
   * [2 · Random Story Generator `myprog2.sh`](#2--random-story-generator-myprog2sh)
   * [3 · Writable File Sorter `myprog3.sh`](#3--writable-file-sorter-myprog3sh)
   * [4 · Prime‑to‑Hex Converter `myprog4.sh`](#4--prime-to-hex-converter-myprog4sh)
   * [5 · Wildcard File Deletion `myprog5.sh`](#5--wildcard-file-deletion-myprog5sh)

---

## Project Structure

```
.
├── myprog1.sh         # Cipher Script (15 pts)
├── myprog2.sh         # Random Story Generator (25 pts)
├── myprog3.sh         # Writable File Sorter (20 pts)
├── myprog4.sh         # Prime‑to‑Hex Converter (15 pts)
├── myprog5.sh         # Wildcard File Deletion (25 pts)
├── giris.txt          # ↳ input files for myprog2.sh
├── gelisme.txt        # ↳
├── sonuc.txt          # ↳
└── README.md          # this document
```

## Scripts & Usage

### 1 · Cipher Script `myprog1.sh`

Shift each character of a **lowercase** input string by the corresponding digit(s).

```bash
./myprog1.sh <string> <digits>
```

*If `<digits>` has length 1, the same shift applies to every character.*

```bash
$ ./myprog1.sh apple 12345
brspj
$ ./myprog1.sh zoo 8
hww
```

---

### 2 · Random Story Generator `myprog2.sh`

Randomly picks **one** line from each of `giris.txt`, `gelisme.txt`, `sonuc.txt` (in that order) and concatenates them into an output file.

```bash
./myprog2.sh <outputFile>
```

If `<outputFile>` already exists you’ll be prompted before overwriting.

---

### 3 · Writable File Sorter `myprog3.sh`

Moves every **regular file** with owner‑write permission into a `writable/` directory created in the current working directory.

```bash
./myprog3.sh
```

Sample run:

```bash
$ ./myprog3.sh
7 files moved to writable directory.
```

---

### 4 · Prime‑to‑Hex Converter `myprog4.sh`

For all prime numbers *p* < *N*, print *p* alongside its hexadecimal representation.

```bash
./myprog4.sh <N>
```

Example:

```bash
$ ./myprog4.sh 30
Hexadecimal of 2  is 2
Hexadecimal of 3  is 3
Hexadecimal of 5  is 5
⋮
Hexadecimal of 29 is 1D
```

---

### 5 · Wildcard File Deletion `myprog5.sh`

A safer, interactive alternative to `rm` supporting glob patterns and optional recursive search.

```bash
./myprog5.sh <wildcard> [dir]
```

* If `dir` is omitted, the current directory is scanned (non‑recursive).
* If `dir` is provided, the search is **recursive** through that directory tree.

```bash
$ ./myprog5.sh s*
Do you want to delete song‑of‑hiawatha.txt? (y/n): y
1 file deleted

$ ./myprog5.sh s* .
Do you want to delete shakespeare/shakespeare.txt? (y/n): y
1 file deleted
```

---

