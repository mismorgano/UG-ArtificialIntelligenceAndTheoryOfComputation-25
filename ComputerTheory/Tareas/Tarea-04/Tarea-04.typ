#import "@local/tortugui:0.1.0": definition, exercise, proof, solution, template
#import "../definitions.typ": apply_definitions, cod, words
#show: template.with(
  course: [Inteligencia Artificial y Teoría de la Computación],
  professor: [Jesús Rodríguez Viorato],
  professor_email: "jesusr@cimat.mx",
  title: [Tarea 4],
  student: [Antonio Barragán Romero],
  student_email: "antonio.barragan@cimat.mx",
  date: datetime(day: 6, month: 10, year: 2025),
)
#show: apply_definitions
#exercise[
  Un _homomorfismo_ es una función $f:Sigma->Gamma^*$ de un alfabeto $Sigma$ a cadenas en otro alfabeto $Gamma$. Se
  puede extender $f$ para transformar cadenas en $words$. Y de igual manera podemos convertir un lenguaje
  $L subset Sigma$ en un lenguaje $f(Sigma) = {f(w):w in L} subset Gamma^*$. Demuestra que los lenguajes decidibles no
  son cerrados bajo homomorfismo.
]

#exercise[
  Prueba que un lenguaje $C$ es Turing-reconocible ssi existe un lenguaje decidible $D$ tq
  $C = {x: exists y "tq" cod(x, y) }$.
]

#exercise[
  Sea $ T = { cod(M): M "es un MT que acepta" w^R "siempre que" M "acepte" w}. $ Muestre que $T$ es indecidible
]

#exercise[
  Pruebe que hay un lenguaje indecidible sobre el alfabeto $sigma = {1}$.
]

#exercise[
  Muestre que $P$ y $N P$ son cerrados bajo la operación $space^*$.
]
#exercise[
  Muestre que $P R I M E S = {m : m "es un primo en binario"}$ es un lenguaje $N P$.
]

