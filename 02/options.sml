(*
  NONE  // type 'a option
  SOME e  // type t option
  isSome 'a option -> bool
  valOf 'a option -> 'a
*)


fun max2 (xs: int list, a: int option) =
  if null xs
  then a
  else
    let val a1 = if isSome a then a else SOME (hd xs)
  in
    if (valOf a1) > (hd xs)
    then max2((tl xs), a1)
    else max2((tl xs), SOME (hd xs))
  end


(* fn: int list -> int option *)
fun maximum(xs: int list) =
  max2(xs, NONE)

fun max1(xs: int list) =
  if null xs
  then NONE
  else
    let val tl_ans = max1(tl xs)
    in
      if isSome tl_ans andalso valOf tl_ans > hd xs
      then tl_ans
      else SOME (hd xs)
    end

fun max3(xs: int list) =
  if null xs
  then NONE
  else
    let
      fun max_nonempty(xs: int list) =
        if null (tl xs)
        then hd xs
        else
          let
            val tl_ans = max_nonempty(tl xs)
          in
            if hd xs > tl_ans
            then hd xs
            else tl_ans
          end
      in
        SOME (max_nonempty xs)
      end
   
