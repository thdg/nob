Nub Programming Language!

Nub er forritunarmál sem er hannað sérstaklega til þess að vera einfalt og þægilegt í notkun fyrir einfalda stærðfræðilega útreikninga. Nub er því reglulega hentugt til að nota í kennslu í bæði stærðfræði og forritun á hvaða skólastigi sem er, fyrir byrjendur jafnt sem lengra komna.

Dæmi um forrit í Nub:

--------------------------------------------------------------------
PI: 1.14 					!skilgreining á fastanum PI
rummal_kulu: y = r^3*PI*4/3 !falls skilgreining fyrir rúmmál kúlu

v: rummal_kulu 3 			!kallað á fallið rummal_kulu með r=3
printn v 					!rúmmálið prentað út í sér línu
--------------------------------------------------------------------
print "Halló heimur!\n"
--------------------------------------------------------------------
hallo_heimur: (
  print "Halló heimur!\n"
)

hallo_heimur
--------------------------------------------------------------------

frátekin nöfn:
	n
	y
	if
	else
	elif
	for
	while
	t
	f
	
whitespace is critical

GAGNATÖG:
	heiltala,
	fleytitala,
	strengur,
	boolean, !t eða f

GAGNALÍKÖN:
	vigur,
	fylki,

EXPRESSION:

dæmi: 
	1+2
	1*2
	1-2
	-1
	1/2
	2^2
	1+2*3 eq. 1+(2*3)
	(1+2)*3

ABSTRACT EXPRESSION:

dæmi:
	a+1
	x^2+2x+a

Fall skilgreining:

nafn: y = ABSTRACT EXPRESSION

dæmi:
	rummal_kulu: y = r^3*pi*4/3

kall: kalla má á föll með nefndum breytum eða breytunum í þeirri röð sem þær byrtast
	rummal_kulu r=5, pi=3.14 !not implemented
	rk: rummal_kulu 5, 3.14

Breytu skilgreining:

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

comment
 <!------------------------------->
    eru inni í svona 
    dóti með upphrópunarmerki
    með stærra en og minna merki
    sem opna og loka
 <-------------------------------!>

<!
  eru inni í svona 
  dóti með upphrópunarmerki
  með stærra en og minna merki
  sem opna og loka 
!>

 eða
 
 !þetta er komment

for i=1:3
  print "a"

boolean gildið f, tómur strengur, tómur vigur, og heiltalann 0 er tekið sem ósatt

while a>0
  print a
  a: a-1

if a
  print a
elif b or d
  print b
else
  print c

print 1, 2, 3
!>> 1 2 3

prints [1 2 3], ", "
!>> 1, 2, 3.

print 1, 2, 3, "\n"
!>> 1 2 3

printn 1, 2, 3
!>> 1
!>> 2
!>> 3


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

eða !not implemented

nafn: (
  skipanir
)

fyrir fall sem skilar engu

breyta nefnd með stórum stöfum erfist með sviðum en þær með litlum stöfum gera það ekki.
þannig fallið rummal_kulu tekur aðeins inn eina breytu r en fallið rummal_kulu_r tekur inn bæði r og pi

PI = 3.14
rummal_kulu: y = r^3*PI*4/3
rummal_kulu_r: y = r^3*pi*4/3
