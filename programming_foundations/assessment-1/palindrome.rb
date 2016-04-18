puts "Enter a word to check if it's a palindrome:"
word = gets.chomp

split_str = word.split(//)
reversed_str = []

loop do
  reversed_str << split_str.pop
  break if split_str.size == 0
end

reversed_word = reversed_str.join

if reversed_word == word
  puts "#{word} is a palindrome!"
else
  puts "#{word} is not a palindrome" 
end   

