arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr_reversed = []

loop do
  arr_reversed << arr.pop
  break if arr.size == 0
end

arr = arr_reversed

p arr

