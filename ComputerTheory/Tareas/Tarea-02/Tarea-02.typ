#import "@local/tortugui:0.1.0": template 
#import "../definitions.typ": apply_definitions, exercise, gris
#import "@preview/finite:0.5.0"
#show: template.with(
  course: [Inteligencia Artificial y Teoría de la Computación],
  professor: [Jesús Rodríguez Viorato],
  professor_email: "jesusr@cimat.mx",
  title: [Tarea 2],
  student: [Antonio Barragán Romero],
  student_email: "antonio.barragan@cimat.mx",
  date: datetime(day: 27, month: 8, year: 2025),
)
#show: apply_definitions

#exercise[15 pts][
  Convierte las siguientes ERs en AFNDs usando el método visto en clase (Teorema 1.54 de @Sipser_2013). Para todos los
  casos usa $Sigma = {a,b}$.
  #set enum(numbering: "A.")
  + $a(a b b)^* union b$
  + $a^+ union (a b)^+$
  + $(a union b^+)a^+b^+$
]

#exercise[10 pts][
  Encuentra una ER que represente el lenguaje de todas las cadenas de 0's y 1's que no contienen la subcadena $110$
]

#exercise[15 pts][
  Convierte el siguiente AFND en AFNDGs y luego reducelo quitando un estado a la vez hasta obtener una ER.
  #align(
    center,
  )[
    #figure(
      finite.automaton(
        (q1: (q2: "e", q3: "a"), q2: (q1: "a"), q3: (q2: "a, b", q3: "b")),
        initial: "q1",
        final: "q2",
        labels: (q1: [1], q2: [2], q3: [3]),
        layout: (q1: (0, 0), q2: (3, 0), q3: (1.5, -4)),
        style: (state: (fill: gris),
        q1-q3: (curve: -1), q3-q2: (curve: -1), q3-q3: (anchor: top), q1-q2:(label: $epsilon$)),
        //   layout: finite.layout.group.with(grouping: (("q1", "q2"), "q3"), spacing: 2, layout: finite.layout.linear.with(dir: right))
      ),
    )
  ]
]
#exercise[20 pts][
  Da una GLC que genere el lenguaje
  $
    A = {a^i b^j c^k: "donde" i=j " o " j=k "con" i, j, k >= 0}.
  $
]

#exercise[20 pts][
  Muestre que los LLCs son cerrados bajo operaciones regulares: union, concatenación y estrella de Kleen.
]

#exercise[20 pts][
  Sea *B* el lenguaje de todas las cadenas palindromicas en ${0, 1}$ que contienen la misma cantidad de 0's que de 1's.
  Muestre que *B* no es libre de contexto.
]#bibliography("../../../biblio.yml")