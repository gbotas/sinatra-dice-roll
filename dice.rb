require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get ("/") do
  erb(:gazelle)

end


get("/dice/2/6") do
  dice1= rand(1..6)
  dice2 = rand(1..6)
  sum = dice1 + dice2

  @outcome = "You rolled a #{dice1} and a #{dice2} for a total of #{sum}."

  erb(:two_six)
end 

get("/dice/2/10") do
  dice1= rand(1..10)
  dice2 = rand(1..10)
  sum= dice1 + dice2

  @outcome = "Your rolled a #{dice1} and a #{dice2} for a total of #{sum}."

  erb(:two_ten)

end 

get("/dice/1/20") do
  @dice1= rand(1..20)

  @outcome= "You have rolled a #{@dice1}."

  erb(:one_twenty)

end 

get("/dice/5/4") do
  dice1= rand(1..4)
  dice2 = rand(1..4)
  dice3 = rand(1..4)
  dice4 = rand(1..4)
  dice5 = rand(1..4)
  
  sum= dice1 + dice2 + dice3 + dice4 + dice5

  @outcome = "You have rolled a #{dice1}, #{dice2}, #{dice3}, #{dice4}, and a #{dice5} for a total of #{sum}"

  erb(:five_four)

end 


get("/dice/100/6") do
  @rolls = []   #create a blank array

  100.times do
    dice = rand(1..6)

    @rolls.push(dice) #add the random number to the array
  end

  erb(:one_hundred_six)

end 
