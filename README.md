![Avatar](avatar.jpg)

[![Build Status](https://github.com/cliffano/generator-website/workflows/CI/badge.svg)](https://github.com/cliffano/generator-website/actions?query=workflow%3ACI)
[![Code Scanning Status](https://github.com/cliffano/generator-website/workflows/CodeQL/badge.svg)](https://github.com/cliffano/generator-website/actions?query=workflow%3ACodeQL)
[![Security Status](https://snyk.io/test/github/cliffano/generator-website/badge.svg)](https://snyk.io/test/github/cliffano/generator-website)

# Generator Website

Generator Website is Code Generator for micro websites.

It provides the following components:

| Component | Description |
|-----------|-------------|
| gh-pages | Generate a GH-Pages website |
| markdown | Generate a Markdown website |

## Usage

Generate GH Pages website:

    make generate-gh-pages

Generate Markdown website:

    make generate-markdown

Both components will prompt you the following inputs:

| Prompt | Description |
|--------|-------------|
| Project ID | Used for website name. |
| Project Name | Used in documentation or comments. |
| Project Description | Used in documentation or comments. |
| Author Name | The name of the project author. |
| Author Email | The email of the project author. |
| Author URL | The author's website URL. |
| GitHub ID | The GitHub ID of the project repo. |
| GitHub Repo | The GitHub repo name. |

## Colophon

Related Projects:

* [Doco](https://github.com/cliffano/doco) - Makefile for building Markdown website
* [PageMaker](https://github.com/cliffano/pagemaker) - Makefile for building GH Pages website