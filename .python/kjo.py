
from pprint import pprint
from os import system
from pydoc import help as pdbh


def pdir(arg):
    """Pretty print version of dir."""
    pprint( dir(arg) )


def clear():
    """Call unix terminal clear."""
    system('clear')
