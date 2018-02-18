fun range(from: int, to: int) =
  if (from = to)
  then to::[]
  else from :: range(from+1, to)

fun countup_from1(x: int) =
  range (1, x)

fun countup(x: int) =
  let
    fun count(from: int, to: int) =
      if (from = to)
      then to::[]
      else from :: count(from+1, to)

  in
    count (1, x)
  end

fun countup2(to: int) =
  let
    fun count(from: int) =
      if (from = to)
      then to::[]
      else from :: count(from+1)
  in
    count 1
  end
