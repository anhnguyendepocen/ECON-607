
/* Created by RM on 2018.02.07 for Macro Graphs for PS2 Romer Q 9.6 */

clear
set more off

global out "/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures"

/* Create initial series */

set obs 100
g k = [_n] + 20
g dotk = 10 - 9
g dotq = (18 -  sqrt(k) - 5.5) / 5
g saddle = (dotk + dotq) / 2

label var dotq "Dot Q = 0"
label var dotk "Dot K = 0"
label var saddle "Saddle Path"

*twoway (scatter dotq k, msize(small)) (scatter dotk k, msize(small)) (scatter saddle k, msize(small))

g diff = abs(dotk - dotq) 
egen min_diff = min(diff)
g pre_equilibrium_k = k if diff == min_diff
egen equilibrium_k = max(pre_equilibrium_k)


/* Part A */
/* War destroys half of K */

g post_war = saddle if k == (equilibrium_k/2)
g pre_war = saddle if k == equilibrium_k

label var post_war "Post War"
label var pre_war "Pre War"

twoway (scatter dotq k, msize(small)) (scatter dotk k, msize(small)) (scatter saddle k, msize(small))  ///
	(scatter post_war k, msize(large) msymbol(T)) (scatter pre_war k, msize(large) msymbol(T)),  ///
	title("ECON 607 PS2 Romer Question 9.6 a: War") ///
	xtitle("K") ytitle("q") ///
	note("After the war, capital and q jump and then move along the saddle path to the pre-war equilibrium")

graph export "$out/PS2 Romer 9.6 a.pdf", as (pdf) replace
	
	
/* Part B */
/* Tax to Returns form owning firms */

g taxed_dotq = dotq - .25
label var taxed_dotq "Taxed Dot Q = 0"

g taxed_saddle = (dotk + taxed_dotq) / 2
label var taxed_saddle "Taxed Saddle Path"

g taxed_diff = abs(dotk - taxed_dotq) 
egen taxed_min_diff = min(taxed_diff)
g pre_taxed_equilibrium_k = k if taxed_min_diff == taxed_diff
egen taxed_equilibrium_k = max(pre_taxed_equilibrium_k)

g taxed_equilibrium = taxed_saddle if k == taxed_equilibrium_k
label var taxed_equilibrium "Taxed Equilibrium"

g tax_jump = taxed_saddle if k == equilibrium_k
label var tax_jump "Jump After Taxes"

twoway (scatter dotq k, msize(small)) (scatter dotk k, msize(small)) (scatter saddle k, msize(small))  ///
	(scatter taxed_dotq k, msize(small) msymbol(Dh)) (scatter taxed_saddle k, msize(small)  msymbol(Dh)) ///
	(scatter taxed_equilibrium k, msize(large) msymbol(T)) (scatter tax_jump k, msize(large) msymbol(T)), ///
	title("ECON 607 PS2 Romer Question 9.6 b: Tax on Returns") ///
	xtitle("K") ytitle("q") ///
	note("At the announcement, q jumps down onto the saddle path and then move to new equilibrium")

graph export "$out/PS2 Romer 9.6 b.pdf", as (pdf) replace

/* Part C */

g taxed2_dotk = 1.2
label var taxed2_dotk "Taxed Dot K = 0"

g taxed2_saddle = (taxed2_dotk + dotq) / 2
label var taxed2_saddle "Taxed Saddle Path"

g taxed2_diff = abs(taxed2_dotk - dotq) 
egen taxed2_min_diff = min(taxed2_diff)
g pre_taxed2_equilibrium_k = k if taxed2_min_diff == taxed2_diff
egen taxed2_equilibrium_k = max(pre_taxed2_equilibrium_k)

g taxed2_equilibrium = taxed2_saddle if k == taxed_equilibrium_k
label var taxed2_equilibrium "Taxed Equilibrium"
 
g tax2_jump = taxed2_saddle if k == equilibrium_k
label var tax2_jump "Jump After Taxes" 
 
twoway (scatter dotq k, msize(small)) (scatter dotk k, msize(small)) (scatter saddle k, msize(small))  ///
	(scatter taxed2_dotk k, msize(small) msymbol(Dh)) (scatter taxed2_saddle k, msize(small)  msymbol(Dh)) ///
	(scatter taxed2_equilibrium k, msize(large) msymbol(T)) (scatter tax2_jump k, msize(large) msymbol(T)) , ///
	title("ECON 607 PS2 Romer Question 9.6 c: Tax on Investment") ///
	xtitle("K") ytitle("q") ///
	note("At the announcement, q jumps up onto the saddle path and then move to new equilibrium.")

graph export "$out/PS2 Romer 9.6 c.pdf", as (pdf) replace





