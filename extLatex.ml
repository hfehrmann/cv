open Latex

let latex : Melt.Verbatim.melt_verbatim_function = fun objs ->
  let map = function
  | `V t -> text t
  | `C t -> t
  | _ -> assert false
  in
  concat (List.map map objs)
