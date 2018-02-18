(* Homework1 *)

fun is_older(dt1: int*int*int, dt2: int*int*int) =
  if (#1 dt1) <> (#1 dt2)
  then (#1 dt1) < (#1 dt2)
  else
    if (#2 dt1) <> (#2 dt2)
    then (#2 dt1) < (#2 dt2)
    else (#3 dt1) < (#3 dt2)

fun num_in_month(ds: (int*int*int) list, m:int, acc:int) =
  if null ds
  then acc
  else
    if (#2 (hd ds)) = m
    then num_in_month((tl ds), m, acc + 1)
    else num_in_month((tl ds), m, acc)

fun number_in_month(ds: (int*int*int) list, m: int) =
  num_in_month(ds, m, 0)

fun num_in_months(ds: (int*int*int) list, ms: int list, acc: int) =
  if null ms
  then acc
  else
    let val total = acc + number_in_month(ds, (hd ms))
    in
      num_in_months(ds, (tl ms), total)
    end

fun number_in_months(ds: (int*int*int) list, ms: int list) =
  num_in_months(ds, ms, 0)

fun is_date_in_month(d: (int*int*int), m: int) =
  (#2 d) = m

(* fn: (int*int*int) list, int list -> (int*int*int) list *)
fun dts_in_month(ds: (int*int*int) list, m: int, acc: (int*int*int) list) =
  if null ds
  then acc
  else
    if is_date_in_month((hd ds), m)
    then dts_in_month((tl ds), m, (hd ds)::acc)
    else dts_in_month((tl ds), m, acc)

fun reverse(ds: (int*int*int) list, acc: (int*int*int) list) =
  if null ds
  then acc
  else reverse((tl ds), (hd ds)::acc)

fun dates_in_month(ds: (int*int*int) list, m: int) =
  reverse(dts_in_month(ds, m, []), [])

fun append (ds1: (int*int*int) list, ds2: (int*int*int) list) =
  if null ds1
  then ds2
  else (hd ds1) :: append((tl ds1), ds2)

fun dts_in_months(ds: (int*int*int) list, ms: int list, acc: (int*int*int) list) =
  if null ms
  then acc
  else dts_in_months(ds, (tl ms), append(dates_in_month(ds, (hd ms)), acc))

fun dates_in_months(ds: (int*int*int) list, ms: int list) =
  reverse(dts_in_months(ds, ms, []), [])

fun g_nth(strs: string list, n: int, i: int) =
  if n = i
  then (hd strs)
  else g_nth((tl strs), n, i+1)

fun get_nth(strs: string list, n: int) =
  g_nth(strs, n, 1)

fun get_month_name(m: int) =
  get_nth(["January","February","March","April","May","June","July","August","September","October","November","December"], m)

fun date_to_string(d: (int*int*int)) =
  get_month_name(#2 d) ^ " "
    ^ Int.toString(#3 d) ^ ", "
    ^ Int.toString(#1 d)

fun n_before_reaching_sum(sum:int, xs: int list, acc: int, n: int) =
  if (hd xs) + acc >= sum
  then n
  else n_before_reaching_sum(sum, (tl xs), (hd xs) + acc, n + 1)

fun number_before_reaching_sum(sum:int, xs: int list) =
  n_before_reaching_sum(sum, xs, 0, 0)

fun what_month(day: int) =
  number_before_reaching_sum(day, [31,28,31,30,31,30,31,31,30,31,30,31])+1

(*
fun what_month(day: int) =
  let
    val m = month_num(day)
  in
    get_month_name(m)
  end
*)

fun m_range(d1: int, d2: int, acc: int list) =
  if d1 > d2
  then acc
  else m_range(d1+1, d2, what_month(d1)::acc)

fun rev(xs: int list, acc: int list) =
  if null xs
  then acc
  else rev((tl xs), (hd xs)::acc)

fun month_range(d1: int, d2: int) =
  rev(m_range(d1, d2, []), [])

fun eldest(ds: (int*int*int) list, high: (int*int*int)) =
  if null ds
  then high
  else
    let
      val old = if is_older((hd ds), high) then high else (hd ds)
    in
      eldest((tl ds), old)
    end

fun oldest(ds: (int*int*int) list) =
  if null ds
  then NONE
  else SOME (eldest((tl ds), (hd ds)))
