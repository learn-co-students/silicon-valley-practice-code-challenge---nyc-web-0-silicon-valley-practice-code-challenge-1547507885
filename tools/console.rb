require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


my_startup = Startup.new("my_startup", "me", "me.com")

your_startup = Startup.new("your_startup", "you", "you.com")

zev = VentureCapitalist.new("Zev", 1000000001)

anyone = VentureCapitalist.new("Anyone", 7)

new_loan =  FundingRound.new(my_startup, zev, "b", 200)

another_loan = FundingRound.new(your_startup, zev, "a", 50)
#(startup, venture_capitalist, type, investment_amt)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
