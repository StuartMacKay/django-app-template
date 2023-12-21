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
* Manage dependency upgrades with `pip-upgrader <https://github.com/simion/pip-upgrader>`_

Quick start
-----------
This is a GitHub template repository. Simply create a new repository from it
or open it in a Code Space. The repository will contain a single commit.

After you checkout your repository, the first step is to build the virtualenv
and install all the dependencies. This will also build the library:

..  code-block:: shell

    make install

Now run the demo site:

..  code-block:: shell

    make demo

Run the database migrations:

..  code-block:: shell

    ./manage.py migrate

Run the tests:

..  code-block:: shell

    make tests

Run the django server:

..  code-block:: shell

    ./manage.py runserver

Open a browser and visit http://localhost:8000 and, voila, we have a working
site. Well cover the deployment later.

Almost all steps used the project Makefile. That's great if you're running
Linux with GNU Make and not much fun if you're not. All is not lost, however.
All the Makefile's targets contain only one or two commands, so even if you
are running Windows you should still be able to get the site running without
too much effort.
