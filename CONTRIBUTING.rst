============
Contributing
============
Making the project useful to others and keeping it up to date can be
a lot of work so contributions are welcome and appreciated. Every
contribution matters, whether it's large or small.

Report Bugs
-----------
Report bugs at https://github.com/StuartMacKay/djangp-app-template/issues

The hardest part is always recreating a problem so please include:

* Which operating system you are using.
* Which version of python you are using.
* Detailed steps to reproduce the bug.
* Include any snippets of code that trigger the bug.

Fix Bugs
--------
Look through the GitHub issues for bugs. Anything tagged with "bug"
is open to whoever wants to implement it.

Implement Features
------------------
Look through the GitHub issues for features. Anything tagged with "feature"
is open to whoever wants to implement it.

Write Documentation
-------------------
This project provides the tooling for packaging and deploying a reusable
Django app, so the scope is well-defined. Apart from describing how to use
Docker or increment version numbers using bump-my-version there is little
to be added by way of documentation. Having said that, if there is anything
that is not clear and would benefit from s short guide then please contribute.

Submit Feedback
---------------
Opinions or insights on how useful the template has been, or not, is greatly
appreciated. The best way to send feedback is to file an issue at
https://github.com/StuartMacKay/django-app-template/issues, that way
it allows anyone else, who has a similar, or different experience, to contribute.
This is very valuable, particularly if there is something that is not working
as expected or hoped.

If there is a feature you want to see, then the more detailed your description
is, the better:

* Explain in detail how it would work
* Keep the scope as narrow as possible
* Remember time is always a scarce resource, so not everything is possible

Keeping the scope narrow or focussed is particularly important. Smaller pieces
are easier to implement and that initial experience influences what comes next.

Get Started!
------------
Ready to contribute?

1. Fork the `django-app-template`_ repository on GitHub.

2. Clone your fork locally::

    git clone git@github.com:<your_name>/django-app-template.git

3. Create and activate the virtual environment::

    python3 -m venv .venv
    pip3 install --upgrade pip setuptools wheel
    pip3 install pip-tools

   Now you can activate it using::

    source .venv/bin/activate

4. Install the requirements::

    pip -r requirements/dev.txt

5. Create a branch for local development::

    git checkout -b <name-of-your-bugfix-or-feature>

   Now you can make your changes locally.

5. To check everything works as expected run the tests::

    pytest

6. When you're done making changes run all the tests with tox::

    tox

7. Commit your changes and push your branch to GitHub::

    git add .
    git commit
    git push origin <name-of-your-bugfix-or-feature>

8. Submit a pull request through the GitHub website.

Pull Request Guidelines
-----------------------
Before you submit a pull request, check that it meets these guidelines:

1. The pull request should include tests, where possible. Not everything related
   to project tooling is easily testable.

2. If the pull request adds functionality, the docs should be updated. If you
   can add a HowTo and Code Snippets for your change/feature, even better.

3. Make sure you add an entry to ``CHANGELOG.rst`` about the changes.
Use the imperative style, see the existing entries to see how that is written.

If in doubt, ask.

.. _django-app-template: https://github.com/StuartMacKay/django-app-template/
