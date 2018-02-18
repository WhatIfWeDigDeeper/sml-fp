fun max (xs: int list) =
  if null xs
  then 0
  else if null (tl xs)
  then hd xs
  else
      let val tl_ans = max(tl xs)
      in
        if hd xs > tl_ans
        then hd xs
        else tl_ans
      end

fun max2 (xs: int list, a: int) =
  if null xs
  then a
  else if (hd xs) > a
  then max2((tl xs), (hd xs))
  else max2((tl xs), a)

fun maximum(xs: int list) =
  max2(xs, 0)
