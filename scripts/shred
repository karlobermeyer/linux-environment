#!/usr/bin/env python

'''
Shred blank hard drive.
'''

#from pprint import pprint
import time
import numpy as np

i = 0
#i_max = 2
i_max = np.inf
n = 200000000 # default => ~1.5 Gb / file
#n = 200
t = time.time(); t_string = str(t)
x = np.random.random((n, 1))

while n > 32 and i < i_max:

    print '\ni =', i
    #print 'n =', n
    filename = 'x' + str(i) + '.' + t_string + '.npy'

    try:
        np.save(filename, x[0:n])
        #print '\nx ='; print x[0:n]
        #
        #y = np.load(filename)
        #print '\ny ='; print y
    except:
        n /= 2
        i += 1
