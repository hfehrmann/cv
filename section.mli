open Latex
open Calendar

type entry_date =
  | Single of date
  | Between of (date * date)

module Title: sig
  val section: author:t -> email:t -> number:t -> address:t -> t
end

module Profile: sig
  val section: body:Latex.t -> Latex.t
end

module Experience: sig
  type t
  val section: t list ->  Latex.t
  val entry: date:entry_date -> company:Latex.t -> job_title:Latex.t -> description: Latex.t -> t
end

module Education: sig
  type t
  val section: t list -> Latex.t
  val entry:
    date:entry_date -> title:Latex.t -> university:Latex.t -> ?description:Latex.t -> unit -> t
end

module Languages: sig
  type t
  val section: t list -> Latex.t
  val entry: language:Latex.t -> level:Latex.t -> t
end

module Skills: sig
  type t
  val section: t list -> Latex.t
  val entry: skill:Latex.t -> description:Latex.t -> t
end

module Publications: sig
  type t
  val section: t list -> Latex.t
  val entry: date:entry_date -> entry_name:Latex.t -> t
end
