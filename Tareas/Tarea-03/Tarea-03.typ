#import "@local/tortugui:0.1.0": template, exercise

#show: template.with(
  course: [Inteligencia Artificial y Teoría de la Computación],
  professor: [Jesús Rodríguez Viorato],
  professor_email: "jesusr@cimat.mx",
  title: [Tarea 3],
  student: [Antonio Barragán Romero],
  student_email: "antonio.barragan@cimat.mx",
  date: datetime(day: 27, month: 8, year: 2025),
)

#show raw.where(lang: "pseudocode"): it => [
    #show regex("\b(for|do|to|begin|end)\b") : keyword => text(weight:"bold", keyword)
    #it
]
#exercise[
  Sea $n in NN$, y sea $L$ el conjunto de palabras palindromicas de longitud $2n$. Es decir, el lenguaje:
  $
    L = {w w^r: w in {a, b}^* y abs(w) = n}.
  $
  Donde $w^r$ representa la palabra escrita al revés. Encuentre la cantidad minima de estados que puede tener un automata
  deterministico que reconozca $L$. Justifica tu respuesta.
]

#exercise[
  Diseña una maquina de Turing que decida el lenguaje
  $
    L = {w in {0, 1}^*: w "contiene el doble de" 0's "que de" 1's}.
  $
]

#exercise[
  Revisa la definición formal de MT y contesta las siguientes preguntas:
  - ¿Puede una MT escribir un espacio en blanco?
  - ¿Puede el alfabeto de la maquina $Gamma$ ser el mismo que el alfabeto de la entrada $Sigma$?
  - Sobre la cabeza de la MT, ¿puede estar en el mismo lugar dos pasos sucesivos?
  - Una maquina de Turing, ¿puede tener solo un estado?
]

#exercise[
  De una definición formal de un enumerador, o sea, una MT que imprime los elementos del lenguaje.
  Considérela que se una maquina con dos cintas y que usa su segunda tinta como impresora. Incluye la definición de un lenguaje enumerado.
]

#exercise[
  Revisa el Teorema 3.21 del libro; se demuestra que un lenguaje es Turing-reconocible si algún enumerador lo enumera. ¿Por qué no utilizamos el siguiente algoritmo más simple para la prueba?
  Como en la prueba, $s_1, s_2, dots.down$ es una lista de todas las cadenas $Sigma^*$.
  ```pseudocode
  E = "Ignora el input".
  for i= 1, 2, 3, ... do
    EXECUTE M en s_i 
    Si la acepta, imprima s_i
  end for
  ```
]

#exercise[
  Demuestre que un AFD con cola reconoce los mimos lenguajes que las MTs, es decir, que son maquinas equivalentes.
]