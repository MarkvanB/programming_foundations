CARDS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace).freeze
SUITS = %w(Hearts Diamonds Spades Clubs).freeze

def prompt(msg)
  puts "=> #{msg}"
end

def deal_cards
  CARD_DECK.shift
end

# define card scores
def total(var)
  values = var.map { |card| card[0] }

  score = 0
  values.each do |value|
    if value == 'Ace'
      score += 11
    elsif value.to_i == 0
      score += 10
    else
      score += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == 'Ace' }.count.times do
    score -= 10 if score > 21
  end

  score
end

loop do # game loop starts here
  CARD_DECK = CARDS.product(SUITS).shuffle # 'populate card deck'

  players_hand = [] # define players_hand
  dealers_hand = [] # define dealer_hand

  2.times { players_hand.push(deal_cards) } # Deal player cards
  2.times { dealers_hand.push(deal_cards) } # Deal dealer cards

  loop do
    system('clear')
    prompt("Dealer has a #{dealers_hand.first.join(' of ')} and a hidden card.")
    puts
    prompt 'You have: '
    puts
    players_hand.each { |card| prompt card.join(' of ') }
    puts
    prompt "Your score is: #{total(players_hand)}."
    puts
    if total(players_hand) < 21 # player turn
      prompt 'Do you want to (H)it or (S)tay?'
      answer = gets.chomp
      if  answer.downcase.start_with?('h')
        players_hand.push(deal_cards)
        next
      elsif answer.downcase.start_with?('s')
        break
      else
        prompt 'Please choose H or S'
      end
    elsif total(players_hand) == 21
      break
    else
      prompt 'You Busted!'
      break
    end
  end

  loop do # dealer turn
    if total(players_hand) > 21 || total(dealers_hand) > total(players_hand)
      break
    elsif total(dealers_hand) < 17 || total(dealers_hand) <= total(players_hand)
      dealers_hand.push(deal_cards)
    else
      break
    end
  end

  puts
  puts 'Dealer has:'
  puts
  dealers_hand.each { |card| prompt card.join(' of ') }
  puts
  puts "Dealer score is: #{total(dealers_hand)}."
  puts

  if total(players_hand) > total(dealers_hand) &&
     total(players_hand) <= 21
    prompt 'Congratualations, You won!!'
  elsif total(dealers_hand) > 21
    prompt 'Dealer Busted, You won!!'
  elsif total(dealers_hand) == total(players_hand)
    prompt "It's a Tie!!"
  else
    prompt 'Sorry, dealer won.'
  end
  puts
  puts 'Do you want to play again? (Y for yes)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

puts
prompt "Thank you for playing. Goodbye!"
puts
