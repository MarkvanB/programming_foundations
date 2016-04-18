def start_program
  system('clear')
  puts '*****************************************************'
  puts '*                                                   *'
  puts '*        check array for fibonacci-number           *'
  puts '*                                                   *'
  puts '*****************************************************'
  puts
  puts 'please enter a serie of numbers, separated by a space'
  puts
end

def answer_return(return_arr)
  if return_arr.empty?
    'Your input contained no fibonacci-numbers.'
  else
    "Your input contained the following fibonacci-numbers: #{return_arr.sort.join(', ')}."
  end
end

loop do
  fib_arr = [0, 1] # the array that contains the fibonacci serie

  start_program

  answer = gets.chomp

  arr_to_check = answer.split.map { |n| n.to_i } # turn answer into array

  # population of fib_arr
  loop do
    new_number = fib_arr[-1] + fib_arr[-2]
    fib_arr << new_number
    break if fib_arr.max >= arr_to_check.max
  end

  # check if fibonacci numbers are present in arr_to_check
  return_arr = arr_to_check.select do |n|
    fib_arr.include? n
  end

  puts
  puts answer_return(return_arr)
  puts
  puts 'Do you want to check another serie for fibonacci numbers?'
  a = gets.chomp
  break unless a.downcase.start_with?('y')
end

puts 'Thank you and goodbye!'
puts
