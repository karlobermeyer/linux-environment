#!/usr/bin/env python

"""Rename all files in current directory so that

Spaces become underscores
The character ' is deleted
All letters are lower case
"""

# Standard
import os
#import sys
#from __future__ import print_function
#import copy
#import time
# start_time = time.time()
# . . .
# print 'Elapsed time =', time.time() - start_time, 's'
from pprint import pprint


def main():

    # Load all file names in current directory
    #filenames = ['Some rubb\'ish.m4a']
    filenames = os.listdir('./')

    for filename_old in filenames:
        if os.path.isfile(filename_old):

            filename_new = filename_old.replace(' ', '_')
            filename_new = filename_new.replace('\'', '')
            filename_new = filename_new.lower()

            if False:
                print 'filename_old =', filename_old
                print 'filename_new =', filename_new

            os.rename(filename_old, filename_new)


if __name__ == "__main__":
    main()
