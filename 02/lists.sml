(* sml "lists.sml" *)

[];
(* int list *)
val xs = [3,4,5];

(* cons :: *)
2::xs;

(* check is empty list with fun null *)
null (xs);
(* fn: 'a list -> bool *)
null xs;

(* head *)
hd xs;
(* tail *)
tl xs;

(* (int*int) list *)
[(3,4), (5,6)];

(* 'a list or alpha list, can replace any type you want *)
[];

true::[];
3::[];


fun sum_list (xs: int list) =
  if null xs
  then 0
  else hd xs + sum_list(tl xs)

fun list_product (xs: int list) =
  if null xs
  then 1
  else hd xs * list_product(tl xs)

fun seq (x: int, xs: int list) =
  if x = 0
  then xs
  else seq(x-1, x::xs)

fun countdown (x: int) =
  if (x = 0)
  then []
  else x :: countdown (x-1)

(* [9,8] -> [8,9] *)
(* tl [9, 8] :: hd[9,8] *)
(*
fun reverse (xs: int list) =
  if null xs
  then []
  else reverse (tl xs) :: hd xs
*)

fun append (xs: int list, ys: int list) =
  if null xs
  then ys
  else (hd xs) :: append((tl xs), ys)

fun sum_pair_list (xs: (int * int) list) =
  if null xs
  then 0
  else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs)

(* sum_pair_list [(3,4),(5,6)] *)

fun firsts (xs: (int * int) list) =
  if null xs
  then []
  else (#1 (hd xs)) :: firsts(tl xs)

fun seconds (xs: (int * int) list) =
  if null xs
  then []
  else (#2 (hd xs)) :: seconds(tl xs)

fun sum_pair_list2 (xs: (int * int) list) =
  sum_list (firsts (xs)) + sum_list (seconds(xs))

fun sum_pair_list_another_way (xs: (int * int) list) =
  sum_list (append(firsts (xs), seconds(xs)))

fun factorial (n: int) =
  if (n = 0)
  then 1
  else n * factorial(n-1)

fun fact (n: int) =
  list_product ( countdown(n) )
