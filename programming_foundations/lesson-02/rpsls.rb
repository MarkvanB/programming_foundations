VALID_CHOICES = { r: 'rock', p: 'paper', s: 'scissors', v: 'spock', l: 'lizard' }.freeze

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
    player_score = 0
    computer_score = 0

    loop do
    system("clear")
    puts
    puts "**********************************************"
    puts "*                 Welcome to                 *"
    puts "*    Rock, Paper, Scissors, Spock, Lizard    *"
    puts "**********************************************"
    puts
    puts "Win 5 games to beat the computer!"
    puts
    puts "The score is: Player: #{player_score} Computer: #{computer_score}."

      choice = ''
    loop do
      prompt("Choose one:")
      puts
      VALID_CHOICES.each { |key, value| puts "#{key} for #{value}" }
      puts
      choice = VALID_CHOICES[gets.chomp.to_sym]

      if VALID_CHOICES.values.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.values.sample

    puts
    prompt "You chose #{choice}; Computer chose: #{computer_choice}"

    puts
    display_results(choice, computer_choice)

    puts

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end

    if player_score == 5
      prompt("Congratualations! You won!")
      break
    elsif computer_score == 5
      prompt("I'm sorry, You lost!!")
      break
    else
      prompt("Press [return] to play next round")
      again = gets.chomp
      next if again.downcase.start_with?('')
    end
    end

    puts
    prompt "Press Y to play again."
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
