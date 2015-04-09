#!/usr/bin/env python
# encoding: utf-8

""" build.py - Build emacs

Usage:
    build.py -h | --help
    build.py [options]...

Options:
    -h --help         Show this screen.
    -r --remove       Remove (purge) emacs
    -d --depends      Install depends for emacs & checkinstall
    -g --get          Download emacs source
    -u --update       Update emacs source
    -c --configure    Configure emacs
    -b --build        Build & install emacs with checkinstall
    -p --pin          Pin the emacs package to the one we installed.
    -a --all          All

"""

from docopt import docopt
from os import path, chdir, mkdir
import subprocess
import sys

try:
    from clint.textui import colored
    clint_avail = True
except ImportError:
    clint_avail = False


def run_in_shell(commands):
    """ Run a list of commands. """

    if type(commands) == str:
        subprocess.call(commands, shell=True)
    elif type(commands) == list:
        for item in commands:
            subprocess.call(item, shell=True)
    else:
        raise TypeError("Param should be a string or a list of strings!")


def colored_if_avail(text, color):
    """ If clint is available, color text. """
    if clint_avail:
        if color == "yellow":
            return colored.yellow(text)
        if color == "red":
            return colored.red(text)
    else:
        return text


class Manager(object):
    """ Manage emacs build/installation. """

    def __init__(self, build_dir, emacs_dir):
        """ Setup paths """

        self.emacs_dir = emacs_dir
        self.build_dir = build_dir

        if not path.exists(self.build_dir):
            mkdir(self.build_dir)
            print(colored_if_avail(
                "Made {dir}".format(dir=self.build_dir), "yellow"))

        run_in_shell("sudo apt-get update")

    def remove(self):
        chdir(self.emacs_dir)
        print(colored_if_avail("Purging old emacs...", "yellow"))
        run_in_shell("sudo apt-get -y remove emacs")
        run_in_shell("sudo apt-get -y remove emacs23")
        run_in_shell("sudo apt-get -y remove emacs24")
        run_in_shell("sudo apt-get -y autoremove")

        if path.exists(path.join(self.build_dir, "emacs")):
            chdir(path.join(self.build_dir, "emacs"))
            print(colored_if_avail("Cleaning old emacs...", "yellow"))
            run_in_shell("sudo make distclean")

    def depends(self):
        print(colored_if_avail("Installing emacs depends...", "yellow"))
        run_in_shell(["sudo apt-get build-dep emacs24"])
        run_in_shell(["sudo apt-get install libncurses5-dev"])

        print(colored_if_avail("Installing emacs build depends...", "yellow"))
        run_in_shell(["sudo apt-get install libevent-dev cmake checkinstall"])

    def get(self):
        if not path.exists(path.join(self.build_dir, "emacs")):
            chdir(self.build_dir)
            print(colored_if_avail(
                "emacs git repo not present, cloning...", "yellow"))
            run_in_shell("git clone --depth 1 git://git.savannah.gnu.org/emacs.git {dir}".format(
                    dir=path.abspath(path.join(self.build_dir, "emacs"))))

    def update(self):
        chdir(path.join(self.build_dir, "emacs"))
        if path.exists("configure"):
            print(colored_if_avail("Checking for git updates...", "yellow"))
            run_in_shell("git pull")

    def configure(self):
        chdir(path.join(self.build_dir, "emacs"))
        print(colored_if_avail("Running autoconf...", "yellow"))
        run_in_shell("autoconf")
        print(colored_if_avail("Running autogen.sh...", "yellow"))
        run_in_shell("sh autogen.sh")
        print(colored_if_avail("Running configure...", "yellow"))
        run_in_shell("sh configure")

    def build(self):
        chdir(path.join(self.build_dir, "emacs"))
        print(colored_if_avail("Building with checkinstall...", "yellow"))
        run_in_shell("sudo checkinstall --default")

    def pin(self):
        print(colored_if_avail("Pinning emacs package...", "yellow"))
        run_in_shell(["echo emacs hold | sudo dpkg --set-selections",
                      "dpkg --get-selections | grep emacs"])


def main(args):
    emacs_dir = path.dirname(path.realpath(__file__))
    build_dir = path.join(path.dirname(path.realpath(__file__)), "build")

    em = Manager(build_dir, emacs_dir)

    if args["--remove"] or args["--all"]:
        em.remove()

    if args["--depends"] or args["--all"]:
        em.depends()

    if args["--get"] or args["--all"]:
        em.get()

    if args["--update"] or args["--all"]:
        em.update()

    if args["--configure"] or args["--all"]:
        em.configure()

    if args["--build"] or args["--all"]:
        em.build()

    if args["--pin"] or args["--all"]:
        em.pin()


if __name__ == '__main__':
    try:
        main(docopt(__doc__))
    except KeyboardInterrupt:
        sys.exit()
