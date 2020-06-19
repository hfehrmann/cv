open Latex

val cite: t -> t
val bibentry: t -> t
val vbox: t -> t
val latex: Melt.Verbatim.melt_verbatim_function

type my_size = [
  | `Textwidth
  | `Datewidth
  | `Descriptionwidth
]

val my_minipage: my_size -> t -> t
val ragged_left: t

type my_box = [
  | `Descriptionbox
]

val save_box: my_box -> t -> t
val use_box: my_box -> t
val height_box: my_box -> t
val depth_box: my_box -> t

type my_length = [
  | `Linerule
]

val length_to_latex: my_length -> t
