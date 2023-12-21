===================
Django App Template
===================
Half the battle to create a successful project is getting everything
organized. This is a Github template repository for a reusable Django
app that can be released on PyPi.

Features
--------
* Development with `black <https://github.com/psf/black>`_ so everybody gets the code formatting rules they deserve
* Development with `flake8 <https://flake8.pycqa.org/en/latest/>`_ so people using ed get syntax checking
* Development with `isort <https://pycqa.github.io/isort/>`_ for automatically sorting imports
* Development with `mypy <https://mypy-lang.org/>`_ for type-hinting to catch errors
* Testing with `pytest <https://docs.pytest.org/>`_ and `FactoryBoy: <https://factoryboy.readthedocs.io/en/stable/>`_
* Manage versions with `bump-my-version <https://github.com/callowayproject/bump-my-version>`_ - for semantic or calendar version numbers
* Manage dependencies with `pip-tools <https://github.com/jazzband/pip-tools>`_

Quick start
-----------
This is a GitHub template repository. Simply create a new repository from it
or open it in a Code Space. The repository will contain a single commit.

After you checkout your repository, the first step is to rename the app:

..  code-block:: shell

    ./bin/rename-app myapp

Next, build the virtualenv and install all the dependencies. This will also
build the library containing the app:

..  code-block:: shell

    python3 -m venv .venv
    source .venv/bin/activate
    pip install --upgrade pip setuptools wheel
    pip install pip-tools

Optional. The project is shipped with pinned versions for the dependencies.
If you want to upgrade to the latest versions then recompile the requirements
source files:

..  code-block:: shell

    pip-compile --upgrade requirements/dev.in
    pip-compile --upgrade requirements/docs.in
    pip-compile --upgrade requirements/tests.in

Install the dependencies:

..  code-block:: shell

    pip-sync requirements/dev.txt

Run the tests:

..  code-block:: shell

    pytest

Run the django server:

..  code-block:: shell

    ./manage.py runserver

Open a browser and visit http://localhost:8000 and, voila, we have a working
site. Well cover the deployment later.
