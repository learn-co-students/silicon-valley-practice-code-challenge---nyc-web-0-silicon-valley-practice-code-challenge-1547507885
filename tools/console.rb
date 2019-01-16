require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
###############TEST DATA#################

hi1 = Startup.new("other company", "other.com", "bill")
hi2 = Startup.new("fun company", "fun.com", "steve")
hi3 = Startup.new("cool company", "hi.com", "steve")

vc1 = VentureCapitalist.new("cool guys", 20)
vc2 = VentureCapitalist.new("other guys", 1)
vc3 = VentureCapitalist.new("fun guys", 9999999999999999)

f1 = FundingRound.new(hi2, vc2, "angel", 50)
f2 = FundingRound.new(hi1, vc2, "seed?", 2)
f3 = FundingRound.new(hi3, vc1, "ummm", 99999)
f4 = FundingRound.new(hi1, vc2, "seedy?", 1)

hi1.sign_contract(vc3, "potato", 999.0)
hi1.sign_contract(vc3, "potato", 20000000.0)

binding.pry
0
