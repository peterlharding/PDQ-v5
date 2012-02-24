#!/usr/bin/env ruby
#
###############################################################################
#  Copyright (C) 1994 - 2009, Performance Dynamics Company                    #
#                                                                             #
#  This software is licensed as described in the file COPYING, which          #
#  you should have received as part of this distribution. The terms           #
#  are also available at http://www.perfdynamics.com/Tools/copyright.html.    #
#                                                                             #
#  You may opt to use, copy, modify, merge, publish, distribute and/or sell   #
#  copies of the Software, and permit persons to whom the Software is         #
#  furnished to do so, under the terms of the COPYING file.                   #
#                                                                             #
#  This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY  #
#  KIND, either express or implied.                                           #
###############################################################################

#------------------------------------------------------------------------------

require 'pdq'

#---- Define globals ----------------------------------------------------------

Pdq.Init("OpenCenter")
Pdq.SetComment("A simple M/M/1 queue")

#------------------------------------------------------------------------------

printf("pdq::DLY          -> '%s'\n", Pdq::DLY)
printf("pdq::CEN          -> '%s'\n", Pdq::CEN)
printf("pdq::FCFS         -> '%s'\n", Pdq::FCFS)
printf("pdq::ISRV         -> '%s'\n", Pdq::ISRV)
printf("pdq::TOL          -> '%s'\n", Pdq::TOL)
printf("pdq::MAXBUF       -> '%s'\n", Pdq::MAXBUF)

printf("pdq::MSQ          -> '%s'\n", Pdq::MSQ)
printf("pdq::TRUE         -> '%s'\n", Pdq::TRUE)
printf("pdq::FALSE        -> '%s'\n", Pdq::FALSE)
printf("pdq::MAXNODES     -> '%s'\n", Pdq::MAXNODES)
printf("pdq::MAXSTREAMS   -> '%s'\n", Pdq::MAXSTREAMS)

#------------------------------------------------------------------------------

values = [
	"TRUE",
	"FALSE",
	"MAXNODES",
	"MAXBUF",
	"MAXSTREAMS",
	"MAXCHARS",
	"VOID",
	"OPEN",
	"CLOSED",
	"MEM",
	"CEN",
	"DLY",
	"MSQ",
	"ISRV",
	"FCFS",
	"PSHR",
	"LCFS",
	"TERM",
	"TRANS",
	"BATCH",
	"EXACT",
	"APPROX",
	"CANON",
	"VISITS",
	"DEMAND",
	"PDQ_SP",
	"PDQ_MP",
	"TOL"]
  
#------------------------------------------------------------------------------

