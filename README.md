# gelbach.github.io

Files for replication of some results in [Jonah B. Gelbach, "Public Schooling for Young Children and Maternal Labor Supply", American Economic Review, Vol. 92, No. 1, March 2002](https://www.aeaweb.org/articles?id=10.1257/000282802760015748): 
- Stata dataset [interact.dta](https://gelbach.github.io/howlarge/interact.dta). Note that this file is the result of a lot of pre-processing of U.S. census data files.
- Stata logfile [second2.hours80-shaken.log](https://gelbach.github.io/howlarge/second2.hours80-shaken.log). This file shows you how to get the published stuff in table 6 of the final paper from interact.dta. To get the figures in table 7, columns 1-3, you run the same specifications as in table 6, columns 2-4, just changing the dependent variable. Similarly with table 8, except that you condition on youngest<5.
