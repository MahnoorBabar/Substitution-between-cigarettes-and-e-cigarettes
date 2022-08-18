//Now add advertising: per capita: per category
//2013 population: 35,296,528
//2015 population: 36,026,676
//2017 population: 36,732,095

*Total: 46068

//E-Cig
gen adecig = .
replace adecig = 2.095 if refyear==2013 & elc_110 == 1
*73971100/35,296,528
replace adecig = 0.8683 if refyear==2015 & elc_110 == 1
*31282100/36,026,676
replace adecig = 0.9465 if refyear==2017 & elc_110 == 1
*34770000/36,732,095
replace adecig = 0 if adecig == . 
*(38,392 real changes made)

//Cig
gen adcig = .
replace adcig = 2.3077 if refyear==2013 & ps_10 == 1
*81457200/35,296,528
replace adcig = 1.0275 if refyear==2015 & ps_10 == 1
*37019700/36,026,676
replace adcig = 0.5348 if refyear==2017 & ps_10 == 1
*19647900/36,732,095
replace adcig = 0 if adcig == . 
*(40,238 real changes made)

//Cigar
gen adcigar = .
replace adcigar = 0.1314 if refyear==2013 & tp_017 == 1
*4639900/35,296,528
replace adcigar = 0.0177 if refyear==2015 & tp_017 == 1
*638100/36,026,676
replace adcigar = 0.0040 if refyear==2017 & tp_017 == 1
*147500/36,732,095
replace adcigar = 0 if adcigar == . 
*(30,973 real changes made)

//Tobacco
gen adtob = .
replace adtob = 0.8517 if refyear==2013 & tp_050 == 1
*30062700/35,296,528
replace adtob = 2.2231 if refyear==2015 & tp_050 == 1
*80093400/36,026,676
replace adtob = 1.7779 if refyear==2017 & tp_050 == 1
*65308300/36,732,095
replace adtob = 0 if adtob == . 
*(41,618 real changes made)

//Quit
gen adquit = .
replace adquit = 0.9615 if refyear==2013 & sc_110 == 1
*33939200/35,296,528
replace adquit = 1.0373 if refyear==2015 & sc_110 == 1
*37372600/36,026,676
replace adquit = 1.1266 if refyear==2017 & sc_110 == 1
*41384300/36,732,095
replace adquit = 0 if adquit == . 
*(43,991 real changes made)


**interpretation: $ spent per person per category

//add for individual exposure 
gen adexposure = adecig + adcig + adcigar + adtob 
*24,860/46,086 have no exposure / are non users i.e nearly half



///Price (per 200 cigarettes)
gen price = .
*British Columbia
replace price = 97.37 if refyear==2013 & prov == 59
replace price = 104.96 if refyear==2015 & prov == 59
replace price = 110.67 if refyear==2017 & prov == 59

*Alberta
replace price = 88.70 if refyear==2013 & prov == 48
replace price = 92.94 if refyear==2015 & prov == 48
replace price = 118.53 if refyear==2017 & prov == 48

*Saskatchewan
replace price = 105.79 if refyear==2013 & prov == 47
replace price = 110.22 if refyear==2015 & prov == 47
replace price = 131.35 if refyear==2017 & prov == 47

*Manitoba
replace price = 120.16 if refyear==2013 & prov == 46
replace price = 125.80 if refyear==2015 & prov == 46
replace price = 139.83 if refyear==2017 & prov == 46

*Ontario
replace price = 80.41 if refyear==2013 & prov == 35
replace price = 84.96 if refyear==2015 & prov == 35
replace price = 104.99 if refyear==2017 & prov == 35

*Quebec
replace price = 76.95 if refyear==2013 & prov == 24
replace price = 81.19 if refyear==2015 & prov == 24
replace price = 96.36 if refyear==2017 & prov == 24

*New Brunswick
replace price = 84.09 if refyear==2013 & prov == 13
replace price = 88.65 if refyear==2015 & prov == 13
replace price = 118.76 if refyear==2017 & prov == 13

*Nova Scotia
replace price = 107.40 if refyear==2013 & prov == 12
replace price = 112.03 if refyear==2015 & prov == 12
replace price = 132.48 if refyear==2017 & prov == 12

*Price Edward Island
replace price = 102.73 if refyear==2013 & prov == 11
replace price = 107.32 if refyear==2015 & prov == 11
replace price = 133.52 if refyear==2017 & prov == 11

*Newfoundland and Labrador
replace price = 97.07 if refyear==2013 & prov == 10
replace price = 108.40 if refyear==2015 & prov == 10
replace price = 125.10 if refyear==2017 & prov == 10

replace price = 0 if price == . 
*(0 real changes made)

*2018 prices instead of 2017
*issue: some prices look larger than expected



//Taxes ($ per 200 cigarettes)
gen tax = .
*British Columbia
replace tax = 44.60 if refyear==2013 & prov == 59
replace tax = 47.80 if refyear==2015 & prov == 59
replace tax = 47.80 if refyear==2017 & prov == 59

*Alberta
replace tax = 40 if refyear==2013 & prov == 48
replace tax = 50 if refyear==2015 & prov == 48
replace tax = 50 if refyear==2017 & prov == 48

*Saskatchewan
replace tax = 50 if refyear==2013 & prov == 47
replace tax = 50 if refyear==2015 & prov == 47
replace tax = 54 if refyear==2017 & prov == 47

*Manitoba
replace tax = 58 if refyear==2013 & prov == 46
replace tax = 59 if refyear==2015 & prov == 46
replace tax = 59 if refyear==2017 & prov == 46

*Ontario
replace tax = 24.70 if refyear==2013 & prov == 35
replace tax = 27.95 if refyear==2015 & prov == 35
replace tax = 32.95 if refyear==2017 & prov == 35

*Quebec
replace tax = 25.80 if refyear==2013 & prov == 24
replace tax = 29.80 if refyear==2015 & prov == 24
replace tax = 29.80 if refyear==2017 & prov == 24

*New Brunswick
replace tax = 38 if refyear==2013 & prov == 13
replace tax = 38 if refyear==2015 & prov == 13
replace tax = 51.04 if refyear==2017 & prov == 13

*Nova Scotia
replace tax = 47.04 if refyear==2013 & prov == 12
replace tax = 51.04 if refyear==2015 & prov == 12
replace tax = 55.04 if refyear==2017 & prov == 12

*Price Edward Island
replace tax = 45 if refyear==2013 & prov == 11
replace tax = 50 if refyear==2015 & prov == 11
replace tax = 50 if refyear==2017 & prov == 11

*Newfoundland and Labrador
replace tax = 41 if refyear==2013 & prov == 10
replace tax = 47 if refyear==2015 & prov == 10
replace tax = 49 if refyear==2017 & prov == 10

replace tax = 0 if tax == . 
*(0 real changes made)





////Prices
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Data/Merge/Thesis Dataset.dta" , clear

*Also USD to CAD
*2013: 1.0302
*2015: 1.2789
*2017: 1.2986

*price per unit 
gen p_cigars = . 
replace p_cigars = 0.6387 if refyear== 2013 
*0.62*1.0302
replace p_cigars = 0.7161 if refyear== 2015 
*0.56*1.2789
replace p_cigars = 0.7402 if refyear== 2017 
*0.57*1.2986

gen p_tobacco = . 
replace p_tobacco = 0.2884 if refyear== 2013 
*0.28*1.0302
replace p_tobacco = 0.3069 if refyear== 2015 
*0.24*1.2789
replace p_tobacco = 0.3246 if refyear== 2017
*0.25*1.2986

*CAD already
gen p_cigarette = . 
//2013
replace p_cigarette = 97.07 if refyear== 2013 & prov == 10
replace p_cigarette = 102.73 if refyear== 2013 & prov == 11
replace p_cigarette = 107.40 if refyear== 2013 & prov == 12
replace p_cigarette = 84.09 if refyear== 2013 & prov == 13
replace p_cigarette = 76.95 if refyear== 2013 & prov == 24
replace p_cigarette = 80.41 if refyear== 2013 & prov == 35
replace p_cigarette = 120.16 if refyear== 2013 & prov == 46
replace p_cigarette = 105.79 if refyear== 2013 & prov == 47
replace p_cigarette = 88.70 if refyear== 2013 & prov == 48
replace p_cigarette = 97.37 if refyear== 2013 & prov == 59

//2015
replace p_cigarette = 96.67 if refyear== 2015 & prov == 10
replace p_cigarette = 98.79 if refyear== 2015 & prov == 11
replace p_cigarette = 101.30 if refyear== 2015 & prov == 12
replace p_cigarette = 83.92 if refyear== 2015 & prov == 13
replace p_cigarette = 75.06 if refyear== 2015 & prov == 24
replace p_cigarette = 80.52 if refyear== 2015 & prov == 35
replace p_cigarette = 113.06 if refyear== 2015 & prov == 46
replace p_cigarette = 102.57 if refyear== 2015 & prov == 47
replace p_cigarette = 94.01 if refyear== 2015 & prov == 48
replace p_cigarette = 104.03 if refyear== 2015 & prov == 59

//2017
replace p_cigarette = 97.41 if refyear== 2017 & prov == 10
replace p_cigarette = 100.14 if refyear== 2017 & prov == 11
replace p_cigarette = 102.92 if refyear== 2017 & prov == 12
replace p_cigarette = 85.05 if refyear== 2017 & prov == 13
replace p_cigarette = 76.37 if refyear== 2017 & prov == 24
replace p_cigarette = 81.98 if refyear== 2017 & prov == 35
replace p_cigarette = 117.57 if refyear== 2017 & prov == 46
replace p_cigarette = 105.20 if refyear== 2017 & prov == 47
replace p_cigarette = 96.37 if refyear== 2017 & prov == 48
replace p_cigarette = 109.28 if refyear== 2017 & prov == 59


//Taxes
gen tax_cigarette = .
//2013
replace tax_cigarette = 41 if refyear== 2013 & prov == 10
replace tax_cigarette = 45 if refyear== 2013 & prov == 11
replace tax_cigarette = 47.04 if refyear== 2013 & prov == 12
replace tax_cigarette = 38 if refyear== 2013 & prov == 13
replace tax_cigarette = 25.08 if refyear== 2013 & prov == 24
replace tax_cigarette = 24.7 if refyear== 2013 & prov == 35
replace tax_cigarette = 58 if refyear== 2013 & prov == 46
replace tax_cigarette = 50 if refyear== 2013 & prov == 47
replace tax_cigarette = 40 if refyear== 2013 & prov == 48
replace tax_cigarette = 44.6 if refyear== 2013 & prov == 59

//2015
replace tax_cigarette = 47 if refyear== 2015 & prov == 10
replace tax_cigarette = 45 if refyear== 2015 & prov == 11
replace tax_cigarette = 51.04 if refyear== 2015 & prov == 12
replace tax_cigarette = 38 if refyear== 2015 & prov == 13
replace tax_cigarette = 29.8 if refyear== 2015 & prov == 24
replace tax_cigarette = 27.95 if refyear== 2015 & prov == 35
replace tax_cigarette = 59 if refyear== 2015 & prov == 46
replace tax_cigarette = 50 if refyear== 2015 & prov == 47
replace tax_cigarette = 40 if refyear== 2015 & prov == 48
replace tax_cigarette = 47.8 if refyear== 2015 & prov == 59

//2017
replace tax_cigarette = 49 if refyear== 2017 & prov == 10
replace tax_cigarette = 50 if refyear== 2017 & prov == 11
replace tax_cigarette = 55.04 if refyear== 2017 & prov == 12
replace tax_cigarette = 51.04 if refyear== 2017 & prov == 13
replace tax_cigarette = 29.8 if refyear== 2017 & prov == 24
replace tax_cigarette = 32.95 if refyear== 2017 & prov == 35
replace tax_cigarette = 59 if refyear== 2017 & prov == 46
replace tax_cigarette = 54 if refyear== 2017 & prov == 47
replace tax_cigarette = 50 if refyear== 2017 & prov == 48
replace tax_cigarette = 47.8 if refyear== 2017 & prov == 59

https://www.canada.ca/en/public-health/services/reports-publications/health-promotion-chronic-disease-prevention-canada-research-policy-practice/vol-41-no-10-2021/cigarette-affordability-canadian-provinces-10-year-review.html 

gen wholesale_cigarette = p_cigarette-tax_cigarette

sum wholesale_cigarette
sum p_cigarette
sum tax_cigarette

replace p_cigarette =p_cigarette/200
replace tax_cigarette=tax_cigarette/200
replace wholesale_cigarette = p_cigarette-tax_cigarette

drop tax price ?

save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Data/Merge/Thesis Dataset.dta"


*Also USD to CAD
*2013: 1.0302
*2015: 1.2789
*2017: 1.2986

//Revenue per capita
drop rev_cigars rev_tobacco rev_ecigarette rev_cigarette
gen rpc_cigars = .
replace rpc_cigars = 9.785 if refyear==2013
*9.50*1.0302
replace rpc_cigars = 9.156 if refyear==2015
*7.16*1.2789
replace rpc_cigars = 8.090 if refyear==2017
*6.23*1.2986

gen rpc_tobacco = .
replace rpc_tobacco = 8.549 if refyear==2013
*8.30*1.0302
replace rpc_tobacco = 6.957 if refyear==2015
*5.44*1.2789
replace rpc_tobacco = 6.064 if refyear==2017
*4.67*1.2986

gen rpc_cigarettes = .
replace rpc_cigarettes = 453.391 if refyear==2013
*440.1*1.0302
replace rpc_cigarettes = 502.351 if refyear==2015
*392.8*1.2789
replace rpc_cigarettes = 483.079 if refyear==2017
*372.0*1.2986

gen rpc_ecigarettes = .
replace rpc_ecigarettes = 12.568 if refyear==2013
*12.2*1.0302
replace rpc_ecigarettes = 24.120 if refyear==2015
*18.86*1.2789
replace rpc_ecigarettes = 33.062 if refyear==2017
*25.46*1.2986


//E-Cig Price using CPI
gen p_ecigarettes = . 
replace p_ecigarettes = 0.2531 if refyear== 2013 

replace p_ecigarettes = 0.3333 if refyear== 2015 

replace p_ecigarettes = 0.4500 if refyear== 2017 


save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta", replace



////////Add data from NHS
use "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Thesis Dataset.dta"

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

					
					
Respondent' |
      s sex |      Freq.     Percent        Cum.
------------+-----------------------------------
       Male |     21,507       46.69       46.69
     Female |     24,561       53.31      100.00
------------+-----------------------------------
      Total |     46,068      100.00

tab sex, nol

Respondent' |
      s sex |      Freq.     Percent        Cum.
------------+-----------------------------------
          1 |     21,507       46.69       46.69
          2 |     24,561       53.31      100.00
------------+-----------------------------------
      Total |     46,068      100.00

					

///median income by gender
gen income = .

//2015
replace income = 40880 if refyear== 2015 & prov == 10 & sex == 1 
replace income = 25314 if refyear== 2015 & prov == 10 & sex == 2
replace income = 36021 if refyear== 2015 & prov == 11 & sex == 1
replace income = 28065 if refyear== 2015 & prov == 11 & sex == 2
replace income = 38379 if refyear== 2015 & prov == 12 & sex == 1
replace income = 26750 if refyear== 2015 & prov == 12 & sex == 2
replace income = 37516 if refyear== 2015 & prov == 13 & sex == 1
replace income = 25796 if refyear== 2015 & prov == 13 & sex == 2
replace income = 37842 if refyear== 2015 & prov == 24 & sex == 1
replace income = 28522 if refyear== 2015 & prov == 24 & sex == 2
replace income = 39889 if refyear== 2015 & prov == 35 & sex == 1
replace income = 28676 if refyear== 2015 & prov == 35 & sex == 2
replace income = 40379 if refyear== 2015 & prov == 46 & sex == 1
replace income = 29220 if refyear== 2015 & prov == 46 & sex == 2
replace income = 46117 if refyear== 2015 & prov == 47 & sex == 1
replace income = 31978 if refyear== 2015 & prov == 47 & sex == 2
replace income = 54891 if refyear== 2015 & prov == 48 & sex == 1
replace income = 33213 if refyear== 2015 & prov == 48 & sex == 2
replace income = 40370 if refyear== 2015 & prov == 59 & sex == 1
replace income = 27543 if refyear== 2015 & prov == 59 & sex == 2


//2013
replace income = 33524 if refyear== 2013 & prov == 10 & sex == 1
replace income = 22735 if refyear== 2013 & prov == 10 & sex == 2
replace income = 30834 if refyear== 2013 & prov == 11 & sex == 1
replace income = 25168.5 if refyear== 2013 & prov == 11 & sex == 2
replace income = 33000 if refyear== 2013 & prov == 12 & sex == 1
replace income = 24452 if refyear== 2013 & prov == 12 & sex == 2
replace income = 32412 if refyear== 2013 & prov == 13 & sex == 1
replace income = 23551 if refyear== 2013 & prov == 13 & sex == 2
replace income = 32914 if refyear== 2013 & prov == 24 & sex == 1
replace income = 25540.5 if refyear== 2013 & prov == 24 & sex == 2
replace income = 36112 if refyear== 2013 & prov == 35 & sex == 1
replace income = 28093 if refyear== 2013 & prov == 35 & sex == 2
replace income = 35645.5 if refyear== 2013 & prov == 46 & sex == 1
replace income = 27148 if refyear== 2013 & prov == 46 & sex == 2
replace income = 39914.5 if refyear== 2013 & prov == 47 & sex == 1
replace income = 28636 if refyear== 2013 & prov == 47 & sex == 2
replace income = 48454 if refyear== 2013 & prov == 48 & sex == 1
replace income = 31812 if refyear== 2013 & prov == 48 & sex == 2
replace income = 35474.5 if refyear== 2013 & prov == 59 & sex == 1
replace income = 26581 if refyear== 2013 & prov == 59 & sex == 2


//2017
replace income = 41440 if refyear== 2017 & prov == 10 & sex == 1
replace income = 28857 if refyear== 2017 & prov == 10 & sex == 2
replace income = 38810.5 if refyear== 2017 & prov == 11 & sex == 1
replace income = 32232.5 if refyear== 2017 & prov == 11 & sex == 2
replace income = 39989.5 if refyear== 2017 & prov == 12 & sex == 1
replace income = 29275 if refyear== 2017 & prov == 12 & sex == 2
replace income = 39758 if refyear== 2017 & prov == 13 & sex == 1
replace income = 29898 if refyear== 2017 & prov == 13 & sex == 2
replace income = 41321 if refyear== 2017 & prov == 24 & sex == 1
replace income = 32861 if refyear== 2017 & prov == 24 & sex == 2
replace income = 42944.5 if refyear== 2017 & prov == 35 & sex == 1
replace income = 32938 if refyear== 2017 & prov == 35 & sex == 2
replace income = 42189.5 if refyear== 2017 & prov == 46 & sex == 1
replace income = 32410 if refyear== 2017 & prov == 46 & sex == 2
replace income = 47058.5 if refyear== 2017 & prov == 47 & sex == 1
replace income = 35189 if refyear== 2017 & prov == 47 & sex == 2
replace income = 54045.5 if refyear== 2017 & prov == 48 & sex == 1
replace income = 35806.5 if refyear== 2017 & prov == 48 & sex == 2
replace income = 35474.5 if refyear== 2017 & prov == 59 & sex == 1
replace income = 31771.5 if refyear== 2017 & prov == 59 & sex == 2




//Add GST/HST/PST

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
	  
gen gst = . 
//2013
replace gst = 13 if refyear== 2013 & prov == 10
replace gst = 5 if refyear== 2013 & prov == 11
replace gst = 15 if refyear== 2013 & prov == 12
replace gst = 13 if refyear== 2013 & prov == 13
replace gst = 5 if refyear== 2013 & prov == 24
replace gst = 13 if refyear== 2013 & prov == 35
replace gst = 5 if refyear== 2013 & prov == 46
replace gst = 5 if refyear== 2013 & prov == 47
replace gst = 5 if refyear== 2013 & prov == 48
replace gst = 5 if refyear== 2013 & prov == 59

//2015
replace gst = 13 if refyear== 2015 & prov == 10
replace gst = 14 if refyear== 2015 & prov == 11
replace gst = 15 if refyear== 2015 & prov == 12
replace gst = 13 if refyear== 2015 & prov == 13
replace gst = 5 if refyear== 2015 & prov == 24
replace gst = 13 if refyear== 2015 & prov == 35
replace gst = 5 if refyear== 2015 & prov == 46
replace gst = 5 if refyear== 2015 & prov == 47
replace gst = 5 if refyear== 2015 & prov == 48
replace gst = 5 if refyear== 2015 & prov == 59

//2017
replace gst = 15 if refyear== 2017 & prov == 10
replace gst = 15 if refyear== 2017 & prov == 11
replace gst = 15 if refyear== 2017 & prov == 12
replace gst = 15 if refyear== 2017 & prov == 13
replace gst = 5 if refyear== 2017 & prov == 24
replace gst = 13 if refyear== 2017 & prov == 35
replace gst = 5 if refyear== 2017 & prov == 46
replace gst = 5 if refyear== 2017 & prov == 47
replace gst = 5 if refyear== 2017 & prov == 48
replace gst = 5 if refyear== 2017 & prov == 59


gen pst = . 
//2013
replace pst = 0 if refyear== 2013 & prov == 10
replace pst = 10 if refyear== 2013 & prov == 11
replace pst = 0 if refyear== 2013 & prov == 12
replace pst = 0 if refyear== 2013 & prov == 13
replace pst = 9.975 if refyear== 2013 & prov == 24
replace pst = 0 if refyear== 2013 & prov == 35
replace pst = 7 if refyear== 2013 & prov == 46
replace pst = 5 if refyear== 2013 & prov == 47
replace pst = 0 if refyear== 2013 & prov == 48
replace pst = 7 if refyear== 2013 & prov == 59

//2015
replace pst = 0 if refyear== 2015 & prov == 10
replace pst = 0 if refyear== 2015 & prov == 11
replace pst = 0 if refyear== 2015 & prov == 12
replace pst = 0 if refyear== 2015 & prov == 13
replace pst = 9.975 if refyear== 2015 & prov == 24
replace pst = 0 if refyear== 2015 & prov == 35
replace pst = 8 if refyear== 2015 & prov == 46
replace pst = 5 if refyear== 2015 & prov == 47
replace pst = 0 if refyear== 2015 & prov == 48
replace pst = 7 if refyear== 2015 & prov == 59

//2017
replace pst = 0 if refyear== 2017 & prov == 10
replace pst = 0 if refyear== 2017 & prov == 11
replace pst = 0 if refyear== 2017 & prov == 12
replace pst = 0 if refyear== 2017 & prov == 13
replace pst = 9.975 if refyear== 2017 & prov == 24
replace pst = 0 if refyear== 2017 & prov == 35
replace pst = 8 if refyear== 2017 & prov == 46
replace pst = 6 if refyear== 2017 & prov == 47
replace pst = 0 if refyear== 2017 & prov == 48
replace pst = 7 if refyear== 2017 & prov == 59


https://www.taxtips.ca/salestaxes/sales-tax-rates-2013.htm
https://www.taxtips.ca/salestaxes/sales-tax-rates-2015.htm
https://www.taxtips.ca/salestaxes/sales-tax-rates-2017.htm

save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Final Thesis Dataset.dta", replace


//Assign e-cig quantities (2017) to 2013 and 2015
*same quantity if same if, whether smoking or not with cause variation?
br pumfid prov refyear elc_127
gen quantity_ecig = .
replace quantity_ecig = elc_127 if refyear==2017
bysort pumfid (quantity_ecig): replace quantity_ecig = quantity_ecig[1]

gen quantity_cig = wp_10c

//Education by gender (tertiary or more-share/percentage of population)
https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3710013001&pickMembers%5B0%5D=3.1&pickMembers%5B1%5D=4.2&cubeTimeFrame.startYear=2013&cubeTimeFrame.endYear=2017&referencePeriods=20130101%2C20170101 

gen education = .
//2013
replace education = 33 if refyear== 2013 & prov == 10 & sex == 1
replace education = 46 if refyear== 2013 & prov == 10 & sex == 2
replace education = 40 if refyear== 2013 & prov == 11 & sex == 1
replace education = 63 if refyear== 2013 & prov == 11 & sex == 2
replace education = 44 if refyear== 2013 & prov == 12 & sex == 1
replace education = 59 if refyear== 2013 & prov == 12 & sex == 2
replace education = 42 if refyear== 2013 & prov == 13 & sex == 1
replace education = 54 if refyear== 2013 & prov == 13 & sex == 2
replace education = 45 if refyear== 2013 & prov == 24 & sex == 1
replace education = 53 if refyear== 2013 & prov == 24 & sex == 2
replace education = 55 if refyear== 2013 & prov == 35 & sex == 1
replace education = 65 if refyear== 2013 & prov == 35 & sex == 2
replace education = 39 if refyear== 2013 & prov == 46 & sex == 1
replace education = 52 if refyear== 2013 & prov == 46 & sex == 2
replace education = 33 if refyear== 2013 & prov == 47 & sex == 1
replace education = 50 if refyear== 2013 & prov == 47 & sex == 2
replace education = 39 if refyear== 2013 & prov == 48 & sex == 1
replace education = 56 if refyear== 2013 & prov == 48 & sex == 2
replace education = 44 if refyear== 2013 & prov == 59 & sex == 1
replace education = 58 if refyear== 2013 & prov == 59 & sex == 2


//2015
replace education = 34 if refyear== 2015 & prov == 10 & sex == 1 
replace education = 48 if refyear== 2015 & prov == 10 & sex == 2
replace education = 43 if refyear== 2015 & prov == 11 & sex == 1
replace education = 63 if refyear== 2015 & prov == 11 & sex == 2
replace education = 45 if refyear== 2015 & prov == 12 & sex == 1
replace education = 60 if refyear== 2015 & prov == 12 & sex == 2
replace education = 44 if refyear== 2015 & prov == 13 & sex == 1
replace education = 55 if refyear== 2015 & prov == 13 & sex == 2
replace education = 46 if refyear== 2015 & prov == 24 & sex == 1
replace education = 56 if refyear== 2015 & prov == 24 & sex == 2
replace education = 57 if refyear== 2015 & prov == 35 & sex == 1
replace education = 66 if refyear== 2015 & prov == 35 & sex == 2
replace education = 43 if refyear== 2015 & prov == 46 & sex == 1
replace education = 57 if refyear== 2015 & prov == 46 & sex == 2
replace education = 33 if refyear== 2015 & prov == 47 & sex == 1
replace education = 52 if refyear== 2015 & prov == 47 & sex == 2
replace education = 42 if refyear== 2015 & prov == 48 & sex == 1
replace education = 60 if refyear== 2015 & prov == 48 & sex == 2
replace education = 47 if refyear== 2015 & prov == 59 & sex == 1
replace education = 61 if refyear== 2015 & prov == 59 & sex == 2

//2017
replace education = 37 if refyear== 2017 & prov == 10 & sex == 1
replace education = 51 if refyear== 2017 & prov == 10 & sex == 2
replace education = 48 if refyear== 2017 & prov == 11 & sex == 1
replace education = 66 if refyear== 2017 & prov == 11 & sex == 2
replace education = 45 if refyear== 2017 & prov == 12 & sex == 1
replace education = 62 if refyear== 2017 & prov == 12 & sex == 2
replace education = 47 if refyear== 2017 & prov == 13 & sex == 1
replace education = 59 if refyear== 2017 & prov == 13 & sex == 2
replace education = 47 if refyear== 2017 & prov == 24 & sex == 1
replace education = 58 if refyear== 2017 & prov == 24 & sex == 2
replace education = 57 if refyear== 2017 & prov == 35 & sex == 1
replace education = 67 if refyear== 2017 & prov == 35 & sex == 2
replace education = 45 if refyear== 2017 & prov == 46 & sex == 1
replace education = 58 if refyear== 2017 & prov == 46 & sex == 2
replace education = 34 if refyear== 2017 & prov == 47 & sex == 1
replace education = 55 if refyear== 2017 & prov == 47 & sex == 2
replace education = 44 if refyear== 2017 & prov == 48 & sex == 1
replace education = 61 if refyear== 2017 & prov == 48 & sex == 2
replace education = 48 if refyear== 2017 & prov == 59 & sex == 1
replace education = 63 if refyear== 2017 & prov == 59 & sex == 2


//Immigration (percentage/share for both)
https://www.statista.com/statistics/444906/number-of-immigrants-in-canada/
gen immigrants = . 

//2015
replace immigrants = 12080/512245 if refyear== 2015 & prov == 10
replace immigrants = 10225/139685 if refyear== 2015 & prov == 11
replace immigrants = 55675/908340 if refyear== 2015 & prov == 12
replace immigrants = 33815/730740 if refyear== 2015 & prov == 13
replace immigrants = 1091305/7965455 if refyear== 2015 & prov == 24
replace immigrants = 3852145/13242160 if refyear== 2015 & prov == 35
replace immigrants = 227460/1240700 if refyear== 2015 & prov == 46
replace immigrants = 112490/1070560 if refyear== 2015 & prov == 47
replace immigrants = 845215/3978140 if refyear== 2015 & prov == 48
replace immigrants = 1292675/4560235 if refyear== 2015 & prov == 59

//2013
replace immigrants = 10622/509768 if refyear== 2013 & prov == 10
replace immigrants = 8655/138532 if refyear== 2013 & prov == 11
replace immigrants = 51975/907255 if refyear== 2013 & prov == 12
replace immigrants = 31142/733285 if refyear== 2013 & prov == 13
replace immigrants = 1033100/7848990 if refyear== 2013 & prov == 24
replace immigrants = 3731758/12946975 if refyear== 2013 & prov == 35
replace immigrants = 205982/1206022 if refyear== 2013 & prov == 46
replace immigrants = 90632/1039658 if refyear== 2013 & prov == 47
replace immigrants = 744662/3773057 if refyear== 2013 & prov == 48
replace immigrants = 1242275/4442345 if refyear== 2013 & prov == 59

//2017
replace immigrants = 885/511398 if refyear== 2017 & prov == 10
replace immigrants = 1211/147008 if refyear== 2017 & prov == 11
replace immigrants = 2689/841975 if refyear== 2017 & prov == 12
replace immigrants = 3536/753175 if refyear== 2017 & prov == 13
replace immigrants = 33665/8233643 if refyear== 2017 & prov == 24
replace immigrants = 107865/13733050 if refyear== 2017 & prov == 35
replace immigrants = 10194/1291425 if refyear== 2017 & prov == 46
replace immigrants = 7321/1101532 if refyear== 2017 & prov == 47
replace immigrants = 23987/4120388 if refyear== 2017 & prov == 48
replace immigrants = 34385/4780558 if refyear== 2017 & prov == 59


//Employment rate by gender (not labour force participation)
https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1410028703&pickMembers%5B0%5D=3.2&pickMembers%5B1%5D=4.1&cubeTimeFrame.startMonth=06&cubeTimeFrame.startYear=2015&referencePeriods=20150601%2C20150601
gen employment = .
//2013
replace employment = 57.1 if refyear== 2013 & prov == 10 & sex == 1
replace employment = 51.4 if refyear== 2013 & prov == 10 & sex == 2
replace employment = 63.1 if refyear== 2013 & prov == 11 & sex == 1
replace employment = 59.2 if refyear== 2013 & prov == 11 & sex == 2
replace employment = 60.5 if refyear== 2013 & prov == 12 & sex == 1
replace employment = 56 if refyear== 2013 & prov == 12 & sex == 2
replace employment = 59.7 if refyear== 2013 & prov == 13 & sex == 1
replace employment = 55 if refyear== 2013 & prov == 13 & sex == 2
replace employment = 63.6 if refyear== 2013 & prov == 24 & sex == 1
replace employment = 56.3 if refyear== 2013 & prov == 24 & sex == 2
replace employment = 65 if refyear== 2013 & prov == 35 & sex == 1
replace employment = 56.7 if refyear== 2013 & prov == 35 & sex == 2
replace employment = 70.1 if refyear== 2013 & prov == 46 & sex == 1
replace employment = 59.4 if refyear== 2013 & prov == 46 & sex == 2
replace employment = 72.5 if refyear== 2013 & prov == 47 & sex == 1
replace employment = 60.4 if refyear== 2013 & prov == 47 & sex == 2
replace employment = 75.9 if refyear== 2013 & prov == 48 & sex == 1
replace employment = 64 if refyear== 2013 & prov == 48 & sex == 2
replace employment = 63.8 if refyear== 2013 & prov == 59 & sex == 1
replace employment = 57.2 if refyear== 2013 & prov == 59 & sex == 2


//2015
replace employment = 54.7 if refyear== 2015 & prov == 10 & sex == 1 
replace employment = 50.5 if refyear== 2015 & prov == 10 & sex == 2
replace employment = 64.3 if refyear== 2015 & prov == 11 & sex == 1
replace employment = 58 if refyear== 2015 & prov == 11 & sex == 2
replace employment = 59.1 if refyear== 2015 & prov == 12 & sex == 1
replace employment = 54.4 if refyear== 2015 & prov == 12 & sex == 2
replace employment = 59.4 if refyear== 2015 & prov == 13 & sex == 1
replace employment = 54.4 if refyear== 2015 & prov == 13 & sex == 2
replace employment = 62.2 if refyear== 2015 & prov == 24 & sex == 1
replace employment = 56.8 if refyear== 2015 & prov == 24 & sex == 2
replace employment = 64.5 if refyear== 2015 & prov == 35 & sex == 1
replace employment = 56.7 if refyear== 2015 & prov == 35 & sex == 2
replace employment = 69 if refyear== 2015 & prov == 46 & sex == 1
replace employment = 59.1 if refyear== 2015 & prov == 46 & sex == 2
replace employment = 72.4 if refyear== 2015 & prov == 47 & sex == 1
replace employment = 60.1 if refyear== 2015 & prov == 47 & sex == 2
replace employment = 75 if refyear== 2015 & prov == 48 & sex == 1
replace employment = 63.3 if refyear== 2015 & prov == 48 & sex == 2
replace employment = 63.5 if refyear== 2015 & prov == 59 & sex == 1
replace employment = 56.4 if refyear== 2015 & prov == 59 & sex == 2

//2017
replace employment = 54.3 if refyear== 2017 & prov == 10 & sex == 1
replace employment = 50.9 if refyear== 2017 & prov == 10 & sex == 2
replace employment = 60.6 if refyear== 2017 & prov == 11 & sex == 1
replace employment = 55.2 if refyear== 2017 & prov == 11 & sex == 2
replace employment = 58.2 if refyear== 2017 & prov == 12 & sex == 1
replace employment = 54.5 if refyear== 2017 & prov == 12 & sex == 2
replace employment = 57.8 if refyear== 2017 & prov == 13 & sex == 1
replace employment = 54.3 if refyear== 2017 & prov == 13 & sex == 2
replace employment = 62.5 if refyear== 2017 & prov == 24 & sex == 1
replace employment = 56.7 if refyear== 2017 & prov == 24 & sex == 2
replace employment = 64.7 if refyear== 2017 & prov == 35 & sex == 1
replace employment = 57 if refyear== 2017 & prov == 35 & sex == 2
replace employment = 68.3 if refyear== 2017 & prov == 46 & sex == 1
replace employment = 58.6 if refyear== 2017 & prov == 46 & sex == 2
replace employment = 70.3 if refyear== 2017 & prov == 47 & sex == 1
replace employment = 59.8 if refyear== 2017 & prov == 47 & sex == 2
replace employment = 70.6 if refyear== 2017 & prov == 48 & sex == 1
replace employment = 60.7 if refyear== 2017 & prov == 48 & sex == 2
replace employment = 64.7 if refyear== 2017 & prov == 59 & sex == 1
replace employment = 57.2 if refyear== 2017 & prov == 59 & sex == 2

//Add E-cig Price by prov!!!! (add to final dataset)
gen ecig_price = . 

//2013
replace ecig_price = 0.2804 if refyear== 2013 & prov == 10
replace ecig_price = 0.2786 if refyear== 2013 & prov == 11
replace ecig_price = 0.3204 if refyear== 2013 & prov == 12
replace ecig_price = 0.2321 if refyear== 2013 & prov == 13
replace ecig_price = 0.4466 if refyear== 2013 & prov == 24
replace ecig_price = 0.3450 if refyear== 2013 & prov == 35
replace ecig_price = 0.590 if refyear== 2013 & prov == 46
replace ecig_price = 0.2544 if refyear== 2013 & prov == 47
replace ecig_price = 0.2743 if refyear== 2013 & prov == 48
replace ecig_price = 0.2208 if refyear== 2013 & prov == 59

//2015
replace ecig_price = 0.3162 if refyear== 2015 & prov == 10
replace ecig_price = 0.4496 if refyear== 2015 & prov == 11
replace ecig_price = 0.3352 if refyear== 2015 & prov == 12
replace ecig_price = 0.3956 if refyear== 2015 & prov == 13
replace ecig_price = 0.217 if refyear== 2015 & prov == 24
replace ecig_price = 0.3956 if refyear== 2015 & prov == 35
replace ecig_price = 0.290 if refyear== 2015 & prov == 46
replace ecig_price = 0.3726 if refyear== 2015 & prov == 47
replace ecig_price = 0.3796 if refyear== 2015 & prov == 48
replace ecig_price = 0.3923 if refyear== 2015 & prov == 59

//2017
replace ecig_price = 0.3269 if refyear== 2017 & prov == 10
replace ecig_price = 0.2972 if refyear== 2017 & prov == 11
replace ecig_price = 0.2852 if refyear== 2017 & prov == 12
replace ecig_price = 0.5068 if refyear== 2017 & prov == 13
replace ecig_price = 0.426 if refyear== 2017 & prov == 24
replace ecig_price = 0.5502 if refyear== 2017 & prov == 35
replace ecig_price = 0.4197 if refyear== 2017 & prov == 46
replace ecig_price = 0.4513 if refyear== 2017 & prov == 47
replace ecig_price = 0.3147 if refyear== 2017 & prov == 48
replace ecig_price = 0.351 if refyear== 2017 & prov == 59


save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Final Thesis Dataset.dta", replace 

sum ecig_price if refyear==2013
sum ecig_price if refyear==2015
sum ecig_price if refyear==2017

**prices closer compared to cpi

//reduce categories of dependent variable
gen prod_use = .
replace prod_use = 0 if anyuse == 0
replace prod_use = 1 if anyuse == 1 | anyuse == 6 | anyuse == 7 | anyuse == 11 
replace prod_use = 2 if anyuse == 2 | anyuse == 8 | anyuse == 9 | anyuse == 14 
replace prod_use = 3 if anyuse == 5 | anyuse == 12 | anyuse == 15
replace prod_use = 4 if anyuse == 3
replace prod_use = 5 if anyuse == 4 | anyuse == 10 | anyuse == 16 

label define prod_use 0 "No" 1 "Cigarette +" 2 "E-cigarette +" 3 "Cigarette and E-cigarette +" 4 "Cigar" 5 "Tobacco + other combinations" 
label values prod_use prod_use 

save "/Users/MahnoorKhan1/Desktop/Course Documents/3rd Semester/Thesis/Tables/Final Thesis Dataset.dta", replace 
