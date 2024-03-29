#
# Makefile: Commands to simplify development and releases
#
# Usage:
#
#    make clean
#    make checks
#    make tests
#    make patch build upload
#    make minor build upload
#    make major build upload

# This Makefile only works with GNU Make.

PYTHON = python3.12

# Where everything lives
site_python := /usr/bin/env $(PYTHON)

root_dir := $(realpath .)
src_dir = $(root_dir)/src/app_project

venv_name = venv
venv_dir = $(root_dir)/$(venv_name)
python = $(venv_dir)/bin/python

pip = $(python) -m pip
pip-compile = $(venv_dir)/bin/pip-compile
pip-sync = $(venv_dir)/bin/pip-sync
django = $(python) $(root_dir)/manage.py
flake8 = $(python) -m flake8
black = $(python) -m black
isort = $(python) -m isort
mypy = $(python) -m mypy
pytest = $(python) -m pytest
coverage = $(python) -m coverage
bumpversion = $(venv_dir)/bin/bump2version
tox = $(venv_dir)/bin/tox
twine = $(venv_dir)/bin/twine

# include additional targets or override variables from local makefiles
-include *.mk

.PHONY: help
help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo
	@echo "  help                 to show this list"
	@echo
	@echo "  clean-build          to clean the files and directories generated by previous builds"
	@echo "  clean-coverage       to clean the test coverage data and reports"
	@echo "  clean-mypy           to clean the directory generated by mypy"
	@echo "  clean-docs           to clean the generated HTML documentation"
	@echo "  clean-tests          to clean the directories created during testing"
	@echo "  clean-venv           to clean the virtualenv"
	@echo "  clean                to clean everything EXCEPT the virtualenv"
	@echo
	@echo "  venv                 to create the virtualenv"
	@echo "  install              to install the project dependencies in the virtualenv"
	@echo
	@echo "  checks               to run code quality checks"
	@echo "  coverage             to measure the test coverage"
	@echo "  tests                to run the tests"
	@echo "  tox                  to run the tests for all the supported environments"
	@echo
	@echo "  build                to build the package"
	@echo "  docs                 to build the HTML documentation"
	@echo
	@echo "  major                to update the version number for a major release, e.g. 2.1 to 3.0"
	@echo "  minor                to update the version number for a minor release, e.g. 2.1 to 2.2"
	@echo "  patch                to update the version number for a patch release, e.g. 2.1.1 to 2.1.2"
	@echo "  upload               to upload a release to PyPI repository"
	@echo

# #########
#   Clean
# #########
#
# Delete all the runtime files generated by the various targets,
# including the virtualenv.

.PHONY: clean-venv
clean-venv:
	rm -rf $(venv_dir)

.PHONY: clean-build
clean-build:
	rm -rf build
	rm -rf src/*.egg-info

.PHONY: clean-docs
clean-docs:
	cd docs && make clean

.PHONY: clean-tests
clean-tests:
	rm -rf .tox
	rm -rf .pytest_cache

.PHONY: clean-mypy
clean-mypy:
	rm -rf .mypy_cache

.PHONY: clean-coverage
clean-coverage:
	rm -rf .coverage
	rm -rf coverage

.PHONY: clean
clean: clean-build clean-coverage clean-docs clean-mypy clean-tests

# ##############
#   Virtualenv
# ##############
#
# Create the virtualenv and install all the dependencies for development.
# If the virtualenv already exists then synchronise the installed packages
# with those listed in requirements/dev.txt. The list of packages will be
# updated if any of the input files change.

$(venv_dir):
	$(site_python) -m venv $(venv_dir)
	$(pip) install --upgrade pip setuptools wheel
	$(pip) install pip-tools

requirements/demo.txt: requirements/demo.in
	$(pip-compile) requirements/demo.in

requirements/development.txt: requirements/development.in requirements/docs.in requirements/demo.in
	$(pip-compile) requirements/development.in

requirements/docs.txt: requirements/docs.in
	$(pip-compile) requirements/docs.in

requirements/test.txt: requirements/test.in requirements/demo.in
	$(pip-compile) requirements/test.in

.PHONY: requirements
requirements: requirements/demo.txt requirements/development.txt requirements/docs.txt requirements/test.txt

.PHONY: venv
venv: $(venv_dir) requirements
	$(pip-sync) requirements/development.txt

# ##########
#   Checks
# ##########

.PHONY: flake8
flake8:
	$(flake8) $(src_dir)

.PHONY: isort
isort:
	$(isort) --check $(src_dir)

.PHONY: black
black:
	$(black) --check $(src_dir)

.PHONY: mypy
mypy:
	$(mypy) $(src_dir)

.PHONY: checks
checks: flake8 black isort mypy

# #########
#   Tests
# #########

.PHONY: coverage
coverage:
	$(pytest) --cov-config=setup.cfg --cov=$(src_dir) --cov-report html

.PHONY: tests
tests:
	$(pytest)

.PHONY: tox
tox: test
	$(tox)
	$(tox) -e docs

# ########
#   Docs
# ########

.PHONY: docs
docs:
	cd docs && make html

# ###########
#   Release
# ###########

.PHONY: build
build: clean-build
	$(python) setup.py sdist bdist_wheel

.PHONY: major
major:
	$(bumpversion) major

.PHONY: minor
minor:
	$(bumpversion) minor

.PHONY: patch
patch:
	$(bumpversion) patch

.PHONY: upload
upload:
	$(twine) upload --skip-existing dist/*
