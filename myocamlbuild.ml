open Ocamlbuild_plugin
open Command

let latex_cmd f = "rubber -d " ^ f

let args = ["pdf"; "verbose"]
;;

dispatch
begin function
  | After_options ->
     pflag ["ocaml"; "compile"] "warn" (fun s -> S[A"-w"; A s]);
     pflag_and_dep ["ocaml"; "ocamldep"] "pa" (fun pa -> S[A"-ppopt"; P ("pa_"^pa^".cma")]);
     pflag_and_dep ["ocaml"; "compile"] "pa" (fun pa -> S[A"-ppopt"; P ("pa_"^pa^".cma")]);
     pdep [] "dep" (fun d -> [d]);
     rule ".ml" ~prod:"%.ml" ~dep:"%.mlt"
       (fun env _ -> Cmd(Sh ("meltpp -o "^env "%.ml "^env "%.mlt")));
     rule ".tex" ~prod:"%.tex" ~dep:"%.byte"
       (fun env _ ->
         Cmd(Sh ("./" ^ env "%.byte"))
       );
     rule ".pdf" ~prod:"%.pdf" ~dep:"%.tex"
       (fun env _ -> Cmd(Sh (latex_cmd (env "%.tex"))));
  | _ -> ()
end
