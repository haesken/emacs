#!/usr/bin/env python

from os import path
import os
import subprocess
import sys

try:
    from clint.textui import colored
    clint_avail = True
except ImportError:
    clint_avail = False


def run_in_shell(commands):
    """ Run a list of commands.
    """

    if type(commands) == str:
        subprocess.call(commands, shell=True)
    elif type(commands) == list:
        for item in commands:
            subprocess.call(item, shell=True)
    else:
        raise TypeError("Param should be a string or a list of strings!")


def colored_if_avail(text, color):
    """ If clint is available, color text.
    """

    if clint_avail:
        if color == "yellow":
            return colored.yellow(text)
        if color == "red":
            return colored.red(text)
    else:
        return text


def ensure_link(target, link_name):
    """ Interactive function to create a symbolic link
        Asks for confirmation if a link/directory is already present
    """

    # No link/file
    if not path.exists(target):
        os.symlink(target, link_name)

    # Symbolic link
    elif path.islink(target):
        print(colored_if_avail(
            "{target} IS A SYMLINK THAT POINTS TO {loc}, OVERWRITE?".format(
                    target=target, loc=os.readlink(target)), "red"))

        if str(raw_input(
                colored_if_avail("y/n", "red"))).lower().startswith("y"):
            os.symlink(target, link_name)

    # Empty dir
    elif path.isdir(target) and not os.listdir(target):
        print(colored_if_avail(
            "{target} IS AN EMPTY DIRECTORY, OVERWRITE?".format(
                    target=target), "red"))

        if str(raw_input(
                colored_if_avail("y/n", "red"))).lower().startswith("y"):
            os.rmdir(target)
            os.symlink(target, link_name)

    # Dir with contents
    elif path.isdir(target) and os.listdir(target):
        print(colored_if_avail(
            "{target} IS A DIRECTORY, REMOVE?".format(target=target),
                    "red"))

        if str(raw_input(
                colored_if_avail("y/n", "red"))).lower().startswith("y"):
            os.rmdir(target)
            os.symlink(target, link_name)


def main():
    emacs_dir = path.dirname(path.realpath(__file__))
    os.chdir(emacs_dir)

    # Clone Submodules
    # run_in_shell("git submodule update --init --recursive")
    # run_in_shell("git submodule foreach git checkout master")

    # ubuntu packages
    # git curl python-setuptools xsel python pip python-virtualenv
    # build-essential libgtk-3-dev libgif-dev libxpm-dev texinfo libtiff4-dev emacs

    # pip packages
    # virtualenv

    # If the emacs directory is not a sub directory of "dotfiles",
    # assume the emacs directory is in ~, and create symlinks to
    # the emacs folder. (for standalone installations)
    if not path.basename(path.dirname(emacs_dir)) == "dotfiles":
        print(colored_if_avail("Creating symlinks...", "yellow"))
        ensure_link(emacs_dir, path.join(path.abspath("~"), ".emacs.d"))


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        sys.exit()
