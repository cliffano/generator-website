<!-- BEGIN:AVATAR -->
![Avatar](avatar.jpg)
<!-- END:AVATAR -->

<!-- BEGIN:BADGES -->
[![Build Status](https://github.com/cliffano/generator-website/workflows/CI/badge.svg)](https://github.com/cliffano/generator-website/actions?query=workflow%3ACI)
[![Code Scanning Status](https://github.com/cliffano/generator-website/workflows/CodeQL/badge.svg)](https://github.com/cliffano/generator-website/actions?query=workflow%3ACodeQL)
[![Security Status](https://snyk.io/test/github/cliffano/generator-website/badge.svg)](https://snyk.io/test/github/cliffano/generator-website)
<!-- END:BADGES -->

# Generator Website

Generator Website is Code Generator for micro websites.

It provides the following components:

| Component | Description |
|-----------|-------------|
| project-site | Generate a ProjectSite website |
| doco-site | Generate a DocoSite website |

## Usage

Generate ProjectSite website:

```shell
make generate-project-site
```

Generate DocoSite website:

```shell
make generate-doco-site
```

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

<!-- BEGIN:DEVELOPERS_GUIDE -->
[Developer's Guide](https://cliffano.github.io/developers-guide-makefile.html)
<!-- END:DEVELOPERS_GUIDE -->

<!-- BEGIN:BUILD_REPORTS -->
Build reports:

<!-- END:BUILD_REPORTS -->

Related Projects:

* [Doco](https://github.com/cliffano/doco) - Makefile for building DocoSite website
* [PageMaker](https://github.com/cliffano/pagemaker) - Makefile for building ProjectSite website