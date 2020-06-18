open Latex

module Title: sig
  val section: author:t -> email:t -> number:t -> address:t -> t
end

module Experience: sig
  type t
  val section: t list ->  Latex.t
  val entry: date:Latex.t -> company:Latex.t -> job_title:Latex.t -> description: Latex.t -> t
end

module Education: sig
  type t
  val section: t list -> Latex.t
  val entry:
    date:Latex.t -> title:Latex.t -> university:Latex.t -> ?description:Latex.t -> unit -> t
end
