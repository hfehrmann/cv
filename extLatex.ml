open Latex

let cite t = command "cite" [T, t] T
let bibentry t = command ~packages:["bibentry", ""] "bibentry" [T, t] T
let vbox t = command "vbox" [T, t] T

let latex : Melt.Verbatim.melt_verbatim_function = fun objs ->
  let map = function
  | `V t -> text t
  | `C t -> t
  | _ -> assert false
  in
  concat (List.map map objs)

type my_size = [
  | `Textwidth
  | `Datewidth
  | `Descriptionwidth
]

let size_to_latex = function
  | `Textwidth -> text "\\textwidth"
  | `Datewidth -> text "\\datewidth"
  | `Descriptionwidth -> text "\\descriptionwidth"

let my_minipage size body =
  environment "minipage" ~opt:(T, text "t") ~args:[T, size_to_latex size] (T, body) T

let ragged_left = text "\\raggedleft"

type my_box = [
  | `Descriptionbox
]

let box_to_latex = function
  | `Descriptionbox -> text "\\descriptionbox"

let save_box box body =
  command "savebox" [T, box_to_latex box; T, body] T

let use_box box  =
  command "usebox" [T, box_to_latex box] T

let height_box box =
  text "\\ht" ^^ box_to_latex box

let depth_box box =
  text "\\dp" ^^ box_to_latex box

type my_length = [
  | `Linerule
]

let length_to_latex = function
  | `Linerule -> text "\\linerule"
