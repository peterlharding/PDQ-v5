#
#  $Id: Makefile,v 4.3 2009/04/03 02:19:41 pfeller Exp $
#
#---------------------------------------------------------------------

all:	test

#---------------------------------------------------------------------

burncpu:	burncpu.c

test:	burncpu
	./arrivals.pl
	# ./bench1.pl
	# ./bench2.pl
	./erlang.pl
	./genexp.pl
	# ./getHTML.pl
	# ./getload.pl
	./kstest.pl
	./passcalc.pl
	./residence.pl
	./servdemand.pl
	./servtime.pl
	./thruput1.pl
	./timely.pl
	./timeshare.pl
	./timetz.pl
	./timrez.pl
	./utiliz1.pl

interactive:
	./mva.pl
	./mvaapprox.pl
	./repair.pl

#---------------------------------------------------------------------

clean:
	-rm *.res

#---------------------------------------------------------------------
