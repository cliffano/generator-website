# AGENTS.md

This repository contains a DocoSite website project following a unified
standard for tooling, build automation, and coding conventions. All projects
share the same conventions to keep sites consistent and maintainable.

The key components of the standard include:

- Build automation (Doco)
- Markdown-based documentation content
- Documentation linting (markdownlint/mdl)
- Configuration via `doco.yml`

This document outlines the common conventions that apply across the DocoSite
website projects.

## Runtime & Dependencies

- **Python Version**: 3 (via `venv`)
- **Dependency Manager**: pip (`requirements.txt` / `requirements-dev.txt`)
- **Configuration Tooling**: yq

### Adding Dependencies

```bash
echo "package_name" >> requirements.in   # Add runtime dependency
make deps-upgrade                        # Recompile and install dependencies
make deps                                # Install dependencies
```

## Project Structure

```text
project/
├── docs/                    # Markdown documentation pages
├── images/                  # Site image assets
├── .github/                 # GitHub workflows
├── doco.yml                 # Doco project configuration
├── Makefile                 # Build automation (Doco)
└── README.md                # Project README
```

## Build Automation (Doco)

This project uses **Doco** as its standard build automation tool for DocoSite
website projects.

### Common Commands

```bash
make ci                 # Run deps + lint
make all                # Alias for ci
make clean              # Remove staged/generated files
make deps               # Set up the Python venv and install dependencies
make deps-upgrade       # Upgrade dependencies and recompile requirements
make lint               # Run Markdown lint checks
```

### Update Targets

```bash
make update-to-latest   # Update Makefile to latest Doco release
make update-to-main     # Update Makefile to Doco main branch
make update-to-version  # Update Makefile to a specific Doco version
make update-dotfiles    # Refresh project dotfiles from generator-website
```

## Development Environment

This project is designed to be developed in a consistent environment via Docker
image `cliffano/studio`.

You can run the container using: `docker run --rm --workdir /opt/workspace -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/opt/workspace -i -t cliffano/studio` and then run the build commands inside the container.

## Code Style and Linting

- Markdown documentation pages are validated via `make lint`
- Workflow and config changes should stay deterministic and minimal

### DocoSite Code Guidelines

Applies to: `.github/workflows/**/*.yml`, `.github/workflows/**/*.yaml`, `docs/**/*.md`, `doco.yml`, `README.md`, `CHANGELOG.md`

#### Style & Formatting

##### Workflow and Build Config

All workflow and build configuration changes should stay explicit, readable, and
reproducible.

Guidelines:

- Use two-space indentation in YAML files
- Keep workflow/job/step names descriptive
- Avoid compact one-liners that hide intent in CI definitions
- Keep shell snippets readable and fail fast

##### Documentation Pages

Guidelines:

- Use descriptive headings and short, direct paragraphs
- Keep examples copy-paste friendly
- Keep link text meaningful and avoid ambiguous references

#### Site Structure Conventions

- Keep documentation pages in `docs/`
- Keep image assets in `images/`
- Keep configuration values in `doco.yml`

#### Validation

- Treat lint failures as build failures
- Run `make lint` before merging documentation changes
- Keep workflow changes aligned with Makefile targets

## Testing

- This project emphasizes deterministic lint checks rather than unit test suites
- Run validation with `make ci`

### Testing Guidelines

Applies to: `.github/workflows/**/*.yml`, `.github/workflows/**/*.yaml`

#### Validation Strategy

This project currently relies on deterministic validation via Markdown lint
checks rather than dedicated unit test suites.

Primary validation command:

```bash
make ci
```

#### What to Validate

- Markdown documentation lint passes (`make lint`)
- Dependency installation succeeds (`make deps`)
- Workflow execution consistency for CI flows

#### Workflow Test Practices

- Keep CI steps deterministic and idempotent
- Avoid network-dependent checks unless required by dependency resolution
- Fail fast on missing configuration values

#### Regression Prevention

When changing documentation content or build behavior:

1. Run `make lint`
2. Run `make ci`
3. Verify documentation output changes are intentional
