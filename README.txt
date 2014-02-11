Nob Programming Language!
=========================

Nob er forritunarmál sem er hannað sérstaklega til þess að vera einfalt og þægilegt í notkun fyrir einfalda stærðfræðilega útreikninga. 
Nub er því verulega hentugt til að nota í kennslu í bæði stærðfræði og forritun á hvaða skólastigi sem er - fyrir byrjendur jafnt sem lengra komna.

Dæmi um forrit í Nub:
---------------------

Fall til að reikna út rúmmál kúlu og kall á það fall:

	PI: 1.14 					!skilgreining á fastanum PI
	rummal_kulu: y = r^3*PI*4/3 !falls skilgreining fyrir rúmmál kúlu

	v: rummal_kulu 3 			!kallað á fallið rummal_kulu með r=3
	printn v 					!rúmmálið prentað út í sér línu


Halló heimur:

	print "Halló heimur!\n"

Sama og fyrir ofan:

	hallo_heimur: (
	  print "Halló heimur!\n"
	)

	hallo_heimur

Breytuheiti
-----------

Breytuheiti mega innihalda hvaða bókstaf og tölustaf sem er ásamt tákninu "_".
Einu skilyrðin eru að heitið byrji á bókstaf og sé ekki eitt af fráteknu nöfnunum í Nob.

Frátekin nöfn:

	n
	y
	if
	else
	elif
	for
	while
	t
	f
	
Eftirfarandi tekur boolean gildið f:

	tómur strengur, 
	tómur vigur, 
	heiltalann 0,

Gagnatög
--------

	heiltala,
	fleytitala,
	strengur,
	boolean,

Gagnalíkön
----------

	vigur,
	fylki,

Aðgerðir
----------

dæmi:

	1+2
	1*2
	1-2
	-1
	1/2
	2^2
	1+2*3 eq. 1+(2*3)
	(1+2)*3
	a+1
	x^2+2x+a

Falls skilgreiningar
-------------------

almennt:

	nafn: y = EXPRESSION

dæmi:

	rummal_kulu: y = r^3*pi*4/3

Köll: kalla má á föll með nefndum breytum eða breytunum í þeirri röð sem þær byrtast

	rummal_kulu r=5, pi=3.14 !not implemented
	rk: rummal_kulu 5, 3.14

Breytu skilgreiningar
---------------------

dæmi:

	a: 1
	b: 2, c: 3 !not implemented
	d: [1 2 3]

	d: 1:3    !not implemented
	d: 1:1:3  !not implemented

tómur vigur:

	a: []

fylki:

	A: [1 2 3, 4 5 6]

runur: not implemented

	a: 1:1: !1,2,3,4,...
	a: 1,n+1
	b: 1,1,n-2+n-1

athugasemdir:

	 <!------------------------------->
	   Þetta er athugasemd sem má
	   taka margar línur
	 <-------------------------------!>

	<!
	  Þetta er önnur athugasmed sem
	  má taka margar línur
	!>

 eða
 
 	!þetta er athugasemd í einni línu

For lykkja
----------

	for i=[1 2 3]
	  print i

	!>> 1 2 3

while lykkja
------------

	a: 3
	while a>0
	  print a
	  a: a-1

	!>> 3 2 1

if setning
----------

	a: t
	b: f

	if a
	  print 1
	elif b
	  print 2
	else
	  print 3

	!>> 1

úttak
-----

	print 1, 2, 3
	!>> 1 2 3

	prints [1 2 3], ", "
	!>> 1, 2, 3

	print 1, 2, 3, "\n"
	!>> 1 2 3

	prints [1 2 3], "\n"
	!>> 1
	!>> 2
	!>> 3

	printn 1, 2, 3
	!>> 1
	!>> 2
	!>> 3


Skriptur og forrit
------------------

Hvert skjal má innihalda mörg föll
hægt er að includea skjalinu með
include nafn
og þá er hægt að kalla í föllin með nafn.fall
eða includea falli með 
include fall from nafn
ef fall er í skjalinu sem heitir því sama og skjalið þá má kalla
beint í fallið með nafn eftir að því er includeað

föll sem eru margar skipanir eru skilgreind svona:

	nafn: y = (
	  skipanir
	  return breyta
	)

eða fyrir fall sem skilar engu

	!not implemented
	nafn: (
	  skipanir
	)

breyta nefnd með stórum stöfum erfist með sviðum en þær með litlum stöfum gera það ekki.
Þannig fallið rummal_kulu tekur aðeins inn eina breytu r en fallið rummal_kulu_pi tekur inn bæði r og pi

	PI = 3.14
	rummal_kulu: y = r^3*PI*4/3
	rummal_kulu_pi: y = r^3*pi*4/3
