
I have been playing with Ruby so I thought that I would have a go at this:

    #!/usr/bin/env ruby
    #---------------------------------------------------------------------

    require 'pdq'

    #---- Define globals -------------------------------------------------

    arrivRate    = 0.75
    service_time = 1.0

    #---- Initialize -----------------------------------------------------

    Pdq.Init("OpenCenter")
    Pdq.SetComment("A simple M/M/1 queue")

    #---- Define the workload and circuit type ---------------------------

    Pdq.streams = Pdq.CreateOpen("work", arrivRate)

    Pdq.SetWUnit("Customers")
    Pdq.SetTUnit("Seconds")

    #---- Define the queueing center -------------------------------------

    Pdq.nodes = Pdq.CreateNode("server", Pdq::CEN, Pdq::FCFS)

    #---- Define service demand due to workload on the queueing center ---

    Pdq.SetDemand("server", "work", service_time)

    #---- Solve the model ------------------------------------------------
    #  Must use the CANONical method for an open circuit

    Pdq.Solve(Pdq::CANON)

    #---- Generate a report ----------------------------------------------

    Pdq.Report()

    #---------------------------------------------------------------------

    comment = Pdq.GetComment()

    puts 'Pdq.GetComment -> "%s"' % comment

    #---------------------------------------------------------------------

...gives...

    $ ./test.rb
                    ***************************************
                    ****** Pretty Damn Quick REPORT *******
                    ***************************************
                    ***  of : Sun Mar 21 19:13:06 2010  ***
                    ***  for: OpenCenter                ***
                    ***  Ver: PDQ Analyzer v5.0 071209  ***
                    ***************************************
                    ***************************************

    COMMENT: A simple M/M/1 queue

                    =======================================
                    ******    PDQ Model INPUTS      *******
                    =======================================

    Node Sched Resource   Workload   Class     Demand
    ---- ----- --------   --------   -----     ------
    CEN  FCFS  server     work       TRANS     1.0000

    Queueing Circuit Totals:
            Streams:      1
            Nodes:        1

    WORKLOAD Parameters:
    Source        per Customers        Demand
    ------        -------        ------
    work           0.7500        1.0000


                    =======================================
                    ******   PDQ Model OUTPUTS      *******
                    =======================================

    Solution Method: CANON

                    ******   SYSTEM Performance     *******

    Metric                     Value    Unit
    ------                     -----    ----
    Workload: "work"
    Number in system          3.0000    Customers
    Mean throughput           0.7500    Customers/Seconds
    Response time             4.0000    Seconds
    Stretch factor            4.0000

    Bounds Analysis:
    Max throughput            1.0000    Customers/Seconds
    Min response              1.0000    Seconds


                    ******   RESOURCE Performance   *******

    Metric          Resource     Work              Value   Unit
    ------          --------     ----              -----   ----
    Throughput      server       work             0.7500   Customers/Seconds
    Utilization     server       work            75.0000   Percent
    Queue length    server       work             3.0000   Customers
    Waiting line    server       work             2.2500   Customers
    Waiting time    server       work             3.0000   Seconds
    Residence time  server       work             4.0000   Seconds


    Pdq.GetComment -> "A simple M/M/1 queue"

Ruby convention is that a feature name (requires 'pdq') is lower case - and the corresponding class/module names (Pdq.xxx) are capitalized.

Also, constants are referred to as 'Pdq::CANON' - note use of '::'

To implement:

1)  Create ruby folder at top level
2)  Create file extconf.rb in this folder: (copy attached)

    $ cat extconf.rb

    require 'mkmf'

    xsystem('swig -ruby -o pdq_wrap.c ../pdq.i')

    $libs = "../lib/libpdq.a"

    create_makefile('pdq')

3) Invoke ruby extconf.rb in ruby directory.  Then 'make' and 'make install'

    $ ruby extconf.rb
    creating Makefile

    $ make
    gcc -I. -I/usr/lib/ruby/1.8/i386-cygwin -I/usr/lib/ruby/1.8/i386-cygwin -I.   -g -O2    -c pdq_wrap.c
    gcc -shared -s -o pdq.so pdq_wrap.o -L. -L/usr/lib -L.  -Wl,--enable-auto-image-base,--enable-auto-import,--export-all   -lruby ../lib/libpdq.a -ldl -lcrypt 

    $ make install
    /usr/bin/install -c -m 0755 pdq.so /usr/lib/ruby/site_ruby/1.8/i386-cygwin

4) Add the following to Makeall

    (cd ruby; ruby extconf.rb; make; make install)

5)  test with test.rb (Copy attached)

...and you should now have a running Ruby module installed on cygwin...

- Peter



Makeall

#! /bin/sh
#
# Clean and remake all the PDQ files in each chapter subdirectory.
#
# Created by NJG: Fri Aug 24 16:39:23  2001
#
#  $Id: Makeall,v 4.4 2009/03/10 02:24:54 pfeller Exp $
#
#---------------------------------------------------------------------

(cd lib; make)
(cd perl5; ./setup.sh)
(cd python; make)
(cd ruby; ruby extconf.rb; make; make install)
(cd R; cp ../lib/*.[ch] pdq/src; cp ../lib/P*.[h] pdq/lib; R CMD INSTALL pdq)

#---------------------------------------------------------------------

for num in 2 3 6 7 8 9 ; do
	echo; echo
	echo "Making chapter $num PDQ files ..."
	(cd examples/ppa_1998/chap$num; make -f Makefile all)
done

#---------------------------------------------------------------------

exit 0

#---------------------------------------------------------------------


See:  http://www.swig.org/Doc1.3/Ruby.html


