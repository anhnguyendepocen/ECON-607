/* Created by RM on 2018.02.07 for Macro Graphs for PS2 Romer Q 9.8 */


clear
set more off

set obs 100

global out "/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures"

/*a*/

g delta = .1

g H  = [_n] + 50

/*dot h locus */
*I = I(p__H), I'() > 0; \dot H = I - \delta H \implies I = \delta H

g doth = (delta * H) / 2

/*dot p locus */
*R = R(H), R'() < 0; R(H) + \dot p_H = r p_H \implies R(H) = r p_H \implies p_H = \frac{R(H)}{r}

g r = .05

g dotp_H = (((-H+(10000*r))/r) ) / 1500

g saddle = (dotp_H + doth) / 2

g diff = abs(doth - dotp_H) 
egen min_diff = min(diff)
g pre_equilibrium_H = H if diff == min_diff
egen equilibrium_H = max(pre_equilibrium_H)

g equilibrium_spot = saddle if H == pre_equilibrium_H

label var doth "Dot H = 0"
label var dotp_H "Dot pH = 0"
label var saddle "Saddle Path"

label var equilibrium_spot "Equilibrium H,pH"

g ar1vert_y1 = 7.0 
g ar1vert_y2 = 7.5
g ar1vert_x1 = 105
g ar1vert_x2 = 105
g ar1hor_y1 = 7.0 
g ar1hor_y2 = 7.0
g ar1hor_x1 = 105
g ar1hor_x2 = 110

g ar2vert_y1 = 2.5 
g ar2vert_y2 = 2.0
g ar2vert_x1 = 105
g ar2vert_x2 = 105
g ar2hor_y1 = 2.5 
g ar2hor_y2 = 2.5
g ar2hor_x1 = 105
g ar2hor_x2 = 100

g ar3vert_y1 = 5.0 
g ar3vert_y2 = 5.5
g ar3vert_x1 = 55
g ar3vert_x2 = 55
g ar3hor_y1 = 5.0 
g ar3hor_y2 = 5.0
g ar3hor_x1 = 55
g ar3hor_x2 = 60

g ar4vert_y1 = 5.5 
g ar4vert_y2 = 5.0
g ar4vert_x1 = 145
g ar4vert_x2 = 145
g ar4hor_y1 = 5.5
g ar4hor_y2 = 5.5
g ar4hor_x1 = 145
g ar4hor_x2 = 140

twoway (scatter doth H, msize(small)) (scatter dotp_H H, msize(small)) (scatter saddle H, msize(small))  ///
	(scatter equilibrium_spot H, msize(large) msymbol(T)) ///
	(pcarrow ar1vert_y1 ar1vert_x1 ar1vert_y2 ar1vert_x2, mcolor(black) color(black)) ///
	(pcarrow ar1hor_y1 ar1hor_x1 ar1hor_y2 ar1hor_x2, mcolor(black) color(black)) ///	
	(pcarrow ar2vert_y1 ar2vert_x1 ar2vert_y2 ar2vert_x2, mcolor(black) color(black)) ///
	(pcarrow ar2hor_y1 ar2hor_x1 ar2hor_y2 ar2hor_x2, mcolor(black) color(black)) ///	
	(pcarrow ar3vert_y1 ar3vert_x1 ar3vert_y2 ar3vert_x2, mcolor(black) color(black)) ///
	(pcarrow ar3hor_y1 ar3hor_x1 ar3hor_y2 ar3hor_x2, mcolor(black) color(black)) ///
	(pcarrow ar4vert_y1 ar4vert_x1 ar4vert_y2 ar4vert_x2, mcolor(black) color(black)) ///
	(pcarrow ar4hor_y1 ar4hor_x1 ar4hor_y2 ar4hor_x2, mcolor(black) color(black)) ///
	, title("ECON 607 PS2 Romer Question 9.8 a,b: Phase Diagram") ///
	legend(order(1 2 3 4)) ///
	xtitle("H") ytitle("pH")

	/*twoway (scatter doth H, msize(small)) (scatter dotp_H H, msize(small)) (scatter saddle H, msize(small))  ///
	(scatter equilibrium_H H, msize(large) msymbol(T)) ///
	*(scatter post_war k, msize(large) msymbol(T)) (scatter pre_war k, msize(large) msymbol(T))  ///
	, title("ECON 607 PS2 Romer Question 9.8 a: Phase Diagram") ///
	xtitle("H") ytitle("pH") ///
	*note("After the war, capital and q jump and then move along the saddle path to the pre-war equilibrium")
	*/
graph export "$out/PS2 Romer 9.8 ab.pdf", as (pdf) replace
	
	
	
/* C permanent increase in r */

g r2 = .08

g dotp_H2 = (((-H+(10000*r))/r2) ) / 1500

g saddle2 = (dotp_H2 + doth) / 2

label var dotp_H2 "High r Dot H = 0"
label var saddle2 "High r Saddle Path"

g diff2 = abs(doth - dotp_H2) 
egen min_diff2 = min(diff2)
g pre_equilibrium_H2 = H if diff2 == min_diff2
egen equilibrium_H2 = max(pre_equilibrium_H2)

g equilibrium_spot2 = saddle2 if H == pre_equilibrium_H2

label var equilibrium_spot2 "High r Equilibrium H,pH"

twoway (scatter doth H, msize(small)) (scatter dotp_H H, msize(small)) (scatter saddle H, msize(small))  ///
	(scatter dotp_H2 H, msize(small) msymbol(Dh)) (scatter saddle2 H, msize(small) msymbol(Dh)) ///
	(scatter equilibrium_spot H, msize(large) msymbol(T)) (scatter equilibrium_spot2 H, msize(large) msymbol(T)) ///
	, title("ECON 607 PS2 Romer Question 9.8 c: High r") ///
	xtitle("H") ytitle("pH") ///
	note("When r rises, pH down to the new saddle path and then H,pH decrease to new equilibrium")

graph export "$out/PS2 Romer 9.8 c.pdf", as (pdf) replace
	
