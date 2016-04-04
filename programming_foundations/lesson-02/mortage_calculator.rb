# mortage_calculator.rb
loop do
system("clear")

def prompt(message)
  puts "=> #{message}"
end

puts "*************************************"
puts "*                                   *"
puts "* Welcome to the Mortage Calculator *"
puts "*                                   *"
puts "*************************************"
puts

# ask for loan amount

prompt "What is the amount you want to loan?"

amount = ''
loop do
  amount = gets.chomp
  if amount.to_s != amount.to_i.to_s
    prompt "Please enter a valid number"
  else
    break
  end
end

# bereken maandelijkse rente

prompt "What is the Anuual interest rate in %?"
prompt "Do not enter the %-sign (e.g. 4.5)"

annual_interest = ''
loop do
  annual_interest = gets.chomp
  if /^[\d]+(\.[\d]+){0,1}$/ === annual_interest
    break
  else
    prompt "pleae enter a valid interest rate (e.g. 4.5)"
  end
end

monthly_interest = (((1 + (annual_interest.to_f / 100))**(1.to_f / 12)) - 1)

# bereken looptijd in maanden

prompt "What is the loan duration (in years)?"

duration_years = ''
loop do
  duration_years = gets.chomp
  if duration_years.to_s != duration_years.to_i.to_s
    prompt "please enter a valid number"
  else
    break
  end
end

duration_months = duration_years.to_i * 12

# bereken maandelijkse aflossing

monthly_payment = (amount.to_i * monthly_interest.to_f) / (1 - (1.to_f + monthly_interest.to_f)**-duration_months.to_f)

prompt "Your monthly payment is: $ " + monthly_payment.round(2).to_s
prompt "would you like to make another calcultion? (Type Y for yes)"
answer_again = gets.chomp
break unless answer_again.downcase().start_with?('y')
end
prompt "Thank you for using the Mortage Calculator!"
