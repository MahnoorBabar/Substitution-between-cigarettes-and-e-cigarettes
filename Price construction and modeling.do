use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Data/Merge/Thesis Dataset.dta" 

tab prov
Province of the selected |
               respondent |      Freq.     Percent        Cum.
--------------------------+-----------------------------------
newfoundland and labrador |      4,331        9.40        9.40
     prince edward island |      3,953        8.58       17.98
              nova scotia |      4,337        9.41       27.40
            new brunswick |      4,584        9.95       37.35
                   quebec |      5,296       11.50       48.84
                  ontario |      6,466       14.04       62.88
                 manitoba |      4,402        9.56       72.43
             saskatchewan |      4,040        8.77       81.20
                  alberta |      4,462        9.69       90.89
         british columbia |      4,197        9.11      100.00
--------------------------+-----------------------------------
                    Total |     46,068      100.00

tab prov, nol

Province of |
        the |
   selected |
 respondent |      Freq.     Percent        Cum.
------------+-----------------------------------
         10 |      4,331        9.40        9.40
         11 |      3,953        8.58       17.98
         12 |      4,337        9.41       27.40
         13 |      4,584        9.95       37.35
         24 |      5,296       11.50       48.84
         35 |      6,466       14.04       62.88
         46 |      4,402        9.56       72.43
         47 |      4,040        8.77       81.20
         48 |      4,462        9.69       90.89
         59 |      4,197        9.11      100.00
------------+-----------------------------------
      Total |     46,068      100.00


//Newfoundland, 2015
keep if prov==10 & refyear==2015

*Gives prov population
sum wtpp     //sample obs
display r(sum) //population

gen rescaled = wtpp/445603.66 //sum/population
sum rescaled //no. in sample
*reweight such that sample now represents population


//Prince Edward Island
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Data/Merge/Thesis Dataset.dta" , clear

keep if prov==11 & refyear==2015

sum wtpp     //sample obs: 1,428
display r(sum) //population: 121322.5


sum wp_10c if prov==11 & refyear==2015
display r(sum) //1813 per day 


//Nova Scotia, 2015
keep if prov==12 & refyear==2015

sum wtpp     //sample obs: 1,437
display r(sum) //population: 800726.17

sum wp_10c if prov==12 & refyear==2015
display r(sum) //2197 per day 

//PE 2015 (again)
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Data/Merge/Thesis Dataset.dta" , clear

*Population of Canada
keep if refyear==2015
sum wtpp     //sample obs: 15,154
display r(sum) //population: 29670184


keep if prov==11 

sum wtpp     //sample obs: 1,428
display r(sum) //population: 121322.5





///Fresh using re-weighting
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Data/Merge/Thesis Dataset.dta" , clear

*Population of Canada
keep if refyear==2015
sum wtpp     //sample obs: 15,154
display r(sum) //population: 29670184

////Quebec
keep if prov==24 & refyear==2015
sum wtpp     //sample obs: 1,547
display r(sum) //population: 6897903.2
//% pop rep by sample = (1,547/ 6897903.2)*100 = 0.02242%

// avg = 6897903.2/1547 = 4458.89

gen rescaled = wtpp/4458.89

sum rescaled     //sample obs: 1,547
display r(sum) //population: 1547

//Cigarettes
sum wp_10c if prov==24 & refyear==2015
display r(sum) //2291 per day 

//no. of smokers in sample 
sum wp_10c //214 smokers in sample

drop rescaled //or dont


//E-cigarettes
count if elc_115 == 1
16+46= 62

*OR
tab elc_127 // 541 

//re-weight for elc_115 Quebec 
keep if prov==24 & refyear==2013 
tab elc_110
tab elc_120

tab elc_115
tab elc_127

* for now let's say total no. of e-smokers (elc_120)= 32
* for now let's say total no. of e-smokers (elc_110)= 266

* if 32 is 0.02242% of sample, actual e-smokers in prov are 142729.7
* price = 0.022/"e-cig"


//NB
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Data/Merge/Thesis Dataset.dta" , clear

keep if prov==13 & refyear==2013
sum wtpp     //sample obs: 1,640
display r(sum) //population: 631370.5
//% pop rep by sample = (1,640/ 631370.5)*100 = 0.25%

tab elc_110 //259
tab elc_120 //48

tab elc_115
tab elc_127

* if 48 is 0.25% of sample, actual e-smokers in prov are 19200

*2013, $93/year/family 
*total exp by pop = 93*631370.5 = 58717410

*e-cigs smoked by smokers= 19200*13.7 = 263040

* divide for price = $221.6


//British Columbia


//All Canada
//2013
keep if refyear==2013
sum wtpp       //obs:14,565 
display r(sum) //pop: 29043884
//% pop rep by sample = (14,565/ 29043884)*100 = 0.05%

*e-smokers in sample
tab elc_110 //1980
tab elc_120 //361

* if 1980 is 0.05% of sample, actual e-smokers in prov are 19200

//Ontario
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Data/Merge/Thesis Dataset.dta" , clear

keep if prov==35 & refyear==2013

sum wtpp     //sample obs: 1,379 
display r(sum) //population: 11278253
//% pop rep by sample = (1,379 / 11278253)*100 = 0.0122%

tab elc_110 //124
tab elc_120 //25

* if 25 is 0.0122% of sample, actual e-smokers in prov are 204918


//No. of days ecigs smoked
//All Canada
keep if refyear==2017
sum wtpp       //obs: 16,349
display r(sum) //pop: 30291071 *slightly under?
//% pop rep by sample = (16,349/ 30291071)*100 = 0.05397%

tab elc_127
*add elc_127 for avg no of days
sum elc_127
display r(sum) //2754

*e-smokers in sample
tab elc_110 //1980
tab elc_120 //361
* if 361 is 0.05% of sample, actual e-smokers in prov are 668890

*2754/361=7.628 days out of 30, so 7.628*12=91.54 days a year 
*no of times each day?



//Regress for QED- elasticity of demand
reg elc_127 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10 if prov==24 & refyear==2017


      Source |       SS           df       MS      Number of obs   =        61
-------------+----------------------------------   F(10, 50)       =      1.58
       Model |  310.397629        10  31.0397629   Prob > F        =    0.1399
    Residual |  981.799093        50  19.6359819   R-squared       =    0.2402
-------------+----------------------------------   Adj R-squared   =    0.0883
       Total |  1292.19672        60   21.536612   Root MSE        =    4.4313

------------------------------------------------------------------------------
     elc_127 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
     dvurban |  -1.395948   1.493985    -0.93   0.355    -4.396706     1.60481
      hhsize |  -1.940583   1.573083    -1.23   0.223    -5.100213    1.219046
     age0014 |   .6633762    1.86093     0.36   0.723    -3.074412    4.401164
     age1524 |  -.5852283   1.583849    -0.37   0.713    -3.766483    2.596026
     age45pl |    1.19386   1.299407     0.92   0.363    -1.416077    3.803796
       dvage |  -.0404645   .0919656    -0.44   0.662    -.2251828    .1442539
         sex |  -1.584937    1.30592    -1.21   0.231    -4.207954     1.03808
     dvmarst |  -2.022685   1.026705    -1.97   0.054    -4.084882    .0395116
      hwb_01 |   .5927979   .8280232     0.72   0.477    -1.070336    2.255931
      hwb_10 |   .7187717   .6978954     1.03   0.308    -.6829925    2.120536
       _cons |   16.88295   6.387724     2.64   0.011     4.052826    29.71307
------------------------------------------------------------------------------

//Quebec
reg elc_115 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10 if prov==24 & refyear==2017

      Source |       SS           df       MS      Number of obs   =       478
-------------+----------------------------------   F(10, 467)      =      1.85
       Model |  4.94371387        10  .494371387   Prob > F        =    0.0505
    Residual |  124.930763       467  .267517694   R-squared       =    0.0381
-------------+----------------------------------   Adj R-squared   =    0.0175
       Total |  129.874477       477  .272273537   Root MSE        =    .51722

------------------------------------------------------------------------------
     elc_115 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
     dvurban |   .0370111   .0606968     0.61   0.542    -.0822617    .1562839
      hhsize |  -.0965229   .0452722    -2.13   0.034    -.1854854   -.0075605
     age0014 |   .0991759   .0656503     1.51   0.132    -.0298307    .2281825
     age1524 |    .111065   .0534997     2.08   0.038      .005935     .216195
     age45pl |   .0354733   .0414713     0.86   0.393    -.0460202    .1169669
       dvage |   .0027339   .0028551     0.96   0.339    -.0028765    .0083442
         sex |   .0505939   .0497518     1.02   0.310    -.0471712    .1483591
     dvmarst |   .0274563   .0384521     0.71   0.476    -.0481042    .1030168
      hwb_01 |  -.0988682   .0309423    -3.20   0.001    -.1596716   -.0380647
      hwb_10 |   .0476562   .0292203     1.63   0.104    -.0097635    .1050758
       _cons |   2.701041   .2227202    12.13   0.000     2.263383    3.138699
------------------------------------------------------------------------------

*if also using cigs
reg elc_115 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10 ss_10 if prov==24 & refyear==2017

      Source |       SS           df       MS      Number of obs   =       478
-------------+----------------------------------   F(11, 466)      =      1.87
       Model |  5.50218459        11  .500198599   Prob > F        =    0.0406
    Residual |  124.372292       466  .266893331   R-squared       =    0.0424
-------------+----------------------------------   Adj R-squared   =    0.0198
       Total |  129.874477       477  .272273537   Root MSE        =    .51662

------------------------------------------------------------------------------
     elc_115 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
     dvurban |   .0380516   .0606302     0.63   0.531     -.081091    .1571941
      hhsize |  -.0971097   .0452212    -2.15   0.032    -.1859724   -.0082471
     age0014 |   .1017481   .0655978     1.55   0.122    -.0271559    .2306522
     age1524 |   .1095411   .0534476     2.05   0.041     .0045128    .2145693
     age45pl |   .0357237   .0414233     0.86   0.389    -.0456758    .1171233
       dvage |   .0035242   .0029036     1.21   0.225    -.0021816      .00923
         sex |    .051994   .0497031     1.05   0.296     -.045676    .1496641
     dvmarst |   .0271268   .0384078     0.71   0.480    -.0483472    .1026009
      hwb_01 |  -.0910374   .0313767    -2.90   0.004    -.1526948     -.02938
      hwb_10 |   .0452013   .0292355     1.55   0.123    -.0122485    .1026511
       ss_10 |   .0429504   .0296918     1.45   0.149    -.0153959    .1012967
       _cons |   2.569246   .2403946    10.69   0.000     2.096855    3.041638
------------------------------------------------------------------------------


//For cigs 
reg ss_10 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10 elc_115 if prov==24 & refyear==2017

      Source |       SS           df       MS      Number of obs   =       478
-------------+----------------------------------   F(11, 466)      =      6.19
       Model |  44.0492001        11  4.00447274   Prob > F        =    0.0000
    Residual |  301.383854       466  .646746468   R-squared       =    0.1275
-------------+----------------------------------   Adj R-squared   =    0.1069
       Total |  345.433054       477  .724178311   Root MSE        =    .80421

------------------------------------------------------------------------------
       ss_10 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
     dvurban |  -.0280771   .0944126    -0.30   0.766    -.2136042    .1574499
      hhsize |   .0237083   .0707336     0.34   0.738    -.1152881    .1627046
     age0014 |  -.0702113    .102326    -0.69   0.493    -.2712889    .1308663
     age1524 |   .0239214   .0835674     0.29   0.775    -.1402943    .1881371
     age45pl |  -.0095221   .0645325    -0.15   0.883    -.1363329    .1172887
       dvage |  -.0186861   .0044436    -4.21   0.000     -.027418   -.0099541
         sex |  -.0378637   .0774426    -0.49   0.625    -.1900436    .1143163
     dvmarst |   .0048128   .0598201     0.08   0.936    -.1127379    .1223634
      hwb_01 |  -.1720312    .048634    -3.54   0.000    -.2676003   -.0764621
      hwb_10 |   .0521956   .0455627     1.15   0.253    -.0373382    .1417294
     elc_115 |   .1040791   .0719503     1.45   0.149     -.037308    .2454663
       _cons |   2.787414    .397103     7.02   0.000      2.00708    3.567749
------------------------------------------------------------------------------



///Regressions
//e-cigarette
reg elc_115 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10 ss_10 p_ecigarettes p_cigarette p_cigars p_tobacco
note: p_cigars omitted because of collinearity.
note: p_tobacco omitted because of collinearity.

      Source |       SS           df       MS      Number of obs   =     6,185
-------------+----------------------------------   F(13, 6171)     =      8.33
       Model |  33.3669366        13  2.56668743   Prob > F        =    0.0000
    Residual |  1901.41334     6,171  .308120781   R-squared       =    0.0172
-------------+----------------------------------   Adj R-squared   =    0.0152
       Total |  1934.78027     6,184  .312868738   Root MSE        =    .55509

-------------------------------------------------------------------------------
      elc_115 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
--------------+----------------------------------------------------------------
      dvurban |   .0065456   .0160993     0.41   0.684    -.0250147    .0381058
       hhsize |  -.0134195    .012447    -1.08   0.281      -.03782    .0109811
      age0014 |  -.0036517   .0190733    -0.19   0.848    -.0410421    .0337387
      age1524 |  -.0005966   .0159167    -0.04   0.970    -.0317989    .0306058
      age45pl |   .0019208   .0112893     0.17   0.865    -.0202101    .0240518
        dvage |    -.00084   .0007197    -1.17   0.243    -.0022509    .0005709
          sex |   .0658843   .0146995     4.48   0.000     .0370681    .0947006
      dvmarst |  -.0108181    .009364    -1.16   0.248    -.0291747    .0075386
       hwb_01 |  -.0310343   .0088953    -3.49   0.000    -.0484722   -.0135964
       hwb_10 |  -.0093933   .0077857    -1.21   0.228    -.0246561    .0058694
        ss_10 |   .0543451    .008677     6.26   0.000     .0373352    .0713549
p_ecigarettes |  -.2693137    .138555    -1.94   0.052    -.5409298    .0023025
  p_cigarette |  -.1745762   .1171905    -1.49   0.136    -.4043103    .0551579
     p_cigars |          0  (omitted)
    p_tobacco |          0  (omitted)
        _cons |   2.866603   .0937737    30.57   0.000     2.682774    3.050432
-------------------------------------------------------------------------------

*cigarette use highly significant, positive impact on e-smoking
*physical health highly significant, negative impact on e-smoking
*sex highly significant, females have positive propensity towrads on e-smoking

//Determinants of cigarette use, all of Canada
reg ss_10 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10  p_ecigarettes p_cigarette elc_115

      Source |       SS           df       MS      Number of obs   =     6,185
-------------+----------------------------------   F(13, 6171)     =     75.45
       Model |  646.356473        13  49.7197287   Prob > F        =    0.0000
    Residual |  4066.63075     6,171  .658990561   R-squared       =    0.1371
-------------+----------------------------------   Adj R-squared   =    0.1353
       Total |  4712.98723     6,184  .762126007   Root MSE        =    .81178

-------------------------------------------------------------------------------
        ss_10 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
--------------+----------------------------------------------------------------
      dvurban |  -.0590478   .0235327    -2.51   0.012      -.10518   -.0129155
       hhsize |   .0008844   .0182048     0.05   0.961    -.0348034    .0365721
      age0014 |  -.0297184   .0278912    -1.07   0.287    -.0843949     .024958
      age1524 |    .028578   .0232745     1.23   0.220    -.0170481    .0742042
      age45pl |   .0811818   .0164776     4.93   0.000       .04888    .1134837
        dvage |  -.0145676   .0010362   -14.06   0.000    -.0165989   -.0125363
          sex |   .0273347   .0215294     1.27   0.204    -.0148704    .0695398
      dvmarst |   .0114818    .013695     0.84   0.402    -.0153652    .0383287
       hwb_01 |  -.1713591   .0128377   -13.35   0.000    -.1965254   -.1461927
       hwb_10 |  -.0241704   .0113834    -2.12   0.034    -.0464858    -.001855
p_ecigarettes |   .4970839   .2025921     2.45   0.014     .0999327    .8942351
  p_cigarette |   .3011841   .1713724     1.76   0.079    -.0347654    .6371337
      elc_115 |   .1162301   .0185578     6.26   0.000     .0798504    .1526097
        _cons |   2.376805   .1440124    16.50   0.000      2.09449    2.659119
-------------------------------------------------------------------------------

*e-cigarette use highly significant, positive impact on smoking
*p_ecigarette highly significant, positive impact on smoking (1% inc in p of ecig leads to an additional 0.49 units of cigarettes consumed)
*physical health highly significant, negative impact on smoking (1% improvement in health decreases cig use by 0.17 units)
*mental health highly significant, negative impact on smoking
*Being in rural vs. urban area has highly significant, negative impact on e-smoking
*ages: positive for 45+


//add rev


//E-cigs, diff var (ever use)
reg elc_110 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10  p_ecigarettes p_cigarette ss_20

      Source |       SS           df       MS      Number of obs   =    39,513
-------------+----------------------------------   F(13, 39499)    =    532.67
       Model |  684.091978        13  52.6224598   Prob > F        =    0.0000
    Residual |  3902.07541    39,499   .09878922   R-squared       =    0.1492
-------------+----------------------------------   Adj R-squared   =    0.1489
       Total |  4586.16739    39,512  .116070242   Root MSE        =    .31431

-------------------------------------------------------------------------------
      elc_110 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
--------------+----------------------------------------------------------------
      dvurban |   .0059924   .0035627     1.68   0.093    -.0009906    .0129754
       hhsize |   .0261902   .0030398     8.62   0.000      .020232    .0321483
      age0014 |   .0021549   .0044852     0.48   0.631    -.0066362    .0109459
      age1524 |   -.030026   .0038645    -7.77   0.000    -.0376005   -.0224516
      age45pl |  -.0038545   .0026318    -1.46   0.143    -.0090129    .0013039
        dvage |   .0038524    .000128    30.09   0.000     .0036014    .0041033
          sex |   .0535984   .0031983    16.76   0.000     .0473296    .0598671
      dvmarst |   .0034366   .0021408     1.61   0.108    -.0007594    .0076325
       hwb_01 |  -.0068682   .0020061    -3.42   0.001    -.0108002   -.0029361
       hwb_10 |  -.0214575   .0019754   -10.86   0.000    -.0253294   -.0175857
p_ecigarettes |  -.1847529   .0203038    -9.10   0.000    -.2245488    -.144957
  p_cigarette |  -.0530718   .0253909    -2.09   0.037    -.1028385   -.0033051
        ss_20 |   .4088584   .0074904    54.58   0.000     .3941771    .4235397
        _cons |   .9237407   .0241207    38.30   0.000     .8764636    .9710178
-------------------------------------------------------------------------------
//great results
*cig use sig positive impact on e-cig use
*p_cigarette sig negative impact on e-cig use (makes sense: elasticity)
*p_ecigarette sig negative impact on e-cig use (makes sense: elasticity)
*phy health sig negative
*mental health sig negative 
*females sig positive
*age1524 sig positive
*hhsize sig positive: more people in hh, more likely to smoke ecig


//E-cigs, diff var (last 30 days)
reg elc_120 dvurban hhsize age0014 age1524 age45pl sex dvmarst hwb_01 hwb_10  p_ecigarettes p_cigarette ss_30

      Source |       SS           df       MS      Number of obs   =     3,473
-------------+----------------------------------   F(13, 3459)     =      3.48
       Model |  8.43854405        13  .649118773   Prob > F        =    0.0000
    Residual |  645.614436     3,459  .186647712   R-squared       =    0.0129
-------------+----------------------------------   Adj R-squared   =    0.0092
       Total |   654.05298     3,472  .188379315   Root MSE        =    .43203

-------------------------------------------------------------------------------
      elc_120 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
--------------+----------------------------------------------------------------
      dvurban |  -.0025893   .0164618    -0.16   0.875    -.0348651    .0296866
       hhsize |  -.0211947   .0123615    -1.71   0.087    -.0454313    .0030418
      age0014 |    .031922   .0187431     1.70   0.089    -.0048266    .0686707
      age1524 |   .0361803     .01607     2.25   0.024     .0046727     .067688
      age45pl |  -.0190594   .0116042    -1.64   0.101    -.0418112    .0036924
        dvage |   .0025662   .0007097     3.62   0.000     .0011747    .0039576
          sex |   .0010631   .0151582     0.07   0.944    -.0286568    .0307829
      dvmarst |   .0048617   .0091307     0.53   0.594    -.0130403    .0227637
       hwb_01 |  -.0021544   .0088506    -0.24   0.808    -.0195074    .0151986
       hwb_10 |   -.022724   .0078703    -2.89   0.004     -.038155    -.007293
p_ecigarettes |   .0724467   .0925366     0.78   0.434    -.1089853    .2538787
  p_cigarette |   .0436858   .1214656     0.36   0.719    -.1944658    .2818374
        ss_30 |  -.0006689    .016279    -0.04   0.967    -.0325864    .0312485
        _cons |   1.709342   .0916227    18.66   0.000     1.529702    1.888982
-------------------------------------------------------------------------------
*doesn't make sense now


//Cigs, diff var (ever use)
reg ss_20 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10  p_ecigarettes p_cigarette elc_110


      Source |       SS           df       MS      Number of obs   =    39,513
-------------+----------------------------------   F(13, 39499)    =    279.42
       Model |   150.56908        13  11.5822369   Prob > F        =    0.0000
    Residual |  1637.26713    39,499   .04145085   R-squared       =    0.0842
-------------+----------------------------------   Adj R-squared   =    0.0839
       Total |  1787.83621    39,512   .04524793   Root MSE        =    .20359

-------------------------------------------------------------------------------
        ss_20 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
--------------+----------------------------------------------------------------
      dvurban |   .0004814   .0023079     0.21   0.835     -.004042    .0050049
       hhsize |   .0013641   .0019709     0.69   0.489     -.002499    .0052271
      age0014 |     .00118   .0029053     0.41   0.685    -.0045145    .0068745
      age1524 |   .0034352   .0025051     1.37   0.170    -.0014749    .0083452
      age45pl |   .0055584   .0017046     3.26   0.001     .0022174    .0088994
        dvage |   .0003366   .0000839     4.01   0.000     .0001722     .000501
          sex |   .0101772   .0020784     4.90   0.000     .0061034     .014251
      dvmarst |   .0015167   .0013867     1.09   0.274    -.0012013    .0042347
       hwb_01 |  -.0074074   .0012991    -5.70   0.000    -.0099537    -.004861
       hwb_10 |  -.0066188   .0012811    -5.17   0.000    -.0091297   -.0041079
p_ecigarettes |   .0901192   .0131579     6.85   0.000     .0643294    .1159089
  p_cigarette |   -.015602   .0164478    -0.95   0.343    -.0478402    .0166361
      elc_110 |   .1715524   .0031429    54.58   0.000     .1653923    .1777125
        _cons |   1.590592   .0137525   115.66   0.000     1.563637    1.617548
-------------------------------------------------------------------------------
*e-cig highly sig positive (more so from cig to e-cig i.e good thing)
*p-cig insig lol (inelastic??)
*phy health sig negative
*mental health sig negative 
*females sig positive
*respondent's age, small positive significant
*age45pl sig positive (popular among older people)


//E-cig, prov-year dummies, (ever use)
reg elc_110 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10  p_ecigarettes p_cigarette ss_20 i.prov i.refyear
note: 2017.refyear omitted because of collinearity.

      Source |       SS           df       MS      Number of obs   =    39,513
-------------+----------------------------------   F(23, 39489)    =    309.98
       Model |   701.38064        23  30.4948104   Prob > F        =    0.0000
    Residual |  3884.78675    39,489  .098376428   R-squared       =    0.1529
-------------+----------------------------------   Adj R-squared   =    0.1524
       Total |  4586.16739    39,512  .116070242   Root MSE        =    .31365

---------------------------------------------------------------------------------------
              elc_110 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
----------------------+----------------------------------------------------------------
              dvurban |   .0112297    .003664     3.06   0.002     .0040483    .0184112
               hhsize |   .0240971   .0030398     7.93   0.000     .0181389    .0300552
              age0014 |   .0020325   .0044776     0.45   0.650    -.0067437    .0108088
              age1524 |   -.030099   .0038589    -7.80   0.000    -.0376626   -.0225355
              age45pl |  -.0050296   .0026321    -1.91   0.056    -.0101886    .0001294
                dvage |   .0037627   .0001281    29.37   0.000     .0035116    .0040137
                  sex |   .0536002   .0031924    16.79   0.000     .0473431    .0598573
              dvmarst |  -.0013565   .0022162    -0.61   0.540    -.0057004    .0029874
               hwb_01 |  -.0065711   .0020032    -3.28   0.001    -.0104975   -.0026447
               hwb_10 |  -.0220682   .0019758   -11.17   0.000    -.0259408   -.0181956
        p_ecigarettes |  -.2251252   .0209296   -10.76   0.000    -.2661477   -.1841026
          p_cigarette |   .0506729   .1553324     0.33   0.744    -.2537823    .3551281
                ss_20 |   .4083066   .0074769    54.61   0.000     .3936516    .4229615
                      |
                 prov |
prince edward island  |   .0305474   .0079983     3.82   0.000     .0148705    .0462242
         nova scotia  |   .0140942   .0091768     1.54   0.125    -.0038925    .0320809
       new brunswick  |   .0362748   .0122716     2.96   0.003     .0122222    .0603273
              quebec  |   .0226973   .0177771     1.28   0.202    -.0121462    .0575408
             ontario  |   .0697091   .0142358     4.90   0.000     .0418065    .0976117
            manitoba  |   .0369957   .0170436     2.17   0.030     .0035898    .0704015
        saskatchewan  |   .0177239   .0094621     1.87   0.061    -.0008221    .0362698
             alberta  |   .0314886    .007939     3.97   0.000     .0159279    .0470493
    british columbia  |   .0285867   .0092471     3.09   0.002     .0104622    .0467112
                      |
              refyear |
                2015  |  -.0246644   .0037932    -6.50   0.000    -.0320991   -.0172296
                2017  |          0  (omitted)
                      |
                _cons |   .8819971   .0777541    11.34   0.000     .7295971    1.034397
---------------------------------------------------------------------------------------
*most prov sig, not quebec lol


//E-cig, prov-year dummies, (ever use)
reg elc_110 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10  p_ecigarettes p_cigarette ss_20 i.prov#i.refyear
note: 59.prov#2015.refyear omitted because of collinearity.
note: 59.prov#2017.refyear omitted because of collinearity.

      Source |       SS           df       MS      Number of obs   =    39,513
-------------+----------------------------------   F(40, 39472)    =    179.21
       Model |  704.877003        40  17.6219251   Prob > F        =    0.0000
    Residual |  3881.29038    39,472  .098330219   R-squared       =    0.1537
-------------+----------------------------------   Adj R-squared   =    0.1528
       Total |  4586.16739    39,512  .116070242   Root MSE        =    .31358

-------------------------------------------------------------------------------------------------
                        elc_110 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
--------------------------------+----------------------------------------------------------------
                        dvurban |   .0108701   .0036652     2.97   0.003     .0036862     .018054
                         hhsize |   .0242063   .0030398     7.96   0.000     .0182482    .0301644
                        age0014 |   .0020556   .0044781     0.46   0.646    -.0067217    .0108329
                        age1524 |  -.0300971   .0038588    -7.80   0.000    -.0376606   -.0225337
                        age45pl |  -.0052199   .0026326    -1.98   0.047    -.0103798     -.00006
                          dvage |   .0037649   .0001281    29.38   0.000     .0035137     .004016
                            sex |   .0535706    .003192    16.78   0.000     .0473142     .059827
                        dvmarst |  -.0012353   .0022177    -0.56   0.578     -.005582    .0031113
                         hwb_01 |  -.0065882   .0020035    -3.29   0.001    -.0105151   -.0026614
                         hwb_10 |  -.0221533   .0019762   -11.21   0.000    -.0260267     -.01828
                  p_ecigarettes |   .7837991   .3245142     2.42   0.016     .1477434    1.419855
                    p_cigarette |  -2.617845   1.050061    -2.49   0.013    -4.675989   -.5597003
                          ss_20 |    .408204   .0074769    54.60   0.000      .393549    .4228589
                                |
                   prov#refyear |
newfoundland and labrador#2015  |  -.1051132   .0337759    -3.11   0.002    -.1713148   -.0389115
newfoundland and labrador#2017  |  -.2130955   .0664301    -3.21   0.001    -.3433001   -.0828909
     prince edward island#2013  |    .097079   .0279532     3.47   0.001       .04229     .151868
     prince edward island#2015  |  -.0536046    .023327    -2.30   0.022    -.0993262   -.0078831
     prince edward island#2017  |  -.1287906   .0526099    -2.45   0.014    -.2319074   -.0256739
              nova scotia#2013  |   .1405774   .0511362     2.75   0.006     .0403493    .2408055
              nova scotia#2015  |  -.0391708    .012853    -3.05   0.002    -.0643631   -.0139786
              nova scotia#2017  |  -.1015293   .0385398    -2.63   0.008    -.1770683   -.0259903
            new brunswick#2013  |  -.1445812   .0735289    -1.97   0.049    -.2886996   -.0004629
            new brunswick#2015  |  -.2516135   .0996135    -2.53   0.012    -.4468584   -.0563685
            new brunswick#2017  |   -.320949   .1307239    -2.46   0.014     -.577171    -.064727
                   quebec#2013  |  -.2613969   .1106772    -2.36   0.018    -.4783268    -.044467
                   quebec#2015  |  -.3774166   .1459593    -2.59   0.010    -.6635004   -.0913329
                   quebec#2017  |  -.4500245   .1761333    -2.56   0.011    -.7952499    -.104799
                  ontario#2013  |  -.1700075   .0927058    -1.83   0.067    -.3517132    .0116981
                  ontario#2015  |  -.2689103   .1173917    -2.29   0.022     -.499001   -.0388197
                  ontario#2017  |  -.3263556   .1466522    -2.23   0.026    -.6137975   -.0389137
                 manitoba#2013  |   .3540974    .117359     3.02   0.003      .124071    .5841239
                 manitoba#2015  |    .139821   .0547882     2.55   0.011     .0324348    .2472072
                 manitoba#2017  |   .0944593   .0423535     2.23   0.026     .0114454    .1774732
             saskatchewan#2013  |   .1494069   .0431358     3.46   0.001     .0648597    .2339542
             saskatchewan#2015  |  -.0189765    .009908    -1.92   0.055    -.0383964    .0004435
             saskatchewan#2017  |  -.0964537   .0276272    -3.49   0.000    -.1506037   -.0423038
                  alberta#2013  |  -.0781626   .0499664    -1.56   0.118    -.1760979    .0197726
                  alberta#2015  |  -.1105546   .0471458    -2.34   0.019    -.2029615   -.0181478
                  alberta#2017  |  -.1969101   .0718395    -2.74   0.006    -.3377174   -.0561029
         british columbia#2013  |    .030788   .0129467     2.38   0.017     .0054122    .0561638
         british columbia#2015  |          0  (omitted)
         british columbia#2017  |          0  (omitted)
                                |
                          _cons |   1.926508   .4355877     4.42   0.000     1.072745     2.78027
-------------------------------------------------------------------------------------------------

//E-cig, prov-year dummies, (ever use)
reg elc_110 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10  p_ecigarettes p_cigarette ss_20 i.prov##i.refyear
note: 2017.refyear omitted because of collinearity.
note: 59.prov#2017.refyear omitted because of collinearity.

      Source |       SS           df       MS      Number of obs   =    39,513
-------------+----------------------------------   F(40, 39472)    =    179.21
       Model |  704.877003        40  17.6219251   Prob > F        =    0.0000
    Residual |  3881.29038    39,472  .098330219   R-squared       =    0.1537
-------------+----------------------------------   Adj R-squared   =    0.1528
       Total |  4586.16739    39,512  .116070242   Root MSE        =    .31358

--------------------------------------------------------------------------------------------
                   elc_110 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
---------------------------+----------------------------------------------------------------
                   dvurban |   .0108701   .0036652     2.97   0.003     .0036862     .018054
                    hhsize |   .0242063   .0030398     7.96   0.000     .0182482    .0301644
                   age0014 |   .0020556   .0044781     0.46   0.646    -.0067217    .0108329
                   age1524 |  -.0300971   .0038588    -7.80   0.000    -.0376606   -.0225337
                   age45pl |  -.0052199   .0026326    -1.98   0.047    -.0103798     -.00006
                     dvage |   .0037649   .0001281    29.38   0.000     .0035137     .004016
                       sex |   .0535706    .003192    16.78   0.000     .0473142     .059827
                   dvmarst |  -.0012353   .0022177    -0.56   0.578     -.005582    .0031113
                    hwb_01 |  -.0065882   .0020035    -3.29   0.001    -.0105151   -.0026614
                    hwb_10 |  -.0221533   .0019762   -11.21   0.000    -.0260267     -.01828
             p_ecigarettes |  -.3256623   .0670871    -4.85   0.000    -.4571546     -.19417
               p_cigarette |   .5335402       .319     1.67   0.094    -.0917075    1.158788
                     ss_20 |    .408204   .0074769    54.60   0.000      .393549    .4228589
                           |
                      prov |
     prince edward island  |   .0078948   .0178471     0.44   0.658    -.0270858    .0428755
              nova scotia  |  -.0221916   .0237264    -0.94   0.350    -.0686959    .0243128
            new brunswick  |   .0599438   .0202471     2.96   0.003      .020259    .0996285
                   quebec  |   .0556325    .030119     1.85   0.065    -.0034014    .1146664
                  ontario  |   .0925028   .0253608     3.65   0.000      .042795    .1422106
                 manitoba  |    -.00973   .0427076    -0.23   0.820    -.0934379    .0739778
             saskatchewan  |   .0120067   .0219994     0.55   0.585    -.0311127     .055126
                  alberta  |   .0537229   .0153729     3.49   0.000     .0235916    .0838542
         british columbia  |   .0260609   .0137371     1.90   0.058    -.0008641    .0529859
                           |
                   refyear |
                     2015  |  -.0098315   .0111862    -0.88   0.379    -.0317568    .0120938
                     2017  |          0  (omitted)
                           |
              prov#refyear |
prince edward island#2015  |   .0102089    .019996     0.51   0.610    -.0289837    .0494015
prince edward island#2017  |   .0333937   .0213049     1.57   0.117    -.0083645    .0751519
         nova scotia#2015  |   .0151793    .021739     0.70   0.485    -.0274298    .0577883
         nova scotia#2017  |   .0469373   .0229844     2.04   0.041     .0018874    .0919873
       new brunswick#2015  |  -.0055433    .017689    -0.31   0.754    -.0402142    .0291276
       new brunswick#2017  |   .0269584   .0173095     1.56   0.119    -.0069686    .0608853
              quebec#2015  |   .0125711   .0180757     0.70   0.487    -.0228577    .0479999
              quebec#2017  |   .0389643   .0177569     2.19   0.028     .0041603    .0737683
             ontario#2015  |  -.0018257   .0176467    -0.10   0.918    -.0364136    .0327622
             ontario#2017  |   .0373665   .0156703     2.38   0.017     .0066525    .0680806
            manitoba#2015  |  -.0035919    .022689    -0.16   0.874    -.0480628    .0408791
            manitoba#2017  |  -.0003746   .0206835    -0.02   0.986    -.0409147    .0401656
        saskatchewan#2015  |  -.0188359   .0196045    -0.96   0.337    -.0572611    .0195894
        saskatchewan#2017  |  -.0181111   .0196127    -0.92   0.356    -.0565525    .0203302
             alberta#2015  |  -.0172511    .017997    -0.96   0.338    -.0525257    .0180235
             alberta#2017  |  -.0211503   .0162815    -1.30   0.194    -.0530623    .0107618
    british columbia#2015  |  -.0369188   .0154118    -2.40   0.017    -.0671262   -.0067113
    british columbia#2017  |          0  (omitted)
                           |
                     _cons |   .6777877   .1412179     4.80   0.000     .4009971    .9545782
--------------------------------------------------------------------------------------------

*not sure why 2013 is completely removed


//Cig 
reg ss_20 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10  p_ecigarettes p_cigarette elc_110 i.prov i.refyear 
note: 2017.refyear omitted because of collinearity.

      Source |       SS           df       MS      Number of obs   =    39,513
-------------+----------------------------------   F(23, 39489)    =    159.15
       Model |  151.668947        23  6.59430203   Prob > F        =    0.0000
    Residual |  1636.16726    39,489  .041433494   R-squared       =    0.0848
-------------+----------------------------------   Adj R-squared   =    0.0843
       Total |  1787.83621    39,512   .04524793   Root MSE        =    .20355

---------------------------------------------------------------------------------------
                ss_20 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
----------------------+----------------------------------------------------------------
              dvurban |  -.0012276   .0023781    -0.52   0.606    -.0058887    .0034335
               hhsize |   .0015353   .0019743     0.78   0.437    -.0023344    .0054051
              age0014 |   .0013173   .0029059     0.45   0.650    -.0043783    .0070129
              age1524 |   .0035602   .0025062     1.42   0.155     -.001352    .0084725
              age45pl |   .0054581   .0017081     3.20   0.001     .0021103     .008806
                dvage |   .0003418    .000084     4.07   0.000     .0001771    .0005065
                  sex |   .0100786   .0020785     4.85   0.000     .0060046    .0141525
              dvmarst |   .0014469   .0014383     1.01   0.314    -.0013722    .0042659
               hwb_01 |  -.0074018   .0012997    -5.69   0.000    -.0099492   -.0048543
               hwb_10 |  -.0066818   .0012838    -5.20   0.000    -.0091981   -.0041654
        p_ecigarettes |    .095701   .0135942     7.04   0.000      .069056     .122346
          p_cigarette |  -.0671309   .1008069    -0.67   0.505    -.2647149    .1304532
              elc_110 |   .1719677   .0031491    54.61   0.000     .1657954      .17814
                      |
                 prov |
prince edward island  |  -.0058166   .0051916    -1.12   0.263    -.0159922    .0043591
         nova scotia  |  -.0023273   .0059557    -0.39   0.696    -.0140006     .009346
       new brunswick  |  -.0037154   .0079648    -0.47   0.641    -.0193267    .0118959
              quebec  |  -.0152718   .0115369    -1.32   0.186    -.0378844    .0073409
             ontario  |   -.018826   .0092411    -2.04   0.042    -.0369387   -.0007132
            manitoba  |  -.0105608   .0110615    -0.95   0.340    -.0322415    .0111199
        saskatchewan  |  -.0076237   .0061408    -1.24   0.214    -.0196599    .0044125
             alberta  |  -.0100105    .005153    -1.94   0.052    -.0201105    .0000896
    british columbia  |  -.0011146   .0060019    -0.19   0.853    -.0128784    .0106493
                      |
              refyear |
                2015  |  -.0021511    .002463    -0.87   0.382    -.0069786    .0026765
                2017  |          0  (omitted)
                      |
                _cons |   1.623207   .0498785    32.54   0.000     1.525444     1.72097
---------------------------------------------------------------------------------------


//Cig 
reg ss_20 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10  p_ecigarettes p_cigarette elc_110 i.prov#i.refyear 

note: 59.prov#2015.refyear omitted because of collinearity.
note: 59.prov#2017.refyear omitted because of collinearity.

      Source |       SS           df       MS      Number of obs   =    39,513
-------------+----------------------------------   F(40, 39472)    =     91.98
       Model |  152.431072        40   3.8107768   Prob > F        =    0.0000
    Residual |  1635.40513    39,472  .041432031   R-squared       =    0.0853
-------------+----------------------------------   Adj R-squared   =    0.0843
       Total |  1787.83621    39,512   .04524793   Root MSE        =    .20355

-------------------------------------------------------------------------------------------------
                          ss_20 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
--------------------------------+----------------------------------------------------------------
                        dvurban |   -.001167   .0023794    -0.49   0.624    -.0058307    .0034967
                         hhsize |   .0015599   .0019748     0.79   0.430    -.0023107    .0054305
                        age0014 |   .0011629   .0029069     0.40   0.689    -.0045346    .0068604
                        age1524 |   .0034313   .0025067     1.37   0.171    -.0014819    .0083445
                        age45pl |    .005487   .0017087     3.21   0.001     .0021378    .0088361
                          dvage |   .0003395   .0000841     4.04   0.000     .0001747    .0005043
                            sex |   .0100848   .0020788     4.85   0.000     .0060104    .0141592
                        dvmarst |   .0014062   .0014395     0.98   0.329    -.0014153    .0042277
                         hwb_01 |  -.0073574   .0013001    -5.66   0.000    -.0099057   -.0048091
                         hwb_10 |  -.0067185   .0012844    -5.23   0.000    -.0092359   -.0042011
                  p_ecigarettes |   .1684102   .2106623     0.80   0.424    -.2444931    .5813135
                    p_cigarette |   -.237033   .6816675    -0.35   0.728    -1.573118    1.099052
                        elc_110 |   .1719992   .0031504    54.60   0.000     .1658243    .1781742
                                |
                   prov#refyear |
newfoundland and labrador#2015  |  -.0046664   .0219273    -0.21   0.831    -.0476444    .0383116
newfoundland and labrador#2017  |  -.0037116   .0431267    -0.09   0.931     -.088241    .0808177
     prince edward island#2013  |  -.0026752   .0181478    -0.15   0.883    -.0382453    .0328948
     prince edward island#2015  |   .0023803    .015143     0.16   0.875    -.0273004     .032061
     prince edward island#2017  |  -.0189617   .0341526    -0.56   0.579    -.0859016    .0479782
              nova scotia#2013  |   .0156393   .0331966     0.47   0.638    -.0494268    .0807053
              nova scotia#2015  |  -.0052668   .0083441    -0.63   0.528    -.0216214    .0110878
              nova scotia#2017  |  -.0094192   .0250191    -0.38   0.707    -.0584573    .0396189
            new brunswick#2013  |  -.0071329   .0477314    -0.15   0.881    -.1006875    .0864217
            new brunswick#2015  |  -.0272965   .0646662    -0.42   0.673    -.1540438    .0994507
            new brunswick#2017  |  -.0181262   .0848619    -0.21   0.831    -.1844575    .1482051
                   quebec#2013  |  -.0253091   .0718477    -0.35   0.725    -.1661322     .115514
                   quebec#2015  |  -.0322752   .0947529    -0.34   0.733    -.2179932    .1534428
                   quebec#2017  |  -.0485487   .1143407    -0.42   0.671    -.2726592    .1755619
                  ontario#2013  |  -.0262849   .0601796    -0.44   0.662    -.1442384    .0916685
                  ontario#2015  |  -.0357394   .0762061    -0.47   0.639    -.1851052    .1136264
                  ontario#2017  |  -.0424681   .0952005    -0.45   0.656    -.2290634    .1441273
                 manitoba#2013  |   .0112766   .0761888     0.15   0.882    -.1380552    .1606085
                 manitoba#2015  |   .0044119    .035567     0.12   0.901    -.0653003    .0741241
                 manitoba#2017  |  -.0059775   .0274942    -0.22   0.828    -.0598668    .0479119
             saskatchewan#2013  |    .005461   .0280045     0.20   0.845    -.0494285    .0603506
             saskatchewan#2015  |  -.0090658   .0064316    -1.41   0.159    -.0216719    .0035404
             saskatchewan#2017  |  -.0080229   .0179361    -0.45   0.655     -.043178    .0271322
                  alberta#2013  |  -.0152519    .032435    -0.47   0.638    -.0788253    .0483216
                  alberta#2015  |  -.0200761   .0306052    -0.66   0.512     -.080063    .0399108
                  alberta#2017  |  -.0131155   .0466368    -0.28   0.779    -.1045248    .0782939
         british columbia#2013  |   .0049829   .0084045     0.59   0.553    -.0114901    .0214559
         british columbia#2015  |          0  (omitted)
         british columbia#2017  |          0  (omitted)
                                |
                          _cons |   1.682793   .2826917     5.95   0.000     1.128711    2.236876
-------------------------------------------------------------------------------------------------


//Cig 
reg ss_20 dvurban hhsize age0014 age1524 age45pl dvage sex dvmarst hwb_01 hwb_10  p_ecigarettes p_cigarette elc_110 i.prov##i.refyear 
note: 2017.refyear omitted because of collinearity.
note: 59.prov#2017.refyear omitted because of collinearity.

      Source |       SS           df       MS      Number of obs   =    39,513
-------------+----------------------------------   F(40, 39472)    =     91.98
       Model |  152.431072        40   3.8107768   Prob > F        =    0.0000
    Residual |  1635.40513    39,472  .041432031   R-squared       =    0.0853
-------------+----------------------------------   Adj R-squared   =    0.0843
       Total |  1787.83621    39,512   .04524793   Root MSE        =    .20355

--------------------------------------------------------------------------------------------
                     ss_20 | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
---------------------------+----------------------------------------------------------------
                   dvurban |   -.001167   .0023794    -0.49   0.624    -.0058307    .0034967
                    hhsize |   .0015599   .0019748     0.79   0.430    -.0023107    .0054305
                   age0014 |   .0011629   .0029069     0.40   0.689    -.0045346    .0068604
                   age1524 |   .0034313   .0025067     1.37   0.171    -.0014819    .0083445
                   age45pl |    .005487   .0017087     3.21   0.001     .0021378    .0088361
                     dvage |   .0003395   .0000841     4.04   0.000     .0001747    .0005043
                       sex |   .0100848   .0020788     4.85   0.000     .0060104    .0141592
                   dvmarst |   .0014062   .0014395     0.98   0.329    -.0014153    .0042277
                    hwb_01 |  -.0073574   .0013001    -5.66   0.000    -.0099057   -.0048091
                    hwb_10 |  -.0067185   .0012844    -5.23   0.000    -.0092359   -.0042011
             p_ecigarettes |   .1497496    .043554     3.44   0.001     .0643827    .2351165
               p_cigarette |   -.259008   .2070723    -1.25   0.211    -.6648748    .1468587
                   elc_110 |   .1719992   .0031504    54.60   0.000     .1658243    .1781742
                           |
                      prov |
     prince edward island  |  -.0020533   .0115849    -0.18   0.859      -.02476    .0206533
              nova scotia  |   .0167743   .0154012     1.09   0.276    -.0134125     .046961
            new brunswick  |  -.0085591   .0131442    -0.65   0.515    -.0343219    .0172038
                   quebec  |  -.0275198   .0195512    -1.41   0.159    -.0658405     .010801
                  ontario  |  -.0281154   .0164644    -1.71   0.088     -.060386    .0041551
                 manitoba  |   .0138137   .0277222     0.50   0.618    -.0405226    .0681499
             saskatchewan  |   .0064191   .0142803     0.45   0.653    -.0215705    .0344088
                  alberta  |  -.0161715   .0099801    -1.62   0.105    -.0357327    .0033896
         british columbia  |   .0050158   .0089174     0.56   0.574    -.0124624    .0224941
                           |
                   refyear |
                     2015  |  -.0032138   .0072613    -0.44   0.658     -.017446    .0110185
                     2017  |          0  (omitted)
                           |
              prov#refyear |
prince edward island#2015  |    .009333   .0129797     0.72   0.472    -.0161076    .0347736
prince edward island#2017  |  -.0128968   .0138297    -0.93   0.351    -.0400034    .0142098
         nova scotia#2015  |  -.0168659   .0141111    -1.20   0.232     -.044524    .0107921
         nova scotia#2017  |  -.0218765     .01492    -1.47   0.143      -.05112    .0073671
       new brunswick#2015  |   -.015472    .011482    -1.35   0.178     -.037977    .0070331
       new brunswick#2017  |  -.0072136   .0112362    -0.64   0.521    -.0292368    .0148096
              quebec#2015  |  -.0024635   .0117333    -0.21   0.834    -.0254611    .0205342
              quebec#2017  |   -.019629   .0115266    -1.70   0.089    -.0422215    .0029635
             ontario#2015  |  -.0047321   .0114548    -0.41   0.680    -.0271837    .0177196
             ontario#2017  |  -.0123364   .0101724    -1.21   0.225    -.0322745    .0076018
            manitoba#2015  |  -.0029345   .0147279    -0.20   0.842    -.0318015    .0259324
            manitoba#2017  |  -.0138644   .0134259    -1.03   0.302    -.0401795    .0124506
        saskatchewan#2015  |  -.0101703   .0127257    -0.80   0.424    -.0351129    .0147724
        saskatchewan#2017  |  -.0098745    .012731    -0.78   0.438    -.0348276    .0150786
             alberta#2015  |   .0004696   .0116824     0.04   0.968    -.0224281    .0233672
             alberta#2017  |   .0066534   .0105688     0.63   0.529    -.0140617    .0273685
    british columbia#2015  |   .0004592   .0100048     0.05   0.963    -.0191505    .0200689
    british columbia#2017  |          0  (omitted)
                           |
                     _cons |   1.698182   .0912948    18.60   0.000     1.519242    1.877122
--------------------------------------------------------------------------------------------

*not as many sig for cig as e-cigarette


///Descriptive Statistics
table (sex prov)

////list of all vars (table1)
//Demographic
*refyear 
*prov 
*durban
*hhsize
*hhtype
*dvage
*sex
*dvmarst
*hwb_01=health
*hwb_10=mentalhealth
*income

*age0014
*age1524
*age45pl

//Tobacco product use (table2)
//cigaretttes
*ss_10= presesnt cig smoked everyday, occasionally, not at all (no missing!!) //change to y/n
*ss_20= smoked cig 30 days (y/n)
*ss_30= smoked daily 30 days (y/n)
*ps_10=ever smoke whole cig (y/n)

//cigars
*tp_017=ever smoked little cigar (very few missing!!)
*tp_021=last 30 days
*tp_027=smoked cigar 30 days (quite a few missing)

//tobacco
*tp_050=ever chewed tobacco (v. few missing)
*tp_060

//e-cig
*elc_110=ever used ecig (y/n)-few missing!!
*elc_120=last 30 days -plenty missing
*elc_115=present freq everyday occ not-quite a few missing
*elc_125=30 days freq everyday occ not-quite a few missing
*see if i can combine??-NO

gen cigaruse = tp_017
gen tobuse = tp_050
gen eciguse = elc_110

drop if cigaruse==.
drop if tobuse==.
drop if eciguse==.

gen ciguse = .
replace ciguse = 1 if ss_10 ==1 | ss_10==2
replace ciguse = 2 if ss_10==3

*label define (make into blue yes, no)
label define cig  1 "Yes" 2 "No"
label values ciguse cig 

label define cigaruse  1 "Yes" 2 "No"
label values cigaruse cigaruse 

label define tobuse  1 "Yes" 2 "No"
label values tobuse tobuse

label define eciguse  1 "Yes" 2 "No"
label values eciguse eciguse 

gen nouse = .
replace nouse = 1 if ciguse==2 & cigaruse==2 & tobuse==2 & eciguse==2
replace nouse = 2 if nouse==.

label define nouse  1 "Yes" 2 "No"
label values nouse nouse 


//depvar
gen anyuse = .
replace anyuse = 0 if nouse == 1 //NO
replace anyuse = 1 if ciguse==1 & cigaruse==2 & tobuse==2 & eciguse==2 //Cig only
replace anyuse = 2 if ciguse==2 & cigaruse==2 & tobuse==2 & eciguse==1 //E-cig only
replace anyuse = 3 if ciguse==2 & cigaruse==1 & tobuse==2 & eciguse==2 //Cigar only
replace anyuse = 4 if ciguse==2 & cigaruse==2 & tobuse==1 & eciguse==2 //Tob only 
replace anyuse = 5 if ciguse==1 & cigaruse==2 & tobuse==2 & eciguse==1 //Cig +E-cig 
replace anyuse = 6 if ciguse==1 & cigaruse==1 & tobuse==2 & eciguse==2 //Cig + Cigar
replace anyuse = 7 if ciguse==1 & cigaruse==2 & tobuse==1 & eciguse==2 //Cig + Tob
replace anyuse = 8 if ciguse==2 & cigaruse==1 & tobuse==2 & eciguse==1 //E-cig+cigar
replace anyuse = 9 if ciguse==2 & cigaruse==2 & tobuse==1 & eciguse==1 //E-cig + Tob
replace anyuse = 10 if ciguse==2 & cigaruse==1 & tobuse==1 & eciguse==2 //Tob+Cigars
replace anyuse = 11 if ciguse==1 & cigaruse==1 & tobuse==1 & eciguse==2 //Cig+cigar+tobacco
replace anyuse = 12 if ciguse==1 & cigaruse==2 & tobuse==1 & eciguse==1 //Cig+tob+e-cig
replace anyuse = 13 if ciguse==1 & cigaruse==1 & tobuse==2 & eciguse==1 //Cig+cigar+e-cig
replace anyuse = 14 if ciguse==2 & cigaruse==1 & tobuse==1 & eciguse==1 //E-cig+tob+cigar
replace anyuse = 15 if ciguse==1 & cigaruse==1 & tobuse==2 & eciguse==1 //E-cig+cig+cigar
replace anyuse = 16 if ciguse==1 & cigaruse==1 & tobuse==1 & eciguse==1 //All

label define anyuse 0 "No" 1 "Cigarette" 2 "E-cigarette" 3 "Cigar" 4 "Tobacco" 5 "Cigarette and E-cigarette" 6 "Cigarette and Cigar" 7 "Cigarette and Tobacco" 8 "E-cigarette and Cigar" 9 "E-cigarette and Tobacco" 10 "Tobacco and Cigars" 11 "Cigarette, Cigar and Tobacco" 12 "Cigarette, Tobacco and E-cigarette" 13 "Cigarette, Cigar and E-cigarette" 14 "E-cigarette, Tobacco and Cigars" 15 "E-cigarette, Cigarette and Cigars" 16 "All four"
label values anyuse anyuse 

save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Final Thesis Dataset.dta", replace

//Table1
tabulate refyear prov dvurban hhsize hhtype dvage sex dvmarst hwb_01 hwb_10 income, summarize(refyear)

tabulate dvurban hhsize hhtype dvage sex dvmarst hwb_01 hwb_10 income, summarize(refyear)

table (dvurban hhsize hhtype dvage sex dvmarst hwb_01 hwb_10 income) (refyear), statistics (percent)

table (dvurban hhsize hhtype dvage sex dvmarst income) (refyear)
 
table (ciguse cigaruse tobuse eciguse) (refyear)


tabulate anyuse

                            anyuse |      Freq.     Percent        Cum.
-----------------------------------+-----------------------------------
                                No |     25,669       56.77       56.77
                         Cigarette |      1,485        3.28       60.06
                       E-cigarette |      1,854        4.10       64.16
                             Cigar |      6,810       15.06       79.22
                           Tobacco |        499        1.10       80.32
         Cigarette and E-cigarette |        791        1.75       82.07
               Cigarette and Cigar |      1,066        2.36       84.43
             Cigarette and Tobacco |         87        0.19       84.62
             E-cigarette and Cigar |      1,744        3.86       88.48
           E-cigarette and Tobacco |        131        0.29       88.77
                Tobacco and Cigars |      1,589        3.51       92.29
      Cigarette, Cigar and Tobacco |        336        0.74       93.03
Cigarette, Tobacco and E-cigarette |         97        0.21       93.24
   E-cigarette, Tobacco and Cigars |        637        1.41       94.65
 E-cigarette, Cigarette and Cigars |      1,558        3.45       98.10
                          All four |        860        1.90      100.00
-----------------------------------+-----------------------------------
                             Total |     45,213      100.00

**** just need full names							 
tabulate anyuse refyear
//export

table ( anyuse ) ( refyear ) ()

-------------------------------------------------------------------------
                                     |             Survey year           
                                     |    2013     2015     2017    Total
-------------------------------------+-----------------------------------
anyuse                               |                                   
  No                                 |   8,192    8,201    9,276   25,669
  Cigarette                          |     600      499      386    1,485
  E-cigarette                        |     365      485    1,004    1,854
  Cigar                              |   2,327    2,560    1,923    6,810
  Tobacco                            |     185      158      156      499
  Cigarette and E-cigarette          |     272      300      219      791
  Cigarette and Cigar                |     511      302      253    1,066
  Cigarette and Tobacco              |      32       34       21       87
  E-cigarette and Cigar              |     379      605      760    1,744
  E-cigarette and Tobacco            |      27       38       66      131
  Tobacco and Cigars                 |     554      582      453    1,589
  Cigarette, Cigar and Tobacco       |     132      118       86      336
  Cigarette, Tobacco and E-cigarette |      23       37       37       97
  E-cigarette, Tobacco and Cigars    |     121      239      277      637
  E-cigarette, Cigarette and Cigars  |     526      599      433    1,558
  All four                           |     265      332      263      860
  Total                              |  14,511   15,089   15,613   45,213
-------------------------------------------------------------------------



table ( anyuse ) ( refyear ) (), statistic(percent)

----------------------------------------------------------------------
                                     |            Survey year         
                                     |   2013    2015    2017    Total
-------------------------------------+--------------------------------
anyuse                               |                                
  No                                 |  18.12   18.14   20.52    56.77
  Cigarette                          |   1.33    1.10    0.85     3.28
  E-cigarette                        |   0.81    1.07    2.22     4.10
  Cigar                              |   5.15    5.66    4.25    15.06
  Tobacco                            |   0.41    0.35    0.35     1.10
  Cigarette and E-cigarette          |   0.60    0.66    0.48     1.75
  Cigarette and Cigar                |   1.13    0.67    0.56     2.36
  Cigarette and Tobacco              |   0.07    0.08    0.05     0.19
  E-cigarette and Cigar              |   0.84    1.34    1.68     3.86
  E-cigarette and Tobacco            |   0.06    0.08    0.15     0.29
  Tobacco and Cigars                 |   1.23    1.29    1.00     3.51
  Cigarette, Cigar and Tobacco       |   0.29    0.26    0.19     0.74
  Cigarette, Tobacco and E-cigarette |   0.05    0.08    0.08     0.21
  E-cigarette, Tobacco and Cigars    |   0.27    0.53    0.61     1.41
  E-cigarette, Cigarette and Cigars  |   1.16    1.32    0.96     3.45
  All four                           |   0.59    0.73    0.58     1.90
  Total                              |  32.09   33.37   34.53   100.00
----------------------------------------------------------------------




table ( hhsize hhtype ) ( refyear ) ()

-----------------------------------------------------------------------------------------------------
                                                                 |             Survey year           
                                                                 |    2013     2015     2017    Total
-----------------------------------------------------------------+-----------------------------------
Number of people in the household                                |                                   
  1                                                              |                                   
    Type of household, based on roster age composition           |                                   
      Households with only 18-19 year old members                |      17       24       16       57
      Households with only 20-24 year old members                |      79      198      350      627
      Households with only 25-44 year old members                |     226      456      240      922
      Households with only 45-64 year old members                |     826    1,012      437    2,275
      Households with only 65+ year old members                  |   1,159    1,274      441    2,874
      Households with adults and children aged 12-19 only        |                4        5        9
      Other compositions                                         |       3                 6        9
      Total                                                      |   2,310    2,968    1,495    6,773
  2                                                              |                                   
    Type of household, based on roster age composition           |                                   
      Households with only 18-19 year old members                |                5        3        8
      Households with only 20-24 year old members                |      74      124      225      423
      Households with only 25-44 year old members                |     298      447      214      959
      Households with only 45-64 year old members                |   1,281    1,324      691    3,296
      Households with only 65+ year old members                  |     954    1,167      394    2,515
      Households with adults and children aged 0-11 only         |      87       82       59      228
      Households with adults and children aged 12-19 only        |     358      308      495    1,161
      Other compositions                                         |     977    1,151      951    3,079
      Total                                                      |   4,029    4,608    3,032   11,669
  3                                                              |                                   
    Type of household, based on roster age composition           |                                   
      Households with only 18-19 year old members                |                2                 2
      Households with only 20-24 year old members                |       2       18                20
      Households with only 25-44 year old members                |       4       26                30
      Households with only 45-64 year old members                |       2       11                13
      Households with only 65+ year old members                  |       2        4                 6
      Households with adults and children aged 0-11 only         |     469      541      353    1,363
      Households with adults and children aged 12-19 only        |   1,198    1,111    1,858    4,167
      Households with adults, young children and teens 0-19 only |      99       65      102      266
      Other compositions                                         |   1,167    1,138    1,917    4,222
      Total                                                      |   2,943    2,916    4,230   10,089
  4                                                              |                                   
    Type of household, based on roster age composition           |                                   
      Households with only 20-24 year old members                |                4                 4
      Households with only 25-44 year old members                |                8                 8
      Households with only 45-64 year old members                |                2                 2
      Households with adults and children aged 0-11 only         |     541      642      424    1,607
      Households with adults and children aged 12-19 only        |   1,872    1,398    3,102    6,372
      Households with adults, young children and teens 0-19 only |     417      367      533    1,317
      Other compositions                                         |     435      461      990    1,886
      Total                                                      |   3,265    2,882    5,049   11,196
  5 or more                                                      |                                   
    Type of household, based on roster age composition           |                                   
      Households with only 20-24 year old members                |                1                 1
      Households with only 25-44 year old members                |       1        6                 7
      Households with adults and children aged 0-11 only         |     248      268       77      593
      Households with adults and children aged 12-19 only        |     817      652      525    1,994
      Households with adults, young children and teens 0-19 only |     807      674      650    2,131
      Other compositions                                         |      91      114      127      332
      Total                                                      |   1,964    1,715    1,379    5,058
  Total                                                          |                                   
    Type of household, based on roster age composition           |                                   
      Households with only 18-19 year old members                |      17       31       19       67
      Households with only 20-24 year old members                |     155      345      575    1,075
      Households with only 25-44 year old members                |     529      943      454    1,926
      Households with only 45-64 year old members                |   2,109    2,349    1,128    5,586
      Households with only 65+ year old members                  |   2,115    2,445      835    5,395
      Households with adults and children aged 0-11 only         |   1,345    1,533      913    3,791
      Households with adults and children aged 12-19 only        |   4,245    3,473    5,985   13,703
      Households with adults, young children and teens 0-19 only |   1,323    1,106    1,285    3,714
      Other compositions                                         |   2,673    2,864    3,991    9,528
      Total                                                      |  14,511   15,089   15,185   44,785
-----------------------------------------------------------------------------------------------------

//does this show me anything insightful?

--------------------------------------------------------------------------------------------------
                                                                 |            Survey year         
                                                                 |   2013    2015    2017    Total
-----------------------------------------------------------------+--------------------------------
Number of people in the household                                |                                
  1                                                              |                                
    Type of household, based on roster age composition           |                                
      Households with only 18-19 year old members                |   0.04    0.05    0.04     0.13
      Households with only 20-24 year old members                |   0.18    0.44    0.78     1.40
      Households with only 25-44 year old members                |   0.50    1.02    0.54     2.06
      Households with only 45-64 year old members                |   1.84    2.26    0.98     5.08
      Households with only 65+ year old members                  |   2.59    2.84    0.98     6.42
      Households with adults and children aged 12-19 only        |           0.01    0.01     0.02
      Other compositions                                         |   0.01            0.01     0.02
      Total                                                      |   5.16    6.63    3.34    15.12
  2                                                              |                                
    Type of household, based on roster age composition           |                                
      Households with only 18-19 year old members                |           0.01    0.01     0.02
      Households with only 20-24 year old members                |   0.17    0.28    0.50     0.94
      Households with only 25-44 year old members                |   0.67    1.00    0.48     2.14
      Households with only 45-64 year old members                |   2.86    2.96    1.54     7.36
      Households with only 65+ year old members                  |   2.13    2.61    0.88     5.62
      Households with adults and children aged 0-11 only         |   0.19    0.18    0.13     0.51
      Households with adults and children aged 12-19 only        |   0.80    0.69    1.11     2.59
      Other compositions                                         |   2.18    2.57    2.12     6.88
      Total                                                      |   9.00   10.29    6.77    26.06
  3                                                              |                                
    Type of household, based on roster age composition           |                                
      Households with only 18-19 year old members                |           0.00             0.00
      Households with only 20-24 year old members                |   0.00    0.04             0.04
      Households with only 25-44 year old members                |   0.01    0.06             0.07
      Households with only 45-64 year old members                |   0.00    0.02             0.03
      Households with only 65+ year old members                  |   0.00    0.01             0.01
      Households with adults and children aged 0-11 only         |   1.05    1.21    0.79     3.04
      Households with adults and children aged 12-19 only        |   2.68    2.48    4.15     9.30
      Households with adults, young children and teens 0-19 only |   0.22    0.15    0.23     0.59
      Other compositions                                         |   2.61    2.54    4.28     9.43
      Total                                                      |   6.57    6.51    9.45    22.53
  4                                                              |                                
    Type of household, based on roster age composition           |                                
      Households with only 20-24 year old members                |           0.01             0.01
      Households with only 25-44 year old members                |           0.02             0.02
      Households with only 45-64 year old members                |           0.00             0.00
      Households with adults and children aged 0-11 only         |   1.21    1.43    0.95     3.59
      Households with adults and children aged 12-19 only        |   4.18    3.12    6.93    14.23
      Households with adults, young children and teens 0-19 only |   0.93    0.82    1.19     2.94
      Other compositions                                         |   0.97    1.03    2.21     4.21
      Total                                                      |   7.29    6.44   11.27    25.00
  5 or more                                                      |                                
    Type of household, based on roster age composition           |                                
      Households with only 20-24 year old members                |           0.00             0.00
      Households with only 25-44 year old members                |   0.00    0.01             0.02
      Households with adults and children aged 0-11 only         |   0.55    0.60    0.17     1.32
      Households with adults and children aged 12-19 only        |   1.82    1.46    1.17     4.45
      Households with adults, young children and teens 0-19 only |   1.80    1.50    1.45     4.76
      Other compositions                                         |   0.20    0.25    0.28     0.74
      Total                                                      |   4.39    3.83    3.08    11.29
  Total                                                          |                                
    Type of household, based on roster age composition           |                                
      Households with only 18-19 year old members                |   0.04    0.07    0.04     0.15
      Households with only 20-24 year old members                |   0.35    0.77    1.28     2.40
      Households with only 25-44 year old members                |   1.18    2.11    1.01     4.30
      Households with only 45-64 year old members                |   4.71    5.25    2.52    12.47
      Households with only 65+ year old members                  |   4.72    5.46    1.86    12.05
      Households with adults and children aged 0-11 only         |   3.00    3.42    2.04     8.46
      Households with adults and children aged 12-19 only        |   9.48    7.75   13.36    30.60
      Households with adults, young children and teens 0-19 only |   2.95    2.47    2.87     8.29
      Other compositions                                         |   5.97    6.39    8.91    21.27
      Total                                                      |  32.40   33.69   33.91   100.00
--------------------------------------------------------------------------------------------------

 

//Access 
//Cigs bought in last 6 months (y/n change to %)
*pp_010=reserve
*pp_020=smuggled
*pp_030=store/station
*pp_040=another source
*Don't und what the total will be for %??

tab ca_10

Where cigarettes are obtained, and from |
                                   whom |      Freq.     Percent        Cum.
----------------------------------------+-----------------------------------
I buy them at a small grocery / corner  |      3,987       63.85       63.85
            I buy them at a supermarket |        392        6.28       70.13
       I buy them at a gasoline station |        690       11.05       81.18
    I buy them at another kind of store |        175        2.80       83.98
I buy them from a friend or someone els |         38        0.61       84.59
  My brother or sister gives them to me |          6        0.10       84.69
   My mother or father gives them to me |        397        6.36       91.05
A friend or someone else gives them to  |        213        3.41       94.46
I take them from my mother, father or s |         25        0.40       94.86
I buy them from a First Nations Reserve |         84        1.35       96.20
  I buy them on a First Nations Reserve |        178        2.85       99.06
                        Other - Specify |         59        0.94      100.00
----------------------------------------+-----------------------------------
                                  Total |      6,244      100.00
//does this say much??





////list of all vars (table1)
//Demographic
*refyear 
*prov 
*durban
*hhsize
*hhtype
*dvage
*sex
*dvmarst
*hwb_01=health
*hwb_10=mentalhealth
*income

*age0014
*age1524
*age45pl


table ( sex dvmarst dvurban) ( refyear ) (), statistic(percent)

sum income dvage sex dvurban dvmarst


      Grouped marital |
 status of respondent |           Survey year
from household roster |      2013       2015       2017 |     Total
----------------------+---------------------------------+----------
Living common-law/Mar |     5,628      8,956      4,219 |    18,803 
Widowed/Divorced/Sepa |     1,928      2,135      1,085 |     5,148 
Single, never married |     6,847      3,891     10,263 |    21,001 
----------------------+---------------------------------+----------
                Total |    14,403     14,982     15,567 |    44,952 



table dvmarst refyear, statistic(percent)

--------------------------------------------------------------------------------------------
                                                           |            Survey year         
                                                           |   2013    2015    2017    Total
-----------------------------------------------------------+--------------------------------
Grouped marital status of respondent from household roster |                                
  Living common-law/Married                                |  12.52   19.92    9.39    41.83
  Widowed/Divorced/Separated                               |   4.29    4.75    2.41    11.45
  Single, never married                                    |  15.23    8.66   22.83    46.72
  Total                                                    |  32.04   33.33   34.63   100.00
--------------------------------------------------------------------------------------------

table sex refyear

-----------------------------------------------------
                 |             Survey year           
                 |    2013     2015     2017    Total
-----------------+-----------------------------------
Respondent's sex |                                   
  Male           |   6,629    6,957    7,400   20,986
  Female         |   7,882    8,132    8,213   24,227
  Total          |  14,511   15,089   15,613   45,213
-----------------------------------------------------


table sex refyear, statistic(percent)

--------------------------------------------------
                 |            Survey year         
                 |   2013    2015    2017    Total
-----------------+--------------------------------
Respondent's sex |                                
  Male           |  14.66   15.39   16.37    46.42
  Female         |  17.43   17.99   18.17    53.58
  Total          |  32.09   33.37   34.53   100.00
--------------------------------------------------

sum income if refyear==2013

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      income |     14,511    30435.13    5933.112      22735      48454

sum income if refyear==2015

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      income |     15,089    34616.79    7762.829      25314      54891

sum income if refyear==2017

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      income |     15,613    37075.07    6126.309      28857    54045.5


	  
sum dvage if refyear==2013        

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
       dvage |     14,511    40.15926    21.51423         15         85

sum dvage if refyear==2015

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
       dvage |     15,089    42.40122    21.12996         15         85	   
	   
sum dvage if refyear==2017

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
       dvage |     15,613    31.34894    17.89455         15         85

table dvurban refyear, statistic(percent)

-----------------------------------------------------------------------------------------
                                                        |            Survey year         
                                                        |   2013    2015    2017    Total
--------------------------------------------------------+--------------------------------
Characteristics of community where the respondent lives |                                
  Population centre                                     |  22.04   24.01   26.14    72.19
  Rural                                                 |   8.92    9.84    9.04    27.81
  Total                                                 |  30.96   33.86   35.18   100.00
-----------------------------------------------------------------------------------------

table age0014 refyear, statistic(percent)
table age1524 refyear, statistic(percent)
table age2544 refyear, statistic(percent)
table age45pl refyear, statistic(percent)

 sum hhsize

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      hhsize |     44,785     2.91285    1.248873          1          5

tab hhsize

  Number of |
  people in |
        the |
  household |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |      6,773       15.12       15.12
          2 |     11,669       26.06       41.18
          3 |     10,089       22.53       63.71
          4 |     11,196       25.00       88.71
  5 or more |      5,058       11.29      100.00
------------+-----------------------------------
      Total |     44,785      100.00


tab hhtype refyear

   Type of household, |
  based on roster age |           Survey year
          composition |      2013       2015       2017 |     Total
----------------------+---------------------------------+----------
Households with only  |        17         31         19 |        67 
Households with only  |       155        345        575 |     1,075 
Households with only  |       529        943        454 |     1,926 
Households with only  |     2,109      2,349      1,128 |     5,586 
Households with only  |     2,115      2,445        835 |     5,395 
Households with adult |     1,345      1,533        945 |     3,823 
Households with adult |     4,245      3,473      6,075 |    13,793 
Households with adult |     1,323      1,106      1,581 |     4,010 
   Other compositions |     2,673      2,864      4,001 |     9,538 
----------------------+---------------------------------+----------
                Total |    14,511     15,089     15,613 |    45,213 

				
drop if dvmarst==.
drop if dvurban==.		

/////
table sex refyear, statistic(proportion, across(sex))

-------------------------------------------------
                 |           Survey year         
                 |   2013    2015    2017   Total
-----------------+-------------------------------
Respondent's sex |                               
  Male           |  .4547   .4608   .4745   .4637
  Female         |  .5453   .5392   .5255   .5363
  Total          |      1       1       1       1
-------------------------------------------------
	
table dvmarst refyear, statistic(proportion, across(dvmarst))           

-------------------------------------------------------------------------------------------
                                                           |           Survey year         
                                                           |   2013    2015    2017   Total
-----------------------------------------------------------+-------------------------------
Grouped marital status of respondent from household roster |                               
  Living common-law/Married                                |  .3919   .5978    .271   .4189
  Widowed/Divorced/Separated                               |  .1332    .143   .0697   .1141
  Single, never married                                    |   .475   .2591   .6593    .467
  Total                                                    |      1       1       1       1
-------------------------------------------------------------------------------------------

table dvurban refyear, statistic(proportion, across(dvurban))  

---------------------------------------------------------------------------------------
                                                        |           Survey year        
                                                        |   2013    2015   2017   Total
--------------------------------------------------------+------------------------------
Characteristics of community where the respondent lives |                              
  Population centre                                     |  .7119   .7092   .743    .722
  Rural                                                 |  .2881   .2908   .257    .278
  Total                                                 |      1       1      1       1
---------------------------------------------------------------------------------------


sum dvage if refyear==2013 

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
       dvage |     13,660    40.07716    21.43539         15         85

. sum dvage if refyear==2015

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
       dvage |     14,919    42.41792    21.11898         15         85

. sum dvage if refyear==2017 

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
       dvage |     15,567    31.30745    17.88206         15         85
 sum dvage

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
       dvage |     44,146    37.77579    20.71999         15         85

	   


sum income if refyear==2013     

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      income |     13,660    30415.86    5912.521      22735      48454

. sum income if refyear==2015

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      income |     14,919    34619.11    7766.278      25314      54891

. sum income if refyear==2017 

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      income |     15,567    37082.46    6126.108      28857    54045.5

.sum income

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      income |     44,146    34187.15    7200.839      22735      54891



table ( anyuse ) ( refyear ) (), statistic(percent, across(anyuse))


-------------------------------------------------------------------------
                                     |             Survey year           
                                     |    2013     2015     2017    Total
-------------------------------------+-----------------------------------
anyuse                               |                                   
  No                                 |   56.46    54.44    59.42    56.82
  Cigarette                          |    4.03     3.30     2.47     3.23
  E-cigarette                        |    2.57     3.22     6.44     4.15
  Cigar                              |   16.19    16.98    12.32    15.09
  Tobacco                            |    1.27     1.06     1.00     1.10
  Cigarette and E-cigarette          |    1.84     1.98     1.41     1.73
  Cigarette and Cigar                |    3.52     2.01     1.63     2.34
  Cigarette and Tobacco              |    0.20     0.23     0.13     0.19
  E-cigarette and Cigar              |    2.59     3.96     4.88     3.86
  E-cigarette and Tobacco            |    0.18     0.25     0.42     0.29
  Tobacco and Cigars                 |    3.88     3.88     2.90     3.53
  Cigarette, Cigar and Tobacco       |    0.90     0.77     0.55     0.73
  Cigarette, Tobacco and E-cigarette |    0.17     0.24     0.24     0.22
  E-cigarette, Tobacco and Cigars    |    0.83     1.56     1.77     1.41
  E-cigarette, Cigarette and Cigars  |    3.62     3.93     2.78     3.43
  All four                           |    1.76     2.20     1.66     1.87
  Total                              |  100.00   100.00   100.00   100.00
-------------------------------------------------------------------------

 sum anyuse if refyear==2013

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      anyuse |     13,660    2.616545    4.251049          0         16

. sum anyuse if refyear==2015

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      anyuse |     14,919    2.884309     4.50361          0         16

. sum anyuse if refyear==2017

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
      anyuse |     15,567    2.477035    4.214028          0         16


	  
//Prices
table ( anyuse ) ( refyear ) (), statistic(percent, across(anyuse))	
p_cigarette tax_cigarette wholesale_cigarette

rpc each
p_each


gst
pst  

table (p_cigarette p_ecigarette p_cigars p_tobacco) ( refyear ) ()
table (prov p_cigarette) ( refyear ) () , statistic(mean)
sum p_cigarette , by (prov)

table (p_cigars) ( refyear ) ()
sum p_cigars if refyear==2013

table (gst) ( prov ) ()

sum p_cigarette if refyear==2013

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
 p_cigarette |     13,660     .479213    .0660807     .38475      .6008

. sum p_cigarette if refyear==2015

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
 p_cigarette |     14,919    .4755781    .0560031      .3753      .5653

. sum p_cigarette if refyear==2017

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
 p_cigarette |     15,567    .4696732    .0644201     .38185     .58785


 sum p_ecigarette if refyear==2013 

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
p_ecigaret~s |     13,660       .2531           0      .2531      .2531

. sum p_ecigarette if refyear==2015

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
p_ecigaret~s |     14,919       .3333           0      .3333      .3333

. sum p_ecigarette if refyear==2017

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
p_ecigaret~s |     15,567         .45           0        .45        .45


sum p_cigars if refyear==2013 

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
    p_cigars |     13,660       .6387           0      .6387      .6387

. sum p_cigars if refyear==2015 

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
    p_cigars |     14,919       .7161           0      .7161      .7161

. sum p_cigars if refyear==2017

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
    p_cigars |     15,567       .7402           0      .7402      .7402

	
sum p_tobacco if refyear==2013 

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   p_tobacco |     13,660       .2884           0      .2884      .2884

. sum p_tobacco if refyear==2015  

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   p_tobacco |     14,919       .3069           0      .3069      .3069

. sum p_tobacco if refyear==2017          

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
   p_tobacco |     15,567       .3246           0      .3246      .3246


   
sum rpc_cigarettes if refyear==2013   

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
rpc_cigare~s |     13,660     453.391           0    453.391    453.391

. sum rpc_cigarettes if refyear==2015  

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
rpc_cigare~s |     14,919     502.351           0    502.351    502.351

. sum rpc_cigarettes if refyear==2017   

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
rpc_cigare~s |     15,567     483.079           0    483.079    483.079


sum rpc_ecigarettes if refyear==2013 

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
rpc_ecigar~s |     13,660      12.568           0     12.568     12.568

. sum rpc_ecigarettes if refyear==2015 

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
rpc_ecigar~s |     14,919       24.12           0      24.12      24.12

. sum rpc_ecigarettes if refyear==2017  

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
rpc_ecigar~s |     15,567      33.062           0     33.062     33.062


sum rpc_cigars if refyear==2013

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
  rpc_cigars |     13,660       9.785           0      9.785      9.785

. . include "/var/folders/gc/p3v_0gmj6h7dr7696c4lm7cr0000gq/T//SD10067.000000"

. . sum rpc_cigars if refyear==2015

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
  rpc_cigars |     14,919       9.156           0      9.156      9.156

. . include "/var/folders/gc/p3v_0gmj6h7dr7696c4lm7cr0000gq/T//SD10067.000000"

. . sum rpc_cigars if refyear==2017

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
  rpc_cigars |     15,567        8.09           0       8.09       8.09



sum rpc_tobacco if refyear==2013

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
 rpc_tobacco |     13,660       8.549           0      8.549      8.549

. sum rpc_tobacco if refyear==2015

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
 rpc_tobacco |     14,919       6.957           0      6.957      6.957

. sum rpc_tobacco if refyear==2017

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
 rpc_tobacco |     15,567       6.064           0      6.064      6.064


 
table (prov p_cigarette) ( refyear ) () 
table (prov tax_cigarette) ( refyear ) () 
table (prov wholesale_cigarette) ( refyear ) () 


//Graphs for Prices
graph twoway (line p_cigarette refyear) , by(prov)
graph twoway (line tax_cigarette refyear) , by(prov)
graph twoway (line wholesale_cigarette refyear) , by(prov)
*Yes, now combine


line p_cigarette refyear, by(prov)

line p_cigarette refyear if prov==10 || line p_cigarette refyear if prov==11 || || line p_cigarette refyear if prov==12 || line p_cigarette refyear if prov==13 || line p_cigarette refyear if prov==24 || line p_cigarette refyear if prov==35|| line p_cigarette refyear if prov==46 || line p_cigarette refyear if prov==47 || line p_cigarette refyear if prov==48 || line p_cigarette refyear if prov==59
*change legend

line tax_cigarette refyear if prov==10 || line tax_cigarette refyear if prov==11 || || line tax_cigarette refyear if prov==12 || line tax_cigarette refyear if prov==13 || line tax_cigarette refyear if prov==24 || line tax_cigarette refyear if prov==35|| line tax_cigarette refyear if prov==46 || line tax_cigarette refyear if prov==47 || line tax_cigarette refyear if prov==48 || line tax_cigarette refyear if prov==59


line wholesale_cigarette refyear if prov==10 || line wholesale_cigarette refyear if prov==11 || line wholesale_cigarette refyear if prov==12 || line wholesale_cigarette refyear if prov==13 || line wholesale_cigarette refyear if prov==24 || line wholesale_cigarette refyear if prov==35|| line wholesale_cigarette refyear if prov==46 || line wholesale_cigarette refyear if prov==47 || line wholesale_cigarette refyear if prov==48 || line wholesale_cigarette refyear if prov==59

//Also National (for all)
gen avgp_cigarette = .
replace avgp_cigarette = 0.479 if refyear==2013
replace avgp_cigarette = 0.478 if refyear==2015
replace avgp_cigarette = 0.469 if refyear==2017
line avgp_cigarette p_ecigarette p_cigars p_tobacco refyear


///MLOGIT

mlogit anyuse p_cigarette p_ecigarette p_cigars p_tobacco sex dvmarst dvurban dvage income 
*wow: results look great i.e mostly significant

mlogit anyuse p_cigarette p_ecigarette p_cigars p_tobacco sex dvmarst dvurban dvage income i.refyear i.prov, rrr
*interesting: some become insignificant, price and income coefficients become insignificant with prov-FE
 
mlogit anyuse p_cigarette p_ecigarette p_cigars p_tobacco sex dvmarst dvurban dvage income i.refyear##i.prov
*more insignificant with prov-yr FE

reg anyuse p_cigarette p_ecigarette p_cigars p_tobacco sex dvmarst dvurban dvage income, rrr
*All significant except constant!

reg anyuse p_cigarette p_ecigarette p_cigars p_tobacco sex dvmarst dvurban dvage income i.refyear##i.prov

////Add quantities
*cigarettes: ss_10 (Daily, occ, never) wp_10c (no. smoked on Wed)
*e-cigarettes: elc_110 (yes, no) elc_127 (no. of days/30 for 2017)
*cigars: tp_017 (yes, no)
*tobacco: tp_050 (yes, no)

*cigarettes: quantity_cig
*e-cigarettes: quanity_ecig
*cigars: tp_017 (yes, no)
*tobacco: tp_050 (yes, no)


//Now add to regressions
*any other variables?? 



//Educ
sum education if refyear==2013 & sex==1
sum education if refyear==2013 & sex==2
sum education if refyear==2015 & sex==1
sum education if refyear==2015 & sex==2
sum education if refyear==2017 & sex==1
sum education if refyear==2017 & sex==2
sum education if sex==1
sum education if sex==2

//Immi
sum immigrants if refyear==2013 
sum immigrants if refyear==2015
sum immigrants if refyear==2017
sum immigrants

//Emp rate
sum employment if refyear==2013 & sex==1
sum employment if refyear==2013 & sex==2
sum employment if refyear==2015 & sex==1
sum employment if refyear==2015 & sex==2
sum employment if refyear==2017 & sex==1
sum employment if refyear==2017 & sex==2
sum employment if sex==1
sum employment if sex==2

//Age
sum dvage if refyear==2013 & sex==1
sum dvage if refyear==2013 & sex==2
sum dvage if refyear==2015 & sex==1
sum dvage if refyear==2015 & sex==2
sum dvage if refyear==2017 & sex==1
sum dvage if refyear==2017 & sex==2
sum dvage if sex==1
sum dvage if sex==2

//Income
sum income if refyear==2013 & sex==1
sum income if refyear==2013 & sex==2
sum income if refyear==2015 & sex==1
sum income if refyear==2015 & sex==2
sum income if refyear==2017 & sex==1
sum income if refyear==2017 & sex==2
sum income if sex==1
sum income if sex==2

////E-cig Price contruction by province
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", clear

//Assign e-cig quantities (2017) to 2013 and 2015
*same quantity if same if, whether smoking or not with cause variation?
br pumfid prov refyear elc_127
gen quantity_ecig = .
replace quantity_ecig = elc_127 if refyear==2017
bysort pumfid (quantity_ecig): replace quantity_ecig = quantity_ecig[1]

save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", replace


//NL
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", clear
//2013
keep if prov==10 & refyear==2013
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2015
keep if prov==10 & refyear==2015
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2017
keep if prov==10 & refyear==2017
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //


//PE
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", clear
//2013
keep if prov==11 & refyear==2013
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2015
keep if prov==11 & refyear==2015
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2017
keep if prov==11 & refyear==2017
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//NS
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", clear
//2013
keep if prov==12 & refyear==2013
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2015
keep if prov==12 & refyear==2015
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2017
keep if prov==12 & refyear==2017
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //


//NB
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", clear
//2013
keep if prov==13 & refyear==2013
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2015
keep if prov==13 & refyear==2015
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2017
keep if prov==13 & refyear==2017
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//QC
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", clear
//2013
keep if prov==24 & refyear==2013
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2015
keep if prov==24 & refyear==2015
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2017
keep if prov==24 & refyear==2017
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //


//ON
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", clear
//2013
keep if prov==35 & refyear==2013
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2015
keep if prov==35 & refyear==2015
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2017
keep if prov==35 & refyear==2017
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //


//MB
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", clear
//2013
keep if prov==46 & refyear==2013
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2015
keep if prov==46 & refyear==2015
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2017
keep if prov==46 & refyear==2017
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //


//SK
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", clear
//2013
keep if prov==47 & refyear==2013
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2015
keep if prov==47 & refyear==2015
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2017
keep if prov==47 & refyear==2017
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//AB
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", clear
//2013
keep if prov==48 & refyear==2013
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2015
keep if prov==48 & refyear==2015
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2017
keep if prov==48 & refyear==2017
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //


//BC
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", clear
//2013
keep if prov==59 & refyear==2013
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2015
keep if prov==59 & refyear==2015
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //

//2017
keep if prov==59 & refyear==2017
sum wtpp     //sample obs: 
display r(sum) //population: 
//% pop rep by sample = ( / )*100 = 0.0036%

tab quantity_ecig // observations
sum quantity_ecig // days/30 

tab elc_110 //
tab elc_120 //


//graph e-cig prices

line ecig_price refyear if prov==10 || line ecig_price refyear if prov==11 || || line ecig_price refyear if prov==12 || line ecig_price refyear if prov==13 || line ecig_price refyear if prov==24 || line ecig_price refyear if prov==35|| line ecig_price refyear if prov==46 || line ecig_price refyear if prov==47 || line ecig_price refyear if prov==48 || line ecig_price refyear if prov==59
*change legend


//Regressions
//Simple
reg anyuse dvurban dvage sex dvmarst hhsize age0014 age1524 age45pl hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050 i.prov#i.refyear 
*prices significant, some prov-year significant although some omitted

reg anyuse dvurban dvage sex dvmarst hhsize hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050 i.prov i.refyear 
*prov insignificant, year omitted, mostly insignificant
*HIGH Rsq for both is good

reg anyuse dvurban dvage sex dvmarst age0014 age1524 age45pl hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050 i.prov##i.refyear
*some prov, and prov-year significant 


reg anyuse dvurban dvage sex dvmarst hhsize age0014 age1524 age45pl hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050 i.prov#i.refyear 

*****
reg anyuse dvurban dvage sex dvmarst hhsize age0014 age1524 age45pl hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050 prov#refyear 

***remove age brackets, hhsize
reg anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050 i.prov#i.refyear 
*quanity_ecig, cig insignificant, significant prices
*i think this looks best 
//reg anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050 b24.prov#i.refyear 
*quebec as base, does it matter?
outreg2 using "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/simplereg.tex"

estimates store full

reg anyuse p_cigarette ecig_price p_cigars p_tobacco quantity_cig quantity_ecig tp_017 tp_050 

 lrtest full //only for likelihood regressions!!!

Likelihood-ratio test
Assumption: . nested within full

LR chi2(33) =  74.19
Prob > chi2 = 0.0001



///demand reg: simple OLS for cigarette quantity (no. of cigarettes consumed each day on average)
reg quantity_cig dvurban dvage sex i.dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov 

*all prov-year insignificant
*better with i.prov, not without 

outreg2 using "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/cigsimplereg.tex" 

///demand reg: simple OLS for e-cigarette quantity (no. of days/30 e-cigarettes used)
reg quantity_ecig dvurban dvage sex i.dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov 

outreg2 using "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/cigsimplereg.tex" , append


//hypothesis testing
//two sided has same results as p-values
//one sided 
gen critical10 = invttail(840,0.1)
sum critical10


//XTREG: FE (prob can't cuz multiple)
xtset prov refyear, delta(2)

//MULTINOMIAL LOGIT: mlogit
mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050 i.prov#i.refyear 
**convergence not achieved, losing too much, start small

estimates store full

mlogit anyuse p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050 i.prov#i.refyear 

lrtest full

**re-starting small
mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income
*most highly significant!!

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco
*still great 

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst
*still good- some become insignificant 

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050
*now not concave, nothing except coeff for income (maybe change unit)

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig 
*now not concave

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig
*now not concave

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_ecig
*now not concave: so issue with quantities

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov#i.refyear 
*decent: see literature for help

//changing income to income in 1000s(CAD)
replace income = income*1000


//Again
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Final Thesis Dataset.dta"

//changing income to income in 1000s(CAD)
replace income = income*1000

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050 i.prov#i.refyear 

*where only income coeff in prev, none now

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov#i.refyear , iter(20)
*mostly insignificant

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco 
*great uptil here

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst
*converges but plenty insignificant

i.prov#i.refyear , iter(20)

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050
*not concave

mlogit anyuse dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov#i.refyear 
*not concave

//individual demands?
//cigarettes
reg quantity_cig dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov#i.refyear 
*plenty insignificant, not the worst

//e-cigarettes
reg quantity_ecig dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov#i.refyear 
*plenty insignificant, smaller Rsq


//with reduces categories
mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst
*improved!!

mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quantity_ecig tp_017 tp_050
*better than before but almost none significant

mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov#i.refyear 
*not concave

mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov i.refyear 
*much better, atleast some significant

mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov 
*same result as above as year was omitted
***so winner for now

mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst refyear i.prov 
*same result as above as year was omitted again


mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig i.prov 
*worked, makes cig base outcome instead of no

mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig i.prov 
*not concave

//replace 
gen quant_ecig = quantity_ecig
replace quant_ecig = 0 if quant_ecig == .
*works now

//conver

//Now both
mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig i.prov 
*not bad!!!!

//change base?
mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig i.prov, baseoutcome(0) 
*plenty insignificant



//
mixed prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income || prov:
*all except one significant!

mixed prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco || prov: 
*including price makes insignificant

mixed prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst|| prov:
*still good, prices insignificant

mixed prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig || prov:
*not bad, more insignificant

mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig i.prov 


//MULTINOMIAL LOGIT FINAL?????
mlogit prod_use dvurban sex c.dvage##i.dvmarst hwb_01 hwb_10 education immigrants employment lnincome p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov, iter(50)

//include quantities for MRS, elasticities
 mlogit prod_use dvurban sex c.dvage##i.dvmarst hwb_01 hwb_10 education immigrants employment 
> lnincome p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quantity_cig quant_e
> cig i.prov, iter(50)
*no of obs drop so only for the aforementined cause

mfx, predict (pr outcome(0)) force
mfx, predict (pr outcome(1)) force
mfx, predict (pr outcome(2)) force
mfx, predict (pr outcome(3)) force
mfx, predict (pr outcome(4)) force
mfx, predict (pr outcome(5)) force


///Nested logit
nlogitgen use = prod_use (no: 0,  smoke: 1 | 2 | 3 | 4 | 5)
New variable use is generated with 2 groups
label list lb_use
lb_use:
           1 no
           2 smoke
		   
		   
nlogittree prod_use use

Tree structure specified for the nested logit model

 use     N       prod_use       N  
-----------------------------------
 no    25084 --- No           25084
 smoke 19062 --- Cigarette +   2866
              |- E-cigarett~+  4286
              |- Cigarette ~+  2374
              |- Cigar         6662
              +- Tobacco + ~s  2874
-----------------------------------
                       Total  44146
		   

nlogittree prod_use use, choice(prod_use)

Tree structure specified for the nested logit model

 use     N       prod_use       N     k  
-----------------------------------------
 no    25084 --- No           25084     0
 smoke 19062 --- Cigarette +   2866  2866
              |- E-cigarett~+  4286  4286
              |- Cigarette ~+  2374  2374
              |- Cigar         6662  6662
              +- Tobacco + ~s  2874  2874
-----------------------------------------
                       Total  44146 19062

k = number of times alternative is chosen
N = number of observations at each level


nlogitgen type = prod_use (cig: 1, ecig: 2, cigecig: 3, cigar: 4, tobmore: 5)

nlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income || use: p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig || prod_use:, case(prov)
*no cases remain after removing invalid observations

nlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income || use: p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig || prod_use:, case(pumfid)


gen id=_n

nlogittree prod_use type, choice(use) case(pumfid) 

Tree structure specified for the nested logit model

 type     N       prod_use      N     k  
-----------------------------------------
 cig     2866 --- Cigarette +  2866  2866
 ecig    4286 --- E-cigarett~+ 4286  4286
 cigecig 2374 --- Cigarette ~+ 2374  2374
 cigar   6662 --- Cigar        6662  6662
 tobmore 2874 --- Tobacco + ~s 2874  2874
-----------------------------------------
                       Total  19062 19062

k = number of times alternative is chosen
N = number of observations at each level

Note: At least one case has replicated
      alternatives; nlogit will not allow this.
Note: At least one case has only one alternative;
      nlogit will drop these cases.
Note: At least one case has no or multiple
      choices; nlogit will drop these cases.

. gen id=_n

. nlogittree prod_use type, choice(use) case(id) 

Tree structure specified for the nested logit model

 type     N       prod_use      N     k  
-----------------------------------------
 cig     2866 --- Cigarette +  2866  2866
 ecig    4286 --- E-cigarett~+ 4286  4286
 cigecig 2374 --- Cigarette ~+ 2374  2374
 cigar   6662 --- Cigar        6662  6662
 tobmore 2874 --- Tobacco + ~s 2874  2874
-----------------------------------------
                       Total  19062 19062

k = number of times alternative is chosen
N = number of observations at each level

Note: At least one case has only one alternative;
      nlogit will drop these cases.
Note: At least one case has no or multiple
      choices; nlogit will drop these cases.

gen use = .
replace use = 0 if prod_use == 0
replace use = 1 if use == .
 
 
nlogit use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income || type: p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig || prod_use:, case(pumfid)


save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Final Thesis Dataset.dta", replace




//Reshape for nlogit
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Final Thesis Dataset.dta", clear 

*recreate pumdfid-year
reshape long prod_use, i(pumfid-year) j(new)


//will have to recreate use above (?) 





//IVs in MNL
use  "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Final Thesis Dataset.dta", clear


webuse sysdsn3
gen instrument = age + runiform()
cmp setup
cmp (insure = age male nonwhite site2 site3, iia) (age = instrument male nonwhite site2 site3) , nolr ind($cmp_mprobit $cmp_cont)






cmp (prod_use = dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig i.prov, iia) (p_cigarette p_cigarette p_cigars p_tobacco= adexposure ), ind ($cmp_mprobit $cmp_cont)



//Gives Results
//Start Interpreting


mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment lnincome p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig i.prov, rrr 

testparm i.prov
   chi2( 45) =  103.83
         Prob > chi2 =    0.0000

		 
testparm hwb_01 
    chi2(  5) =   18.50
         Prob > chi2 =    0.0024
		 
estimates store full

mlogit prod_use p_cigarette ecig_price p_cigars p_tobacco quant_ecig quantity_cig  		 
lrtest full , force
observations differ: 5713 vs. 5742

 lrtest full , force

Likelihood-ratio test
Assumption: . nested within full

LR chi2(110) = 1793.96
 Prob > chi2 =  0.0000

		 

mlogit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment lnincome p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig i.prov , baseoutcome(0) rrr



//Final MLOGIT Regression (try year once, remove if doesn't work)
*nested: for nlogit
save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Nested Thesis Dataset.dta"
*usual: for OLS, mlogit
use  "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Final Thesis Dataset.dta", clear

mlogit prod_use dvurban dvage sex i.dvmarst hwb_01 hwb_10 education immigrants employment lnincome p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov, rrr 

outreg2 using "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/final mlogit.tex"

*better than ever

mlogit prod_use dvurban dvage##i.dvmarst sex hwb_01 hwb_10 education immigrants employment lnincome p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov, rrr 

outreg2 using "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/interact mlogit.tex"


//Marginal effects
mfx, predict (pr outcome(0)) force

Marginal effects after mlogit
      y  =  (predict, pr outcome(0))
         =  .62347984
------------------------------------------------------------------------------
variable |      dy/dx    Std. err.     z    P>|z|  [    95% C.I.   ]      X
---------+--------------------------------------------------------------------
 dvurban |  -.0181666      .00614   -2.96   0.003  -.030194 -.006139   1.27804
   dvage |   .0005873      .00043    1.37   0.169   -.00025  .001425   37.7137
     sex |   .2382176      .02863    8.32   0.000   .182098  .294337   1.53646
 dvmarst |   .0342974        .004    8.58   0.000   .026462  .042133   2.04872
  hwb_01 |  -.0313186      .00489   -6.40   0.000  -.040912 -.021725   2.18011
  hwb_10 |  -.0428551       .0034  -12.61   0.000  -.049516 -.036194   1.98312
educat~n |  -.0005786      .00139   -0.42   0.678  -.003307   .00215   51.6251
immigr~s |   .0350423      .08241    0.43   0.671  -.126485  .196569   .090261
employ~t |   .0056613      .00177    3.20   0.001   .002189  .009134   60.3783
lnincome |  -.1703452      .06131   -2.78   0.005  -.290516 -.050174   10.4184
p_ciga~e |  -.3692114      .30883   -1.20   0.232  -.974506  .236083   .474606
ecig_p~e |    -.06872      .03565   -1.93   0.054  -.138585  .001145   .369512
p_cigars |  -1.047427      .39543   -2.65   0.008  -1.82245 -.272407   .700683
p_toba~o |   5.532652     1.50157    3.68   0.000   2.58963  8.47567    .30743
tax_ci~e |   .1326362      .28353    0.47   0.640  -.423064  .688336   .216223
     gst |   .0006389      .00984    0.06   0.948  -.018638  .019916   9.24183
     pst |  -.0019376      .00886   -0.22   0.827  -.019306  .015431   3.30127
------------------------------------------------------------------------------

mfx, predict (pr outcome(1)) force
Marginal effects after mlogit
      y  =  (predict, pr outcome(1))
         =  .08939085
------------------------------------------------------------------------------
variable |      dy/dx    Std. err.     z    P>|z|  [    95% C.I.   ]      X
---------+--------------------------------------------------------------------
 dvurban |   .0124408       .0042    2.96   0.003   .004213  .020669   1.27804
   dvage |   .0010696      .00022    4.84   0.000   .000636  .001503   37.7137
     sex |  -.0042497      .01699   -0.25   0.803  -.037552  .029053   1.53646
 dvmarst |   .0005126      .00212    0.24   0.809  -.003638  .004663   2.04872
  hwb_01 |   .0210645      .00426    4.94   0.000   .012708  .029421   2.18011
  hwb_10 |   .0103776      .00269    3.85   0.000   .005098  .015657   1.98312
educat~n |   .0003795      .00089    0.43   0.670  -.001368  .002127   51.6251
immigr~s |  -.0149819      .05511   -0.27   0.786  -.122988  .093024   .090261
employ~t |   .0006051      .00116    0.52   0.603  -.001676  .002887   60.3783
lnincome |   .0686644      .04305    1.60   0.111  -.015707  .153036   10.4184
p_ciga~e |   .4711008      .25001    1.88   0.060  -.018912  .961113   .474606
ecig_p~e |   .0301251      .02326    1.30   0.195  -.015455  .075705   .369512
p_cigars |  -.1906759      .27605   -0.69   0.490  -.731726  .350374   .700683
p_toba~o |  -1.138172      .97249   -1.17   0.242  -3.04422   .76788    .30743
tax_ci~e |   .1128503        .194    0.58   0.561  -.267375  .493075   .216223
     gst |  -.0018294      .00673   -0.27   0.786  -.015024  .011365   9.24183
     pst |  -.0006046      .00596   -0.10   0.919  -.012288  .011079   3.30127
------------------------------------------------------------------------------

mfx, predict (pr outcome(2)) force
Marginal effects after mlogit
      y  =  (predict, pr outcome(2))
         =  .05239468
------------------------------------------------------------------------------
variable |      dy/dx    Std. err.     z    P>|z|  [    95% C.I.   ]      X
---------+--------------------------------------------------------------------
 dvurban |   -.004637      .00216   -2.15   0.031  -.008862 -.000412   1.27804
   dvage |  -.0025024      .00046   -5.43   0.000  -.003406 -.001599   37.7137
     sex |  -.0368713      .01012   -3.64   0.000  -.056712 -.017031   1.53646
 dvmarst |   .0020196      .00128    1.58   0.114  -.000486  .004525   2.04872
  hwb_01 |   .0009204      .00117    0.79   0.430  -.001366  .003207   2.18011
  hwb_10 |   .0096824      .00204    4.75   0.000   .005683  .013682   1.98312
educat~n |   .0003398       .0005    0.68   0.497  -.000641  .001321   51.6251
immigr~s |  -.0398558      .02434   -1.64   0.101  -.087555  .007844   .090261
employ~t |  -.0008939      .00058   -1.53   0.125  -.002036  .000248   60.3783
lnincome |  -.0032142      .01901   -0.17   0.866  -.040478  .034049   10.4184
p_ciga~e |  -.0081755       .1101   -0.07   0.941  -.223973  .207622   .474606
ecig_p~e |   .0043084      .01289    0.33   0.738  -.020948  .029564   .369512
p_cigars |   .7102171      .14404    4.93   0.000   .427911  .992523   .700683
p_toba~o |  -1.361926      .45854   -2.97   0.003  -2.26065 -.463197    .30743
tax_ci~e |  -.1000295       .0916   -1.09   0.275  -.279554  .079495   .216223
     gst |   .0062856      .00256    2.46   0.014   .001271    .0113   9.24183
     pst |   .0062948      .00238    2.65   0.008   .001632  .010958   3.30127
------------------------------------------------------------------------------


mfx, predict (pr outcome(3)) force 
Marginal effects after mlogit
      y  =  (predict, pr outcome(3))
         =  .04895341
------------------------------------------------------------------------------
variable |      dy/dx    Std. err.     z    P>|z|  [    95% C.I.   ]      X
---------+--------------------------------------------------------------------
 dvurban |  -.0042805      .00252   -1.70   0.090  -.009227  .000666   1.27804
   dvage |  -.0009624      .00022   -4.39   0.000  -.001392 -.000533   37.7137
     sex |  -.0295044       .0114   -2.59   0.010  -.051857 -.007152   1.53646
 dvmarst |   .0012064      .00134    0.90   0.369  -.001424  .003837   2.04872
  hwb_01 |   .0201422      .00456    4.42   0.000   .011205   .02908   2.18011
  hwb_10 |   .0099207      .00245    4.04   0.000   .005109  .014732   1.98312
educat~n |   .0011614      .00066    1.76   0.079  -.000133  .002456   51.6251
immigr~s |  -.0066101      .03402   -0.19   0.846  -.073294  .060074   .090261
employ~t |  -.0009507      .00071   -1.35   0.178  -.002333  .000431   60.3783
lnincome |  -.0264515      .02351   -1.13   0.261  -.072527  .019624   10.4184
p_ciga~e |  -.2266893      .10521   -2.15   0.031  -.432893 -.020486   .474606
ecig_p~e |  -.0005454      .01475   -0.04   0.970  -.029449  .028358   .369512
p_cigars |   .5913648      .15393    3.84   0.000   .289664  .893065   .700683
p_toba~o |  -1.885087      .58392   -3.23   0.001  -3.02956 -.740619    .30743
tax_ci~e |  -.1050707      .11379   -0.92   0.356  -.328094  .117953   .216223
     gst |  -.0044396      .00455   -0.98   0.329  -.013348  .004469   9.24183
     pst |  -.0024676      .00388   -0.64   0.525  -.010077  .005142   3.30127
------------------------------------------------------------------------------

mfx, predict (pr outcome(4)) force
Marginal effects after mlogit
      y  =  (predict, pr outcome(4))
         =  .13616268
------------------------------------------------------------------------------
variable |      dy/dx    Std. err.     z    P>|z|  [    95% C.I.   ]      X
---------+--------------------------------------------------------------------
 dvurban |     .00016      .00376    0.04   0.966  -.007208  .007528   1.27804
   dvage |   .0016639      .00023    7.37   0.000   .001221  .002107   37.7137
     sex |  -.0622729       .0175   -3.56   0.000   -.09657 -.027976   1.53646
 dvmarst |  -.0278894      .00373   -7.48   0.000  -.035196 -.020583   2.04872
  hwb_01 |  -.0133014      .00268   -4.96   0.000  -.018558 -.008045   2.18011
  hwb_10 |   .0066918      .00227    2.95   0.003   .002248  .011136   1.98312
educat~n |  -.0010189       .0009   -1.13   0.260  -.002792  .000755   51.6251
immigr~s |   .0095481       .0557    0.17   0.864   -.09962  .118716   .090261
employ~t |  -.0033657      .00113   -2.98   0.003  -.005579 -.001152   60.3783
lnincome |   .1209016      .04447    2.72   0.007   .033748  .208055   10.4184
p_ciga~e |  -.0224214      .18967   -0.12   0.906  -.394158  .349316   .474606
ecig_p~e |   .0268473      .02296    1.17   0.242  -.018146  .071841   .369512
p_cigars |   .1016372      .24409    0.42   0.677  -.376763  .580038   .700683
p_toba~o |  -1.625353        .942   -1.73   0.084  -3.47165   .22094    .30743
tax_ci~e |   .1101754      .19294    0.57   0.568  -.267989   .48834   .216223
     gst |   .0030895      .00631    0.49   0.625  -.009283  .015462   9.24183
     pst |    .001337      .00584    0.23   0.819  -.010114  .012788   3.30127
------------------------------------------------------------------------------



mfx, predict (pr outcome(5)) force
Marginal effects after mlogit
      y  =  (predict, pr outcome(5))
         =  .04961853
------------------------------------------------------------------------------
variable |      dy/dx    Std. err.     z    P>|z|  [    95% C.I.   ]      X
---------+--------------------------------------------------------------------
 dvurban |   .0144832      .00386    3.75   0.000   .006913  .022054   1.27804
   dvage |    .000144      .00007    1.97   0.048   9.6e-07  .000287   37.7137
     sex |  -.1053193      .02506   -4.20   0.000  -.154433 -.056206   1.53646
 dvmarst |  -.0101466      .00259   -3.91   0.000  -.015232 -.005061   2.04872
  hwb_01 |   .0024929      .00134    1.86   0.063  -.000139  .005125   2.18011
  hwb_10 |   .0061825      .00183    3.37   0.001   .002592  .009773   1.98312
educat~n |  -.0002831      .00072   -0.39   0.693   -.00169  .001124   51.6251
immigr~s |   .0168574      .03722    0.45   0.651  -.056097  .089812   .090261
employ~t |  -.0010561      .00076   -1.38   0.166  -.002551  .000439   60.3783
lnincome |   .0104448      .02856    0.37   0.715  -.045531  .066421   10.4184
p_ciga~e |   .1553968      .13518    1.15   0.250  -.109549  .420342   .474606
ecig_p~e |   .0079846      .01551    0.51   0.607  -.022413  .038382   .369512
p_cigars |  -.1651167      .18182   -0.91   0.364  -.521477  .191244   .700683
p_toba~o |   .4778867      .69304    0.69   0.490  -.880448  1.83622    .30743
tax_ci~e |  -.1505617       .1122   -1.34   0.180   -.37047  .069346   .216223
     gst |  -.0037449      .00476   -0.79   0.432  -.013076  .005587   9.24183
     pst |  -.0026219      .00408   -0.64   0.521  -.010628  .005384   3.30127
------------------------------------------------------------------------------


//Predicted probability
predict pmlogit0 pmlogit1 pmlogit2 pmlogit3 pmlogit4 pmlogit5, pr
summarize pmlogit0 pmlogit1 pmlogit2 pmlogit3 pmlogit4 pmlogit5
   Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
    pmlogit0 |     43,968    .5679358    .1421946   .1610328    .848237
    pmlogit1 |     43,968    .0647971    .0359996   .0152591   .3377127
    pmlogit2 |     43,968    .0973663    .0792386   .0016419   .4559035
    pmlogit3 |     43,968    .0538119    .0359022   .0042108   .3644858
    pmlogit4 |     43,968    .1510872    .0760549   .0293282   .5045437
-------------+---------------------------------------------------------
    pmlogit5 |     43,968    .0650018    .0671254   .0023685   .3741489

//LRtest
mlogit prod_use dvurban dvage sex i.dvmarst hwb_01 hwb_10 education immigrants employment lnincome p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst i.prov

estimates store full
mlogit prod_use
 lrtest full, force

Likelihood-ratio test
Assumption: . nested within full

LR chi2(135) = 11064.17
 Prob > chi2 =   0.0000


ivregress liml prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig i.prov (ecig_price  = adexposure), first

		 
ivprobit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig (ecig_price = adexposure) i.prov, first		
*mostly significant
 
 
cmmprobit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig (ecig_price = adexposure) i.prov, first 

ivprobit prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment income p_cigarette p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig (ecig_price = adexposure) i.prov, twostep first		
*not great


///////////////////
////Nested Logit
*usual: for OLS, mlogit
use  "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Final Thesis Dataset.dta", clear
*nested: for nlogit
save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Nested Thesis Dataset.dta"

//Reshape 
*recreate pumdfid-year
gen prefid = pumfid*(10000) + refyear
drop prefid

tostring pumfid refyear, gen (pumfid_str refyear_str)

*extract last digit of year 
gen yr_str = substr(refyear_str,-1,.)

gen prefid = pumfid_str + yr_str

rename prefid prefid_str

destring prefid_str, gen(prefid)

save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Nested Thesis Dataset.dta", replace

*generate separete categories first
drop prodno prodcig prodecig prodcigecig prodcigar prodother

gen prodno = .
replace prodno = 1 if prod_use==0
replace prodno = 0 if prodno==.

gen prodcig = .
replace prodcig = 1 if prod_use==1
replace prodcig = 0 if prodcig==.

gen prodecig = .
replace prodecig = 1 if prod_use==2
replace prodecig = 0 if prodecig==.

gen prodcigecig = .
replace prodcigecig = 1 if prod_use==3
replace prodcigecig = 0 if prodcigecig==.

gen prodcigar = .
replace prodcigar = 1 if prod_use==4
replace prodcigar = 0 if prodcigar==.

gen prodother = .
replace prodother = 1 if prod_use==5
replace prodother = 0 if prodother==.

**variable prodtob contains all missing values

//again
drop prodno prodcig prodecig prodcigecig prodcigar prodother

gen prodno = "No"

gen prodcig = "Cigarette"

gen prodecig = "E-cigarette"

gen prodcigecig = "Cig & E-cig"

gen prodcigar = "Cigar"

gen prodother = "Other"
**maybe drop once satisfied

rename Y prod_use

//OR copy x 6, gen type
expand 6

sort refyear prefid 

egen seq = fill (0 1 2 3 4 5 0 1 2 3 4 5)

drop type1

gen type1 = seq

label define type1 0 "No" 1 "Cigarette" 2 "E-cigarette" 3 "Cig & E-cig" 4 "Cigar" 5 "Other"

label values type1 type1

drop type 
rename type1 type

//gen choice (0/1)
gen choice = . 
replace choice = 1 if prod_use==0 & seq==0
replace choice = 1 if prod_use==1 & seq==1
replace choice = 1 if prod_use==2 & seq==2
replace choice = 1 if prod_use==3 & seq==3
replace choice = 1 if prod_use==4 & seq==4
replace choice = 1 if prod_use==5 & seq==5
replace choice = 0 if choice == .

drop use
rename type use 

save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Nested Thesis Dataset.dta", replace


//Nlogit
list prefid income type choice in 1/12, sepby (prefid)

*gen produse = prod_use

*label drop lb_use

nlogitgen typesmoke = use (no:0, smoke: 1 | 2 | 3 | 4 | 5)

New variable typesmoke is generated with 2 groups
label list lb_typesmoke
lb_typesmoke:
           1 no
           2 smoke


nlogittree use typesmoke, choice(choice) case(prefid)

Tree structure specified for the nested logit model

 typesmoke   N        use           N     k  
---------------------------------------------
 no         44146 --- No          44146 25084
 smoke     220730 --- Cigarette   44146  2866
                   |- E-cigarette 44146  4286
                   |- Cig & E-cig 44146  2374
                   |- Cigar       44146  6662
                   +- Other       44146  2874
---------------------------------------------
                          Total  264876 44146

k = number of times alternative is chosen
N = number of observations at each level

Note: At least one case has only one alternative;
      nlogit will drop these cases.


//nlogit regression
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Nested Thesis Dataset.dta", clear	  

nlogit choice dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment || typesmoke: lnincome p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst, base(no) || use:, case(prefid) 
, constraints (1)
* variable dvurban is not alternative-specific; it has no within-case variability
* last bit for dissimilarity parameter/ degenerate nest


nlogit chosen cost distance rating || type: income kids, base(family) || restaurant:, noconst case(family_id)

//gen w/in case variation
gen cost = 0 if seq==0 & choice==1 
replace cost = p_cigarette if seq==1 & choice==1 
replace cost = ecig_price if seq==2 & choice==1 
replace cost = p_cigarette+ecig_price if seq==3 & choice==1 
replace cost = p_cigars if seq==4 & choice==1 
replace cost = p_tobacco if seq==5 & choice==1 
replace cost = 0 if cost == .
drop cost

gen cost = 0 if seq==0 
replace cost = p_cigarette if seq==1 
replace cost = ecig_price if seq==2 
replace cost = p_cigarette+ecig_price if seq==3 
replace cost = p_cigars if seq==4 
replace cost = p_tobacco if seq==5 

gen tax = 0 if seq==0 
replace tax = tax_cigarette + ((gst/100)*cost)+((pst/100)*cost) if seq==1 
replace tax = ((gst/100)*cost)+((pst/100)*cost) if seq==2
replace tax = ((gst/100)*cost)+((pst/100)*cost) if seq==3 
replace tax = ((gst/100)*cost)+((pst/100)*cost) if seq==4 
replace tax = ((gst/100)*cost)+((pst/100)*cost) if seq==5 

***60 iter and going
nlogit choice cost tax || typesmoke: lnincome dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment gst pst, base(no) || use:, case(prefid)

, constraints (1) 

//Now try
nlogit choice cost tax || typesmoke: lnincome dvurban dvage sex dvmarst  education immigrants employment, base(no) || use:, case(prefid) difficult iterate(50) 

note: branch 1 of level 1 is degenerate and the associated dissimilarity parameter
      [/typesmoke]no_tau is not defined; see help nlogit for details.

Tree structure specified for the nested logit model

 typesmoke   N        use           N     k  
---------------------------------------------
 no         44146 --- No          44146 25084
 smoke     220730 --- Cigarette   44146  2866
                   |- E-cigarette 44146  4286
                   |- Cig & E-cig 44146  2374
                   |- Cigar       44146  6662
                   +- Other       44146  2874
---------------------------------------------
                          Total  264876 44146

k = number of times alternative is chosen
N = number of observations at each level

RUM-consistent nested logit regression         Number of obs      =    264,876
Case variable: prefid                          Number of cases    =      44146

Alternative variable: use                      Alts per case: min =          6
                                                              avg =        6.0
                                                              max =          6

                                                  Wald chi2(10)   =    2751.85
Log likelihood =  -57961.67                       Prob > chi2     =     0.0000

------------------------------------------------------------------------------
      choice | Coefficient  Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
use          |
        cost |  -.8265893   .3710279    -2.23   0.026    -1.553791   -.0993881
         tax |   1.608404   .8628534     1.86   0.062    -.0827581    3.299565
------------------------------------------------------------------------------
typesmoke equations
------------------------------------------------------------------------------
no           |
    lnincome |          0  (base)
     dvurban |          0  (base)
       dvage |          0  (base)
         sex |          0  (base)
     dvmarst |          0  (base)
   education |          0  (base)
  immigrants |          0  (base)
  employment |          0  (base)
-------------+----------------------------------------------------------------
smoke        |
    lnincome |   .4323044   .1197409     3.61   0.000     .1976166    .6669923
     dvurban |   .0687842    .022625     3.04   0.002       .02444    .1131285
       dvage |  -.0004839   .0005665    -0.85   0.393    -.0015942    .0006264
         sex |  -.5613404   .0486961   -11.53   0.000     -.656783   -.4658977
     dvmarst |  -.0996309   .0125022    -7.97   0.000    -.1241347    -.075127
   education |  -.0198585   .0017493   -11.35   0.000     -.023287   -.0164299
  immigrants |   .2928918   .1275857     2.30   0.022     .0428285    .5429551
  employment |   .0035561   .0033136     1.07   0.283    -.0029384    .0100505
------------------------------------------------------------------------------
use equations
------------------------------------------------------------------------------
No           |
       _cons |          0  (base)
-------------+----------------------------------------------------------------
Cigarette    |
       _cons |  -8.529855    4.52882    -1.88   0.060    -17.40618    .3464694
-------------+----------------------------------------------------------------
E_cigarette  |
       _cons |  -7.088568   3.647007    -1.94   0.052    -14.23657    .0594336
-------------+----------------------------------------------------------------
Cig___E_cig  |
       _cons |  -8.493458    4.72047    -1.80   0.072    -17.74541    .7584938
-------------+----------------------------------------------------------------
Cigar        |
       _cons |  -5.607205   2.736919    -2.05   0.040    -10.97147   -.2429418
-------------+----------------------------------------------------------------
Other        |
       _cons |  -8.277338     4.4427    -1.86   0.062    -16.98487    .4301946
------------------------------------------------------------------------------
dissimilarity parameters
------------------------------------------------------------------------------
/typesmoke   |
      no_tau |          1          .                             .           .
   smoke_tau |   2.883408   2.046357                     -1.127378    6.894194
------------------------------------------------------------------------------
LR test for IIA (tau=1): chi2(1) = 1.81                   Prob > chi2 = 0.1788


RUM-consistent nested logit regression         Number of obs      =    264,876
Case variable: prefid                          Number of cases    =      44146

Alternative variable: use                      Alts per case: min =          6
                                                              avg =        6.0
                                                              max =          6

                                                  Wald chi2(13)   =   37938.85
Log likelihood = -57634.779                       Prob > chi2     =     0.0000

 ( 1)  [/typesmoke]no_tau = 1
-----------------------------------------------------------------------------------------
                 choice | Coefficient  Std. err.      z    P>|z|     [95% conf. interval]
------------------------+----------------------------------------------------------------
use                     |
                   cost |  -.8413221   .3711529    -2.27   0.023    -1.568768   -.1138757
                    tax |    1.39288   .8157534     1.71   0.088    -.2059671    2.991728
-----------------------------------------------------------------------------------------
typesmoke equations    
-----------------------------------------------------------------------------------------
no                      |
               lnincome |          0  (base)
                dvurban |          0  (base)
                  dvage |          0  (base)
             1b.dvmarst |          0  (base)
              2.dvmarst |          0  (base)
              3.dvmarst |          0  (base)
    1b.dvmarst#co.dvage |          0  (base)
      2.dvmarst#c.dvage |          0  (base)
      3.dvmarst#c.dvage |          0  (base)
                    sex |          0  (base)
                dvmarst |          0  (base)
              education |          0  (base)
             immigrants |          0  (base)
             employment |          0  (base)
------------------------+----------------------------------------------------------------
smoke                   |
               lnincome |   .3300875    .119345     2.77   0.006     .0961755    .5639995
                dvurban |   .0833829   .0228097     3.66   0.000     .0386767    .1280891
                  dvage |  -.0071854    .000858    -8.37   0.000    -.0088671   -.0055037
                        |
                dvmarst |
Widowed/Divorced/Sep~d  |   4.149836   .1321713    31.40   0.000     3.890785    4.408887
 Single, never married  |   3.599904          .        .       .            .           .
                        |
        dvmarst#c.dvage |
Widowed/Divorced/Sep~d  |  -.0269367   .0021918   -12.29   0.000    -.0312325   -.0226409
 Single, never married  |   .0258946   .0014699    17.62   0.000     .0230136    .0287757
                        |
                    sex |  -.6240674   .0485199   -12.86   0.000    -.7191647   -.5289702
                dvmarst |  -2.289617   .0270877   -84.53   0.000    -2.342708   -2.236526
              education |  -.0184038   .0017711   -10.39   0.000    -.0218751   -.0149325
             immigrants |  -.0254815   .1304471    -0.20   0.845    -.2811531    .2301901
             employment |   .0065939   .0033128     1.99   0.047      .000101    .0130869
-----------------------------------------------------------------------------------------
use equations          
-----------------------------------------------------------------------------------------
No                      |
                  _cons |          0  (base)
------------------------+----------------------------------------------------------------
Cigarette               |
                  _cons |    -5.1421   4.542015    -1.13   0.258    -14.04429    3.760086
------------------------+----------------------------------------------------------------
E_cigarette             |
                  _cons |  -3.736283   3.667766    -1.02   0.308    -10.92497    3.452406
------------------------+----------------------------------------------------------------
Cig___E_cig             |
                  _cons |  -5.145664   4.765874    -1.08   0.280    -14.48661    4.195278
------------------------+----------------------------------------------------------------
Cigar                   |
                  _cons |  -2.222391   2.733046    -0.81   0.416    -7.579063    3.134281
------------------------+----------------------------------------------------------------
Other                   |
                  _cons |  -4.943419   4.483426    -1.10   0.270    -13.73077    3.843934
-----------------------------------------------------------------------------------------
dissimilarity parameters
-----------------------------------------------------------------------------------------
/typesmoke              |
                 no_tau |          1  (constrained)
              smoke_tau |      2.924   2.098621                     -1.189221    7.037222
-----------------------------------------------------------------------------------------
LR test for IIA (tau=1): chi2(1) = 1.84                   Prob > chi2 = 0.1747
Warning: Convergence not achieved.

outreg2 using "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/nlogit int.tex"

hwb_01 hwb_10


constraint 1 [/typesmoke]no_tau = 1
///same result as above
nlogit choice cost tax || typesmoke: lnincome dvurban dvage sex dvmarst  education immigrants employment, base(no) || use:, case(prefid) difficult iterate(50) constraint(1)

RUM-consistent nested logit regression         Number of obs      =    264,876
Case variable: prefid                          Number of cases    =      44146

Alternative variable: use                      Alts per case: min =          6
                                                              avg =        6.0
                                                              max =          6

                                                  Wald chi2(10)   =    2751.85
Log likelihood =  -57961.67                       Prob > chi2     =     0.0000

 ( 1)  [/typesmoke]no_tau = 1
------------------------------------------------------------------------------
      choice | Coefficient  Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
use          |
        cost |  -.8265893   .3710279    -2.23   0.026    -1.553791   -.0993881
         tax |   1.608404   .8628534     1.86   0.062    -.0827581    3.299565
------------------------------------------------------------------------------
typesmoke equations
------------------------------------------------------------------------------
no           |
    lnincome |          0  (base)
     dvurban |          0  (base)
       dvage |          0  (base)
         sex |          0  (base)
     dvmarst |          0  (base)
   education |          0  (base)
  immigrants |          0  (base)
  employment |          0  (base)
-------------+----------------------------------------------------------------
smoke        |
    lnincome |   .4323044   .1197409     3.61   0.000     .1976166    .6669923
     dvurban |   .0687842    .022625     3.04   0.002       .02444    .1131285
       dvage |  -.0004839   .0005665    -0.85   0.393    -.0015942    .0006264
         sex |  -.5613404   .0486961   -11.53   0.000     -.656783   -.4658977
     dvmarst |  -.0996309   .0125022    -7.97   0.000    -.1241347    -.075127
   education |  -.0198585   .0017493   -11.35   0.000     -.023287   -.0164299
  immigrants |   .2928918   .1275857     2.30   0.022     .0428285    .5429551
  employment |   .0035561   .0033136     1.07   0.283    -.0029384    .0100505
------------------------------------------------------------------------------
use equations
------------------------------------------------------------------------------
No           |
       _cons |          0  (base)
-------------+----------------------------------------------------------------
Cigarette    |
       _cons |  -8.529855    4.52882    -1.88   0.060    -17.40618    .3464694
-------------+----------------------------------------------------------------
E_cigarette  |
       _cons |  -7.088568   3.647007    -1.94   0.052    -14.23657    .0594336
-------------+----------------------------------------------------------------
Cig___E_cig  |
       _cons |  -8.493458    4.72047    -1.80   0.072    -17.74541    .7584938
-------------+----------------------------------------------------------------
Cigar        |
       _cons |  -5.607205   2.736919    -2.05   0.040    -10.97147   -.2429418
-------------+----------------------------------------------------------------
Other        |
       _cons |  -8.277338     4.4427    -1.86   0.062    -16.98487    .4301946
------------------------------------------------------------------------------
dissimilarity parameters
------------------------------------------------------------------------------
/typesmoke   |
      no_tau |          1  (constrained)
   smoke_tau |   2.883408   2.046357                     -1.127378    6.894194
------------------------------------------------------------------------------
LR test for IIA (tau=1): chi2(1) = 1.81                   Prob > chi2 = 0.1788

outreg2 using "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/nlogit.tex"


//Next: & ivregress (maybe even 2sls??)
ivregress liml choice lnincome dvurban dvage sex dvmarst  education immigrants employment (cost=tax i.prov), first
First-stage regressions
-----------------------

                                                       Number of obs = 264,876
                                                       F(18, 264857) = 3563.96
                                                       Prob > F      =  0.0000
                                                       R-squared     =  0.1950
                                                       Adj R-squared =  0.1949
                                                       Root MSE      =  0.2528

------------------------------------------------------------------------------------
              cost | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------------+----------------------------------------------------------------
          lnincome |   .0799176   .0069321    11.53   0.000     .0663308    .0935044
           dvurban |   .0001827   .0011319     0.16   0.872    -.0020358    .0024012
             dvage |  -.0000124    .000028    -0.44   0.657    -.0000673    .0000424
               sex |   .0366425   .0048303     7.59   0.000     .0271752    .0461097
           dvmarst |  -.0008852   .0006213    -1.42   0.154     -.002103    .0003325
         education |   -.000305   .0002422    -1.26   0.208    -.0007796    .0001697
        immigrants |  -.1075905   .0072513   -14.84   0.000    -.1218029   -.0933782
        employment |   .0010345   .0003321     3.12   0.002     .0003837    .0016854
               tax |   1.313383   .0053488   245.55   0.000     1.302899    1.323866
                   |
              prov |
prince edward i..  |   .0086419   .0049754     1.74   0.082    -.0011098    .0183935
      nova scotia  |  -.0001942   .0040821    -0.05   0.962    -.0081949    .0078066
    new brunswick  |   .0057627   .0035493     1.62   0.104    -.0011938    .0127192
           quebec  |  -.0002191   .0042207    -0.05   0.959    -.0084916    .0080534
          ontario  |    .047958   .0064491     7.44   0.000      .035318     .060598
         manitoba  |   .0491462   .0051274     9.59   0.000     .0390967    .0591957
     saskatchewan  |   .0172999   .0050568     3.42   0.001     .0073887    .0272111
          alberta  |   .0301657   .0067453     4.47   0.000     .0169451    .0433864
 british columbia  |   .0368513   .0051709     7.13   0.000     .0267165    .0469861
                   |
             _cons |  -.6163843   .0771593    -7.99   0.000    -.7676145   -.4651542
------------------------------------------------------------------------------------


Instrumental variables LIML regression            Number of obs   =    264,876
                                                  Wald chi2(9)    =   15435.66
                                                  Prob > chi2     =     0.0000
                                                  R-squared       =     0.0757
                                                  Root MSE        =     .35829

------------------------------------------------------------------------------
      choice | Coefficient  Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
        cost |  -.7064597   .0056862  -124.24   0.000    -.7176045   -.6953149
    lnincome |   .0455182   .0071428     6.37   0.000     .0315185    .0595178
     dvurban |  -.0000597   .0015886    -0.04   0.970    -.0031733    .0030538
       dvage |  -.0000208   .0000396    -0.53   0.599    -.0000985    .0000568
         sex |   .0101439    .002975     3.41   0.001     .0043131    .0159747
     dvmarst |   .0002102   .0008763     0.24   0.810    -.0015073    .0019277
   education |   .0008311   .0001195     6.95   0.000     .0005968    .0010653
  immigrants |   -.087038   .0085859   -10.14   0.000    -.1038661   -.0702099
  employment |   .0010541   .0002194     4.80   0.000      .000624    .0014842
       _cons |  -.1039293   .0691089    -1.50   0.133    -.2393803    .0315218
------------------------------------------------------------------------------
Instrumented: cost
 Instruments: lnincome dvurban dvage sex dvmarst education immigrants
              employment tax 11.prov 12.prov 13.prov 24.prov 35.prov 46.prov
              47.prov 48.prov 59.prov


//Second stage
nlogit choice tax || typesmoke: lnincome dvurban dvage sex dvmarst  education immigrants employment, base(no) || use:, case(prefid) difficult iterate(50) constraint(1) vce(bootstrap)

//w/o prov
ivregress liml choice lnincome dvurban dvage sex dvmarst  education immigrants employment (cost=tax), first

//interact
ivregress liml choice lnincome dvurban dvage sex dvmarst  education immigrants employment (cost=c.tax##i.prov), first

predict taxhat0
predict provhat

//interact
gen taxprovhat = taxhat0*provhat

nlogit choice taxhat0 taxprovhat || typesmoke: lnincome dvurban dvage sex dvmarst  education immigrants employment, base(no) || use: , case(prefid) difficult iterate(50) constraint(1)
RUM-consistent nested logit regression         Number of obs      =    264,876
Case variable: prefid                          Number of cases    =      44146

Alternative variable: use                      Alts per case: min =          6
                                                              avg =        6.0
                                                              max =          6

                                                  Wald chi2(10)   =    2747.85
Log likelihood = -57946.096                       Prob > chi2     =     0.0000

 ( 1)  [/typesmoke]no_tau = 1
------------------------------------------------------------------------------
      choice | Coefficient  Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
use          |
     taxhat0 |   .6883846   .7004015     0.98   0.326    -.6843772    2.061146
  taxprovhat |  -2.982357   2.884571    -1.03   0.301    -8.636013    2.671298
------------------------------------------------------------------------------
typesmoke equations
------------------------------------------------------------------------------
no           |
    lnincome |          0  (base)
     dvurban |          0  (base)
       dvage |          0  (base)
         sex |          0  (base)
     dvmarst |          0  (base)
   education |          0  (base)
  immigrants |          0  (base)
  employment |          0  (base)
-------------+----------------------------------------------------------------
smoke        |
    lnincome |   .1999486   .1336915     1.50   0.135    -.0620819     .461979
     dvurban |   .0703271   .0226127     3.11   0.002     .0260069    .1146473
       dvage |  -.0004207   .0005677    -0.74   0.459    -.0015333    .0006919
         sex |  -.6288164   .0447914   -14.04   0.000    -.7166059   -.5410269
     dvmarst |  -.0996343   .0125114    -7.96   0.000    -.1241563   -.0751124
   education |  -.0225407   .0025162    -8.96   0.000    -.0274723    -.017609
  immigrants |   .4904975   .2124439     2.31   0.021     .0741151    .9068799
  employment |  -.0009612    .003727    -0.26   0.796     -.008266    .0063436
------------------------------------------------------------------------------
use equations
------------------------------------------------------------------------------
No           |
       _cons |          0  (base)
-------------+----------------------------------------------------------------
Cigarette    |
       _cons |  -2.409225   1.518487    -1.59   0.113    -5.385405    .5669552
-------------+----------------------------------------------------------------
E_cigarette  |
       _cons |  -1.966836     1.2288    -1.60   0.109     -4.37524    .4415682
-------------+----------------------------------------------------------------
Cig___E_cig  |
       _cons |   -2.43637   1.537711    -1.58   0.113    -5.450228    .5774876
-------------+----------------------------------------------------------------
Cigar        |
       _cons |  -1.521405   1.031674    -1.47   0.140    -3.543449    .5006378
-------------+----------------------------------------------------------------
Other        |
       _cons |  -2.345884   1.478499    -1.59   0.113     -5.24369     .551921
------------------------------------------------------------------------------
dissimilarity parameters
------------------------------------------------------------------------------
/typesmoke   |
      no_tau |          1  (constrained)
   smoke_tau |   1.003119    .984843                     -.9271375    2.933376
------------------------------------------------------------------------------
LR test for IIA (tau=1): chi2(1) = 0.00                   Prob > chi2 = 0.9977


*LR p-value not good?
estimates store full

//constrained model
constraint 2 lnincome=dvurban=dvage=sex=marst=education=immigrants=employment=0
constraint 1 [/typesmoke]no_tau = 1

nlogit choice taxhat0 taxprovhat || typesmoke: lnincome dvurban dvage sex dvmarst  education immigrants employment, base(no) || use: , case(prefid) difficult iterate(50) constraint(1) constraint(2)

RUM-consistent nested logit regression         Number of obs      =    264,876
Case variable: prefid                          Number of cases    =      44146

Alternative variable: use                      Alts per case: min =          6
                                                              avg =        6.0
                                                              max =          6

                                                  Wald chi2(9)    =    2746.84
Log likelihood = -57946.536                       Prob > chi2     =     0.0000

 ( 1)  [smoke]lnincome - [smoke]dvurban = 0
------------------------------------------------------------------------------
      choice | Coefficient  Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
use          |
     taxhat0 |   1.063355   .5333655     1.99   0.046     .0179781    2.108732
  taxprovhat |  -4.826532    2.25308    -2.14   0.032    -9.242489   -.4105759
------------------------------------------------------------------------------
typesmoke equations
------------------------------------------------------------------------------
no           |
    lnincome |          0  (base)
     dvurban |          0  (base)
       dvage |          0  (base)
         sex |          0  (base)
     dvmarst |          0  (base)
   education |          0  (base)
  immigrants |          0  (base)
  employment |          0  (base)
-------------+----------------------------------------------------------------
smoke        |
    lnincome |    .073109   .0224286     3.26   0.001     .0291498    .1170682
     dvurban |    .073109   .0224286     3.26   0.001     .0291498    .1170682
       dvage |  -.0004253   .0005682    -0.75   0.454     -.001539    .0006884
         sex |  -.6553308   .0350244   -18.71   0.000    -.7239774   -.5866842
     dvmarst |  -.1002687   .0124928    -8.03   0.000     -.124754   -.0757833
   education |  -.0235022   .0024728    -9.50   0.000    -.0283488   -.0186556
  immigrants |   .5796128   .2066611     2.80   0.005     .1745644    .9846611
  employment |  -.0010013   .0038665    -0.26   0.796    -.0085795     .006577
------------------------------------------------------------------------------
use equations
------------------------------------------------------------------------------
No           |
       _cons |          0  (base)
-------------+----------------------------------------------------------------
Cigarette    |
       _cons |  -2.423716   1.555138    -1.56   0.119     -5.47173    .6242976
-------------+----------------------------------------------------------------
E_cigarette  |
       _cons |  -1.709421   1.219043    -1.40   0.161    -4.098702    .6798596
-------------+----------------------------------------------------------------
Cig___E_cig  |
       _cons |  -2.478323   1.596824    -1.55   0.121    -5.608041    .6513951
-------------+----------------------------------------------------------------
Cigar        |
       _cons |  -1.006704   .8964921    -1.12   0.261    -2.763796    .7503887
-------------+----------------------------------------------------------------
Other        |
       _cons |  -2.315066   1.507488    -1.54   0.125    -5.269688     .639556
------------------------------------------------------------------------------
dissimilarity parameters
------------------------------------------------------------------------------
/typesmoke   |
      no_tau |          1   93403.07                     -183065.6    183067.6
   smoke_tau |   1.609669   .7850948                      .0709117    3.148427
------------------------------------------------------------------------------
LR test for IIA (tau=1): chi2(1) = -0.88                  Prob > chi2 = 1.0000



**lrtest full 


nlogit choice taxhat0 taxprovhat || typesmoke: lnincome , base(no) || use: , case(prefid) difficult iterate(50) constraint(1) 

lrtest full

logit y x1 x2 x3, constraints(1)

nlogit choice taxhat0 taxprovhat || typesmoke: lnincome dvurban dvage sex dvmarst  education immigrants employment, base(no) || use: , case(prefid) difficult iterate(50) constraint(1)

//Re-iv
reg cost tax
predict double taxhat
//test
nlogit choice taxhat || typesmoke: lnincome dvurban dvage sex dvmarst  education immigrants employment, base(no) || use: , case(prefid) difficult iterate(50) constraint(1)
*convergence not achieved
test taxhat		//test	  
 ( 1)  [choice]taxhat = 0

           chi2(  1) =    0.38
         Prob > chi2 =    0.5399
		 
nlogit choice taxhat || typesmoke: lnincome dvurban dvage sex dvmarst  education immigrants employment, base(no) || use: , case(prefid) difficult iterate(50) constraint(1)
		 
RUM-consistent nested logit regression         Number of obs      =    264,876
Case variable: prefid                          Number of cases    =      44146

Alternative variable: use                      Alts per case: min =          6
                                                              avg =        6.0
                                                              max =          6

                                                  Wald chi2(9)    =    2746.95
Log likelihood = -57965.596                       Prob > chi2     =     0.0000

 ( 1)  [/typesmoke]no_tau = 1
------------------------------------------------------------------------------
      choice | Coefficient  Std. err.      z    P>|z|     [95% conf. interval]
-------------+----------------------------------------------------------------
use          |
      taxhat |   .0673554   .5133867     0.13   0.896    -.9388641    1.073575
------------------------------------------------------------------------------
typesmoke equations
------------------------------------------------------------------------------
no           |
    lnincome |          0  (base)
     dvurban |          0  (base)
       dvage |          0  (base)
         sex |          0  (base)
     dvmarst |          0  (base)
   education |          0  (base)
  immigrants |          0  (base)
  employment |          0  (base)
-------------+----------------------------------------------------------------
smoke        |
    lnincome |   .2955908   .1029436     2.87   0.004     .0938251    .4973564
     dvurban |   .0703214   .0226196     3.11   0.002     .0259879     .114655
       dvage |  -.0004595   .0005663    -0.81   0.417    -.0015695    .0006504
         sex |  -.6090395   .0445998   -13.66   0.000    -.6964534   -.5216256
     dvmarst |  -.0991421   .0124982    -7.93   0.000    -.1236381   -.0746461
   education |  -.0206701   .0017163   -12.04   0.000     -.024034   -.0173062
  immigrants |    .317781   .1289347     2.46   0.014     .0650736    .5704883
  employment |    .001252   .0031992     0.39   0.696    -.0050184    .0075224
------------------------------------------------------------------------------
use equations
------------------------------------------------------------------------------
No           |
       _cons |          0  (base)
-------------+----------------------------------------------------------------
Cigarette    |
       _cons |  -2.103398   6.493044    -0.32   0.746    -14.82953    10.62273
-------------+----------------------------------------------------------------
E_cigarette  |
       _cons |  -1.926722   5.093053    -0.38   0.705    -11.90892     8.05548
-------------+----------------------------------------------------------------
Cig___E_cig  |
       _cons |  -2.161707   6.972175    -0.31   0.757    -15.82692    11.50351
-------------+----------------------------------------------------------------
Cigar        |
       _cons |  -1.758699   3.760281    -0.47   0.640    -9.128714    5.611316
-------------+----------------------------------------------------------------
Other        |
       _cons |  -2.081481   6.331256    -0.33   0.742    -14.49051    10.32755
------------------------------------------------------------------------------
dissimilarity parameters
------------------------------------------------------------------------------
/typesmoke   |
      no_tau |          1  (constrained)
   smoke_tau |   .3890227   3.160061                     -5.804584    6.582629
------------------------------------------------------------------------------
LR test for IIA (tau=1): chi2(1) = 0.09                   Prob > chi2 = 0.7624
Warning: Convergence not achieved.
		 

bs "nlogit choice taxhat || typesmoke: lnincome dvurban dvage sex dvmarst  education immigrants employment, base(no) || use: , case(prefid) difficult iterate(50) constraint(1)", reps(100)		 
			  
//Ad expense by category (should have no issues- but doesnt make sense as an IV)
gen adexp = .
replace adexp = 0 if seq==0
replace adexp = adcig if seq==1
replace adexp = adecig if seq==2
replace adexp = adcig + adecig if seq==3
replace adexp = adcigar if seq==4
replace adexp = adtob if seq==5
	
ivregress liml choice lnincome dvurban dvage sex dvmarst  education immigrants employment tax (cost=adexp i.prov), first	
**makes zero sense dumbshit

ttest iv==0

One-sample t test
------------------------------------------------------------------------------
Variable |     Obs        Mean    Std. err.   Std. dev.   [95% conf. interval]
---------+--------------------------------------------------------------------
      iv | 264,876    .1092727    .0000972     .050017    .1090822    .1094631
------------------------------------------------------------------------------
    mean = mean(iv)                                               t =  1.1e+03
H0: mean = 0                                     Degrees of freedom =   264875

    Ha: mean < 0                 Ha: mean != 0                 Ha: mean > 0
 Pr(T < t) = 1.0000         Pr(|T| > |t|) = 0.0000          Pr(T > t) = 0.0000





	  

nlogit choice cost tax || typesmoke: lnincome dvurban dvage sex dvmarst  education immigrants employment, base(no) || use:, case(prefid) difficult iterate(50) constraint(1) vce(bootstrap)

estimates store full



//IV leads
tab ca_10 //but only for cigarettes?

Where cigarettes are obtained, and from |
                                   whom |      Freq.     Percent        Cum.
----------------------------------------+-----------------------------------
I buy them at a small grocery / corner  |     23,244       64.20       64.20
            I buy them at a supermarket |      2,250        6.21       70.42
       I buy them at a gasoline station |      3,924       10.84       81.26
    I buy them at another kind of store |      1,014        2.80       84.06
I buy them from a friend or someone els |        216        0.60       84.65
  My brother or sister gives them to me |         36        0.10       84.75
   My mother or father gives them to me |      2,352        6.50       91.25
A friend or someone else gives them to  |      1,176        3.25       94.50
I take them from my mother, father or s |        150        0.41       94.91
I buy them from a First Nations Reserve |        480        1.33       96.24
  I buy them on a First Nations Reserve |      1,038        2.87       99.11
                        Other - Specify |        324        0.89      100.00
----------------------------------------+-----------------------------------
                                  Total |     36,204      100.00

tab as_01

 aboriginal |
     status |      Freq.     Percent        Cum.
------------+-----------------------------------
        yes |      5,112        5.55        5.55
         no |     86,964       94.45      100.00
------------+-----------------------------------
      Total |     92,076      100.00

	  
	  

mlogit 

prod_use dvurban dvage sex dvmarst hwb_01 hwb_10 education immigrants employment lnincome 

p_cigarette ecig_price p_cigars p_tobacco tax_cigarette gst pst quant_ecig quantity_cig i.prov, rrr 


	  
save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Nested Thesis Dataset.dta", replace	  



////Final: with interaction
nlogit choice cost tax || typesmoke: lnincome dvurban c.dvage##i.dvmarst sex dvmarst education immigrants employment, base(no) || use:, case(prefid) difficult iterate(50) constraint(1)

//Add prov, year
nlogit choice cost tax || typesmoke: lnincome dvurban c.dvage##i.dvmarst sex dvmarst education immigrants employment i.prov##i.refyear, base(no) || use:, case(prefid) difficult iterate(50) constraint(1)


//only prov
nlogit choice cost tax || typesmoke: lnincome dvurban c.dvage##i.dvmarst sex dvmarst education immigrants employment i.prov, base(no) || use:, case(prefid) difficult iterate(50) constraint(1)
*cost, tax coeff become insignificant, most prov coeff also insignificant


//Final interpretation
//Using final model above
nlogit choice cost tax || typesmoke: lnincome dvurban c.dvage##i.dvmarst sex dvmarst education immigrants employment, base(no) || use:, case(prefid) difficult iterate(50) constraint(1)
*coeff above only say more/ less likely. Not to be interpreted on their own

estat alternatives
 Alternatives summary for typesmoke
  +-------------------------------------------------------------------------+
  |          Alternative                  |    Cases   Frequency    Percent |
  |  index        value             label |   present   selected   selected |
  |---------------------------------------+---------------------------------|
  |      1           1                 no |     44146      25084      56.82 |
  |      2           2              smoke |    220730      19062      43.18 |
  +-------------------------------------------------------------------------+

   Alternatives summary for use
  +-------------------------------------------------------------------------+
  |          Alternative                  |    Cases   Frequency    Percent |
  |  index        value             label |   present   selected   selected |
  |---------------------------------------+---------------------------------|
  |      1           0                 No |     44146      25084      56.82 |
  |      2           1          Cigarette |     44146       2866       6.49 |
  |      3           2        E-cigarette |     44146       4286       9.71 |
  |      4           3        Cig & E-cig |     44146       2374       5.38 |
  |      5           4              Cigar |     44146       6662      15.09 |
  |      6           5              Other |     44146       2874       6.51 |
  +-------------------------------------------------------------------------+

  
 esttab using  "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/alt.tex"
 //Nope
 
predict p* 
*p1: type smoke_tau
*p2: use 

predict condp, condp hlevel(2)
*conditional probability at level 2
predict condp1, condp hlevel(1)
*conditional probability at level 1

sort prefid typesmoke use
list use typesmoke choice p2 p1 condp1 in 30/42, sepby(prefid)

predict xb*, xb
predict iv, iv

list use typesmoke choice xb* iv in 1/12, sepby(prefid) 

sum p1 p2 condp xb* iv

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
          p1 |    264,876    .4545297    .1475718   .0936214   .9063786
          p2 |    264,876    .1666667    .1929665   .0210483   .8296036
       condp |    264,876    .3333333    .3073957   .1165099          1
         xb1 |    264,876    -.564883    .5977408  -1.954762   1.911289
         xb2 |    264,876   -3.781029     1.95883  -5.948473          0
-------------+---------------------------------------------------------
          iv |    264,876    .1092727     .050017          0    .150199

//
drop pr1 pr2
predictnl pr*

//Try again: should have coeff for each category
nlogit choice cost tax || use: lnincome dvurban c.dvage##i.dvmarst sex dvmarst education immigrants employment, base(0) || typesmoke:, case(prefid) difficult iterate(50) constraint(1)	
*nope

//no constant
nlogit choice cost tax || typesmoke: lnincome dvurban c.dvage##i.dvmarst sex dvmarst education immigrants employment, base(no) || use:, noconst case(prefid) difficult iterate(50) constraint(1)

outreg2 using "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/noconst nlogit.tex"


//g option of predictnl
predictnl  gnew   , g(d)  
predictnl gnew = choice   , g(der)  
*nope

//lrtable
nestreg, lrtable: regress choice (cost tax) (lnincome dvurban c.dvage##i.dvmarst sex dvmarst education immigrants employment)   

nestreg, lrtable: regress choice (cost tax) (lnincome dvurban c.dvage##i.dvmarst sex dvm
> arst education immigrants employment)   
note: 1.dvmarst omitted because of estimability.
note: 1.dvmarst#c.dvage omitted because of estimability.
note: dvmarst omitted because of estimability.

Block 1: cost tax

      Source |       SS           df       MS      Number of obs   =   264,876
-------------+----------------------------------   F(2, 264873)    =  18574.37
       Model |  4524.97377         2  2262.48688   Prob > F        =    0.0000
    Residual |  32263.3596   264,873  .121806902   R-squared       =    0.1230
-------------+----------------------------------   Adj R-squared   =    0.1230
       Total |  36788.3333   264,875  .138889413   Root MSE        =    .34901

------------------------------------------------------------------------------
      choice | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
        cost |  -.3836378   .0026691  -143.73   0.000    -.3888692   -.3784065
         tax |  -.4339095   .0080755   -53.73   0.000    -.4497372   -.4180819
       _cons |   .3791564    .001297   292.34   0.000     .3766144    .3816984
------------------------------------------------------------------------------

Block 2: lnincome dvurban dvage 2.dvmarst 3.dvmarst 2.dvmarst#c.dvage 3.dvmarst#c.dvage se
> x education immigrants employment

      Source |       SS           df       MS      Number of obs   =   264,876
-------------+----------------------------------   F(13, 264862)   =   2868.91
       Model |  4540.83821        13  349.295247   Prob > F        =    0.0000
    Residual |  32247.4951   264,862  .121752064   R-squared       =    0.1234
-------------+----------------------------------   Adj R-squared   =    0.1234
       Total |  36788.3333   264,875  .138889413   Root MSE        =    .34893

-----------------------------------------------------------------------------------------
                 choice | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
------------------------+----------------------------------------------------------------
                   cost |  -.3849461   .0026786  -143.71   0.000    -.3901961   -.3796961
                    tax |   -.435591   .0081231   -53.62   0.000     -.451512   -.4196701
               lnincome |    .012998   .0069629     1.87   0.062    -.0006491    .0266451
                dvurban |   .0003747   .0015478     0.24   0.809    -.0026588    .0034083
                  dvage |  -.0000312   .0000587    -0.53   0.595    -.0001461    .0000838
                        |
                dvmarst |
Widowed/Divorced/Sep~d  |  -.0011971   .0087401    -0.14   0.891    -.0183273    .0159332
 Single, never married  |  -.0008919   .0036819    -0.24   0.809    -.0081083    .0063245
                        |
        dvmarst#c.dvage |
Widowed/Divorced/Sep~d  |   .0000311   .0001398     0.22   0.824     -.000243    .0003052
 Single, never married  |   .0000371   .0000998     0.37   0.710    -.0001585    .0002327
                        |
                    sex |   -.001825   .0029131    -0.63   0.531    -.0075347    .0038847
              education |   .0005443   .0001165     4.67   0.000      .000316    .0007725
             immigrants |  -.0728724   .0084222    -8.65   0.000    -.0893798    -.056365
             employment |   .0002485    .000214     1.16   0.245    -.0001708    .0006679
                  _cons |   .2113807   .0674976     3.13   0.002     .0790873    .3436742
-----------------------------------------------------------------------------------------


  +----------------------------------------------------------------+
  | Block |        LL       LR     df  Pr > LR       AIC       BIC |
  |-------+--------------------------------------------------------|
  |     1 | -97017.12  34764.59     2   0.0000  194040.2  194071.7 |
  |     2 | -96951.99   130.28     11   0.0000    193932  194078.8 |
  +----------------------------------------------------------------+


////Elasticity?? //ln ln nested 
gen lnchoice = ln(choice)
gen lncost = ln(cost)
gen lntax = ln(tax)
gen lnurban = ln(dvurban)
gen lnage = ln(dvage)
gen lnmarst = ln(dvmarst)
gen lnsex = ln(sex) 
gen lneducation = ln(education)
gen lnimmigrants = ln(immigrants)
gen lnemployment = ln(employment)  

//
nlogit lnchoice lncost lntax || typesmoke: lnincome lnurban c.lnage##i.lnmarst lnsex  lneducation lnimmigrants lnemployment, base(no) || use:, case(prefid) difficult iterate(50) constraint(1)

nestreg, lrtable: regress choice (cost tax) (lnincome dvurban c.dvage##i.dvmarst sex dvmarst education immigrants employment)  
		  
		  
