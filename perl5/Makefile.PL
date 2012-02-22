#
# file : Makefile.PL
#
#  $Id: Makefile.PL,v 4.4 2009/04/03 02:19:41 pfeller Exp $
#

use ExtUtils::MakeMaker;
WriteMakefile(
   'FIRST_MAKEFILE' => 'Makefile',
   'NAME' => 'pdq',
   'OBJECT' => 'MVA_Approx.o MVA_Canon.o MVA_Solve.o PDQ_Build.o PDQ_Exact.o PDQ_Globals.o PDQ_Report.o PDQ_Utils.o PDQ_MServer.o pdq_wrap.o'
);

