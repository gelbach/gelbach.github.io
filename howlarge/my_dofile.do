log using my_dofile.log, replace
capture set memory 32m
capture use /homes/gelbach/nber/interact.dta
set more 1
set matsize 800

* Doing for moms with youngest kid = five
keep if youngest == 5


macro drop cont79
macro define cont79"   age age2 grade   centcity white  num1317 numge18 num61

macro drop cont80
macro define cont80"  age age2 grade   centcity white  num1317 numge18 num612

*the basic idea is to run regressions of the following form:
* regress depvar endogvar $rhs ($exo)

* 1     simple OLS
* 2     Wald, i.e. bivariate 2SLS                          
* 3     2SLS using quarter main effects, with controls     
* 4     2SLS using quarter*state of birth interactions only
* 5     
* 6
* 7 
* 8 
* 9 
* 10

macro define iv79_1     
macro define iv79_2     "qtr1"
macro define iv79_3     "Jqt*"
macro define iv79_4     "Jqb* Jqt*"
macro define iv79_5     "elig75qb" 
macro define iv79_6     "kidage"
macro define iv79_7     
macro define iv79_8     
macro define iv79_9     
macro define iv79_10    

                
macro define rhs79_1    
macro define rhs79_2    
macro define rhs79_3    "$cont79  Jb* "
macro define rhs79_4    "$cont79  Jb* "
macro define rhs79_5    "$cont79  Jb* "
macro define rhs79_6    "$cont79  Jb* "
macro define rhs79_7       
macro define rhs79_8       
macro define rhs79_9     
macro define rhs79_10   


macro define exo79_1    "$rhs79_1  $iv79_1"
macro define exo79_2    "$rhs79_2  $iv79_2"
macro define exo79_3    "$rhs79_3  $iv79_3"
macro define exo79_4    "$rhs79_4  $iv79_4"
macro define exo79_5    "$rhs79_5  $iv79_5"
macro define exo79_6    "$rhs79_6  $iv79_6"
macro define exo79_7    "$rhs79_7  $iv79_7 "
macro define exo79_8    "$rhs79_8  $iv79_8 "
macro define exo79_9    "$rhs79_9  $iv79_9 "
macro define exo79_10   "$rhs79_10 $iv79_10"




macro define iv80_1     
macro define iv80_2     "qtr1"     
macro define iv80_3     "Jqt*"     
macro define iv80_4     "Jqb* Jqt*"
macro define iv80_5     "elig75qb" 
macro define iv80_6     "kidage"
macro define iv80_7     
macro define iv80_8     
macro define iv80_9     
macro define iv80_10    

                
macro define rhs80_1    
macro define rhs80_2    
macro define rhs80_3    "$cont80  Jb* "
macro define rhs80_4    "$cont80  Jb* "
macro define rhs80_5    "$cont80  Jb* "
macro define rhs80_6    "$cont80  Jb* "
macro define rhs80_7       
macro define rhs80_8       
macro define rhs80_9     
macro define rhs80_10   


macro define exo80_1    "$rhs80_1  $iv80_1"
macro define exo80_2    "$rhs80_2  $iv80_2"
macro define exo80_3    "$rhs80_3  $iv80_3"
macro define exo80_4    "$rhs80_4  $iv80_4"
macro define exo80_5    "$rhs80_5  $iv80_5"
macro define exo80_6    "$rhs80_6  $iv80_6"
macro define exo80_7    "$rhs80_7  $iv80_7 "
macro define exo80_8    "$rhs80_8  $iv80_8 "
macro define exo80_9    "$rhs80_9  $iv80_9 "
macro define exo80_10   "$rhs80_10 $iv80_10"




*means
*table begin 1 1 heading= means
mysum age age2 grade   centcity white  num1317 numge18 num612 othrlt18 othrge
*table end

*ols, with controls, youngest == 5
*table begin 1 2  heading= ols
reg hours public 
*table end

*ols, no controls, youngest == 5
*table begin 1 3   heading= ols
reg hours public $cont80 Jbm*
*table end

* Wald, youngest == 5
*table begin 1 4 stage1 heading= wald
reg hours public     $rhs80_2        ($exo80_2)
stage1  public          $exo80_2,       f($iv80_2)
*table end

*2sls, using quarter main effects for iv, youngest == 5
*table begin 1 5 overid stage1   heading= qob
reg hours public     $rhs80_3        ($exo80_3)
overid     $exo80_3
stage1  public   $exo80_3,  f($iv80_3)
*table end



                  
* Doing for moms with youngest kid less than five
clear
capture use /homes/gelbach/nber/interact.dta

keep if youngest < 5 

macro drop cont80
macro define cont80"   age age2 grade   centcity white num05 num1317 numge18 

macro drop cont80
macro define cont80"  age age2 grade   centcity white num05 num1317 numge18 n
       

*means
*table begin 2 1 heading= means
mysum age age2 grade   centcity white  num1317 numge18 num612 othrlt18 othrge
*table end

*ols, with controls, youngest < 5
*table begin 2 2  heading= ols
reg hours public 
*table end

*ols, no controls, youngest < 5
*table begin 2 3   heading= ols
reg hours public $cont80 Jbm*
*table end

* Wald, youngest < 5
*table begin 2 4 stage1 heading= wald
reg hours public     $rhs80_2        ($exo80_2)
stage1  public          $exo80_2,       f($iv80_2)
*table end

*2sls, using quarter main effects for iv, youngest < 5
*table begin 2 5 overid stage1   heading= qob
reg hours public     $rhs80_3        ($exo80_3)
overid     $exo80_3
stage1  public   $exo80_3,  f($iv80_3)
*table end



       
log close                
