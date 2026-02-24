provide:
  *,
  type *
end

# iterative, i.e., tail-recursive

fun fact-iter(n :: Number, acc :: Number) -> Number:
  if n == 0:
    acc
  else:
    fact-iter(n - 1, n * acc)
  end
end

fun fact(n :: Number) -> Number:
  fact-iter(n, 1)
end
