#import "@local/tortugui:0.1.0" : template, exercise, solution, proof
#import "@preview/finite:0.5.0": automaton, flaci
#show: template.with(
  course: [Inteligencia Artificial y Teoría de la Computación],
  professor: [Jesús Rodríguez Viorato],
  professor_email: "jesusr@cimat.mx",
  title: [Tarea 1],
  student: [Antonio Barragán Romero],
  student_email: "antonio.barragan@cimat.mx",
  date: datetime(day: 27, month: 8, year: 2025),
)

#show "automata": [autómata]
#show "numero": [número]
#show "AFD": [automata finito determinista]
#show "AND": [automata finito no determinista]
#show "ssi": [si y solo si]
#show "tq": [tal que]
#show "tqs": [tales que]
#let words = $Sigma^*$
#let gris = rgb("#e4e4e7")
#let exercise = exercise.with(supplement: "ejercicio")
// #set par(justify: false)
#show math.equation.where(block: false): box
#set cite(form: "prose")

Primero definamos las funciones extendidas Primero recordemos las funciones extendidas de transición $delta^*$ definidas
en @Martin_2011 que básicamente nos dicen a que estado(s) podemos llegar iniciando en un estado $q$ y leyendo una cadena $x$, $delta^*(q, x)$ con $q in Q $

#exercise(
  supplement: "",
)[10 pts][
  Dibuja un automata que acepte el lenguaje de todas las cadenas en ${0, 1}^*$ que tengan un numero un múltiplo de 3 de
  1's.
]<p1>
#solution[
  Notemos que necesitamos recordar la cantidad de 1's modulo $3$, es decir necesitamos tres estados, ${0, 1, 2}$. El
  estado inicial corresponde con la posibilidad de haber leído $0$ caracteres (la cadena vacía $epsilon$), es decir, el
  estado inicial es $0$. Como queremos haber leído un múltiplo de $3$ de 1's, entonces el estado final también es $0$.

  Luego, las transiciones entres estados son claras, cada que leamos un $0$ nos quedamos en el mismo estado y cada que
  leamos un $1$ nos movemos a la congruencia mas uno siguiente (modulo $3$), entonces nuestro automata queda como sigue:
  #align(center)[
    #figure[
      #automaton(
        (q0: (q0: 0, q1: 1), q1: (q1: 0, q2: 1), q2: (q2: 0, q0: 1)),
        initial: "q0",
        final: "q0",
        labels: (q0: "0", q1: "1", q2: "2", q3: "3"),
        style: (state: (fill: gris)),
      )
    ]<A1>
  ]
  Y sea $M_1$ este automata.
]

#exercise(
  supplement: "",
)[10 pts][
  Dibuja un automata que acepte el lenguaje de todas las cadenas de ${0, 1}^*$ que representen números en binario
  divisibles por $3$.
]<p2>
#solution[
  Podemos pensar que cuando el automata lee una cadena lo que esta pasando es que se hace un bitshift hacia la izquierda
  del nuevo bit, carácter en este caso, si el bit es $0$ el numero se multiplica por $2$ y cuando el bit es $1$ el numero
  se multiplica por $2$ y se suma $1$. Entonces la idea es simular este proceso con los residuos modulo $3$, por lo cual
  tendremos tres estados ${0, 1, 2}$ (las congruencias modulo $3$) y a cada uno de ellos lo enviamos a la congruencia
  correspondiente de aplicar el bitshift con $0$ o $1$. En el caso de $0$ al aplicar un bitshift de $0$ lo manda a $2 times 0 (mod 3)$,
  es decir, a $0$, al aplicar un bitshift de $1$ lo manda a $2 times 0 + 1(mod 3)$, es decir, a $1$. Se puede ver que el $0$ manda
  el $1$ al $2$ y el $2$ al $1$ y que el $1$ manda el $1$ al $0$ y el $2$ al $2$, al igual que antes el estado inicial y
  final seria el cero, pues nos interesa que nuestra cadena sea congruente a $0$ modulo $3$, entonces el automata que
  simula lo anterior quedaría como sigue:
  #align(center)[
    #figure[
      #automaton(
        (q0: (q0: 0, q1: 1), q1: (q2: 0, q0: 1), q2: (q1: 0, q2: 1)),
        initial: "q0",
        final: "q0",
        labels: ("q0": [0], "q1": [1], "q2": [2]),
        style: (state: (fill: gris)),
      )
    ]
  ]
  Sin embargo notemos que este automata acepta la cadena vacía $epsilon$, la cual en teoría, no tiene representación
  binaria y por tanto no puede ser aceptada por nuestro automata. Entonces para cambiar eso simplemente agreguemos un
  nuevo estado cuya transición de $0$ mande a $0$ y su transición de $1$ mande a $1$ (igual ) y el resto lo dejamos igual,
  obteniendo el siguiente automata:
  #align(center)[
    #figure[
      #automaton(
        (i: (q0: 0, q1: 1), q0: (q0: 0, q1: 1), q1: (q2: 0, q0: 1), q2: (q1: 0, q2: 1)),
        initial: "i",
        final: "q0",
        labels: ("q0": [0], "q1": [1], "q2": [2], "i": [INI]),
        layout: (q0: (0, 0), q1: (2, 3), i: (-2, 3)),
        style: (state: (fill: gris), q0-q0: (anchor: bottom), i-q0: (curve: -0.7)),
      )
    ]<A2>
  ]
  Y sea $M_2$ este automata
]

#exercise[10 pts ][
  Construye el automata producto que encontraste en los problemas @p1 y @p2. Esto para obtener un automata que reconozca
  el lenguaje de las cadenas de 0's y 1's que en binario sean divisibles por 3 pero que *no* tengan un múltiplo de 3 de
  1's.
]
#solution[
  Notemos que nos interesa $M_2 inter M_1^complement$. Encontremos primero $M_1^complement$, de #link(<A1>)[$M_1$],
  tenemos que $M_1^complement$ es:
  #align(center)[
    #figure[
      #automaton(
        (q0: (q0: 0, q1: 1), q1: (q1: 0, q2: 1), q2: (q2: 0, q0: 1)),
        initial: "q0",
        final: ("q1", "q2"),
        labels: (q0: "0", q1: "1", q2: "2", q3: "3"),
        style: (state: (fill: gris)),
      )
    ]
  ]
  Luego, el automata producto es el siguiente:
  #align(center)[
    #figure[
      #image("problema 3.svg", width: 150%)
    ]
  ]
  // #flaci.load(read("Automaton_problema3.json"))
  // #flaci.automaton(read("Automaton_problema3.json"))
]

#exercise[20 pts][
  Dibuja un AND que reconozca el lenguaje
  $
    L = { w in {0, 1}^*: w = 0^n 1^m 0^k,quad n, m>= 0, k>0},
  $
  y que solo tenga tres estados.
]
#solution[
  Consideremos el siguiente automata
  #align(center)[
    #automaton(
      (q0: (q0: 0, q1: 2), q1: (q2: 0, q1: 1), q2: (q2: 0)),
      labels: (q0-q1: $epsilon$),
      style: (state: (fill: rgb("#e4e4e7"))),
    )
  ]
  Podemos notar que al inicio puede (o no) leer puros 0's, luego lee puros 1's y para pasar al estado aceptor tuvo que
  haber leído al menos un 0, ademas una vez que llega $q_2$ solo puede leer 0's por lo cual una cadena aceptada puede
  tener a lo mas una subcadena de 1's consecutivos. Asi, nuestra automata reconoce a $L$, como queremos.
]
// #flaci.load(read("problema1.json"))
#exercise[10 pts][
  Prueba que cualquier AND se puede cambiar a uno equivalente con un solo estado aceptor.
]<p5>
#proof[
  Sea $A = (Q, Sigma, delta, q_0, F)$ un AND y supongamos que $abs(F) > 1$. Agreguemos un estado nuevo a $Q$, digamos $omega$ y
  construyamos el siguiente automata $M = (Q union {omega}, Sigma, Delta, q_0, {omega})$, donde $Delta:(Q union {w}) times (Sigma union {epsilon}) -> cal(P)(Q)$ esta
  definida como $
    Delta(q, s) = cases(
      delta(q, s) "si" q in Q comma s in Sigma,
      delta(q, s) union {omega} "si" q in F comma s = epsilon,
      emptyset "si" q = omega,

    )
  $
  Veamos que $L(A) = L(M)$, es decir, que $A$ y $M$ reconocen el mismo lenguaje. Si $w in L(A)$ tenemos que $delta^*(q_0, w) inter F != emptyset$,
  como $delta(q, s) subset Delta(q, s)$ por definición entonces $delta^*(q, s) subset Delta^*(q, s)$ y por tanto $Delta^*(q_0, w) inter F != emptyset$,
  es decir, $w$ puede llegar a un estado de $F$ en $M$, luego, notemos que podemos transicionar por $epsilon$ a ${omega}$,
  pues si $q in Delta^*(q_0, w)$ es tq $q in F$ entonces $Delta(q, epsilon) subset Delta^*(q_0, w)$
  // $
  //   Delta^*(q_0, w epsilon) = Lambda(union.big_(p in Delta^*(q_0, w)) {Delta(p, epsilon)})
  // $
  asi tenemos que $Delta^*(q_0, w) inter {omega} != emptyset$, es decir, $w$ es aceptada por $M$, entonces $L(A) subset L(M)$.

  Ahora supongamos que $w in L(M)$ entonces $Delta^*(q_0, w) inter {omega} != emptyset$, por definición de $Delta$ y $Lambda$ la
  única forma de que esto suceda es que exista $q in Delta^*(q_0, w)$ tq $q in F$, luego, por construcción tenemos que $delta$ y $Delta$ coinciden
  en $Q times Sigma$ y como $Delta(omega, dot) = emptyset$ no es posible moverse de $omega$ a algún estado de $F$ por lo
  cual $q in delta^*(q_0, w)$, es decir, $w$ es aceptada por $L(A)$, entonces $L(M) subset L(A)$. De lo anterior tenemos
  que $L(A) = L(M)$ como queríamos.
]

#exercise[10 pts][
  Para cada cadena $w = a_1 a_2 dots a_n$, el reverso de $w$ se define como $w^R = a_n a_(n-1)dots a_1$. Para todo
  lenguaje $L$, sea $L^R = { w^R: w in L}$. Demuestra qeu si $L$ es regular, entonces $L^R$ también lo es.
]
#proof[
  Como $L$ es regular sabemos que exercise AFD que reconoce a $L$ entonces también existe un AND que reconoce a $L$,
  luego, por el @p5 existe un AND con un solo estado que reconoce a $L$, sea $A = (Q, Sigma, delta, q_0, {f})$ este ultimo
  automata. La idea es cambiar la orientación de las transiciones en nuestro automata. Consideremos el siguiente AND $A^R = (Q, Sigma, Delta, f, {q_0})$,
  donde $Delta: Q times (Sigma union {epsilon})$ esta dada por
  $
    Delta(q, s) = union.big_(r in Q: q in delta(r, s)) {r} .
  $
  Veamos que $A^R$ reconoce a $L^R$. Si $w in L$ con $w = w_1 w_2 dots w_n$, entonces $w$ es aceptada por $A$, es decir $delta^*(q_0, w) = {f}$,
  es decir, $w = w_1 w_2 dots w_n$ es un camino de $q_0$ a $f$, como $A^R$ solo cambio el sentido de las flechas entonces $w^R = w_n w_(n-1) dots w_1$ es
  un camino de $f$ a $q_0$, por lo cual $Delta^*(f, w^R) = {q_0}$ y por tanto $A^R$ acepta a $w^R$, lo cual implica que $L^R subset L(A^R)$.

  Para ver que $L(A^R) subset L^R$, de manera análoga al caso anterior se prueba que si $w^R$ es aceptada por $A^R$ entonces $w$ es
  aceptada por $A$, es decir $w in L$ y por tanto $w^R in L^R$. De lo anterior obtenemos que $L^R$ es reconocido por $A^R$ y
  por tanto es regular.

]

#exercise[20 pts][
  Demuestre que el lenguaje $L = {0^n 1^m: n!= m}$ no es regular.
]
#proof[
  Procedamos por contrapositiva y veamos que $L$ no satisface el _lema del bombeo_. Dado $n in NN$ consideremos la
  siguiente cadena $w$ dada por $w = 0^n 1^(n! + n)$, se puede ver que $w in L$ pues para todo $n in NN$ se tiene que $n! + n > n$.
  Luego para toda descomposición $w = x y z$ de $w$ con $abs(x y) <= n$ y $abs(y)>0$ se debe cumplir que $x=0^(n-k)$, $y = 0^k$ y $z = 1^(n! + n)$ para
  algún $k in {1, dots, n}$. Entonces, dado $k in {1, dots, n}$ consideremos una de tales descomposiciones, es decir, $w = x y z$ con $x=0^(n-k)$, $y = 0^k$ y $z = 1^(n! + n)$,
  es claro que $n!/k in NN$ dado que $1<= k <=n$, y notemos que $x y^(n!/k + 1) z in.not L$, pues
  $
    x y^(n!/k + 1) z = 0^(n-k) (0^k)^(n!/k + 1) 1^(n! + n) = 0^(n-k) 0^(k n!/k + k) 1^(n! + n) = 0^n 0^n! 1^(n! + n) = 0^(n! + n)1^(n! + n) .
  $
  De lo anterior, dado que $n$ fue arbitrario tenemos que $L$ no puede ser regular, pues no cumple el _lema del bombeo_.
]

#exercise[20 pts][
  Dado $w in Sigma^*$ una palabra y $L subset Sigma^*$ un lenguaje, definimos $L_omega = {x in Sigma^*: w x in L}$.
  Decimos que $omega ~ omega'$ ssi $L_omega = L_omega'$. Demuestre que $~$ es una relación de equivalencia y que si un
  automata deterministico $A = (Sigma, Q, delta, q_0, F)$ reconoce a $L$, entonces $abs(Q) >= abs(L slash ~)$.
]
#proof[
  Primero veamos que $~$ es una relación de equivalencia. #footnote[Se sigue de que la igualdad es una relación de equivalencia.]
  - (_Reflexiva_) Dado $w in words$ es claro que $L_w = L_w$ y por tanto $w ~ w$.
  - (_Simétrica_) Dadas $w, w' in words$ tqs $w ~ w'$ entonces $L_w = L_w'$, por la simetría de la igualdad tenemos que $w' ~ w$.
  - (_Transitiva_) Supongamos que $w, w', w'' in words$ tqs $w ~ w'$ y $w' ~ w''$ entonces $L_w = L_w'$ y $L_w' = L_w''$,
    asi $L_w = L_w''$ y por tanto $w ~ w''$.
  Ahora supongamos que $A = (Q, Sigma, delta, q_0, F)$ reconoce a $L$. Y notemos lo siguiente. Si $w, w' in words$ son
  palabras tqs terminan en el mismo estado, entonces para cualquier $x in words$ se va a cumplir que $w x$ y $w' x$ terminan
  en el mismo estado asi $L_w = L_w'$ y se sigue que $w ~ w'$. De lo anterior, si $w tilde.not w'$ entonces $L_w != L_w'$ y
  por tanto $w$ y $w'$ no pueden terminar en el mismo estado.

  Lo anterior nos dice que si tomamos una palabra de cada clase de equivalencia, no puede haber dos que terminen en el
  mismo estado y por tanto se debe cumplir que $abs(Q) >= abs(L slash ~)$

]
#bibliography("../../biblio.yml")