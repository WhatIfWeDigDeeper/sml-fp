(* > sml *)
(* use "tuples.sml"; *)

fun swap (pr: int*bool) =
  (#2 pr, #1 pr)

(*
  swap (7, true) -> (7, true)
  swap (~4, false) -> (false,~4)
*)

(* (int * int) * (int * int) -> int *)
fun sum_two_pairs (pr1: int * int, pr2 : int * int) =
  (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2)

(* int * int -> (int * int) *)
fun div_mod (x: int, y: int) =
  (x div y, x mod y)

(* (int * int) -> (int * int) *)
fun sort_pair(pr: int * int) =
  if (#1 pr) < (#2 pr)
  then pr
  else (#2 pr, #1 pr)

(*
can nest tuples
(int * (bool * int)
*)
val x1 = (7,(true,9));

val x2 = #1 (#2 x1);
