let value opt default =
  match opt with
  | None -> default
  | Some a -> a

let map opt f =
  match opt with
  | None -> None
  | Some a -> f a

let map_default opt f default =
  match opt with
  | None -> default
  | Some a -> f a

let is_some opt =
  match opt with
  | None -> false
  | _ -> true
