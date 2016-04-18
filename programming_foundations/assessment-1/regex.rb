loop do
puts "enter a positive number"
answer = gets.chomp  
  if /\A\d+\z/.match(answer)
      puts "Is a number"
  else
      puts "Is not a number"
  end  
end  