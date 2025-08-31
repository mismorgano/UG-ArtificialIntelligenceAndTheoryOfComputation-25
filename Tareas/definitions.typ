#import "@local/tortugui:0.1.0": exercise

#let apply_definitions(doc) = {
  show "automata": [autómata]
  show "numero": [número]
  show "AFD": [automata finito determinista]
  show "AFDs": [autómatas finitos deterministas]
  show "AFND": [automata finito no determinista]
  show "AFNDs": [autómatas finitos no deterministas]
  show "AFNDG": [and generalizado]
  show "AFNDGs": [ands generalizados]
  
  show "ssi": [si y solo si]
  show "tq": [tal que]
  show "tqs": [tales que]

  show "ER": [expresión regular]
  show "ERs": [expresiones regulares]
  show "GLC": [gramática libre de contexto]
  show "LLCs": [lenguajes libres de contexto]

  // #set par(justify: false)
  show math.equation.where(block: false): box
  set cite(form: "prose", style: "alphanumeric")
  doc
}

#let words = $Sigma^*$
#let gris = rgb("#e4e4e7") 
#let exercise = exercise.with(supplement: "ejercicio")