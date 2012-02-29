

require 'mkmf'

xsystem('swig -ruby -o pdq_wrap.c ../pdq.i')

$libs = "../lib/libpdq.a"

create_makefile('pdq')

