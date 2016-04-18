def start_program
  system('clear')
  puts '************************************************'
  puts '*                                              *'
  puts '*         calculate a fibonacci-number         *'
  puts '*                                              *'
  puts '************************************************'
  puts
  puts 'which fibonacci number do you want to calculate?'
  puts
end

def put_number_correct(answer)
  if answer.to_i == 1
    answer + 'st'
  elsif answer.to_i == 2
    answer + 'nd'
  else
    answer + 'th'
  end
end

loop do
  arr = [0, 1]

  start_program

  answer = gets.chomp
  loop do
    if answer.to_i == 1
      arr.pop
      break
    else
      new_number = arr[-1] + arr[-2]
      arr << new_number
      break if arr.size >= answer.to_i
    end
  end
  puts
  puts "the #{put_number_correct(answer)} fibonacci number is #{arr.last}."
  puts
  puts 'Do you want to calculate another number?'
  a = gets.chomp
  break unless a.downcase.start_with?('y')
end

puts 'Thank you and goodbye!'
puts
