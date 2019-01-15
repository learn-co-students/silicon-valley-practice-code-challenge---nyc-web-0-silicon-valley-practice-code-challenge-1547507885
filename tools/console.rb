require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

vc1 = VentureCapitalist.new("vc1")
vc2 = VentureCapitalist.new("vc2")
vc3 = VentureCapitalist.new("vc3")
vc4 = VentureCapitalist.new("vc4")
vc5 = VentureCapitalist.new("vc5")
vc6 = VentureCapitalist.new("vc6")

sp1 = Startup.new("sp1", "fo1", "atech")
sp2 = Startup.new("sp2", "fo2", "btech")
sp3 = Startup.new("sp3", "fo3", "ctech")
sp4 = Startup.new("sp4", "fo4", "atech")
sp5 = Startup.new("sp5", "fo5", "btech")
sp6 = Startup.new("sp6", "fo6", "ctech")

fr1 = FundingRound.new(sp1, vc1, "seriesa", 10000000, "atech")
fr2 = FundingRound.new(sp2, vc2, "seriesb", 100000000, "btech")
fr3 = FundingRound.new(sp3, vc3, "seriesc", 500000000, "ctech")
fr4 = FundingRound.new(sp4, vc4, "seriesd", 1000000000, "atech")
fr5 = FundingRound.new(sp5, vc5, "seriese", 10000000000, "btech")
fr6 = FundingRound.new(sp6, vc6, "seriesf", 8, "ctech")
fr7 = FundingRound.new(sp6, vc1, "pleasefail", -10, "dtech") # nil - not sure if passed

fr1.startup # => sp1
fr2.venture_capitalist # => vc2
fr3.type # => "seriesc"
fr4.investment # => 1000000000

sp1.name # => sp1
sp2.founder # => fr2
sp3.domain # => ctech

Startup.find_by_founder("fr3") # => sp3
Startup.domains
sp6.pivot("sp3000", "ztech")
sp6.sign_contract(vc6, "seriesz", 9, "ztech")
sp6.funding_rounds
sp1.total_funds
sp6.num_funding_rounds
sp6.investors
sp5.big_investors
vc7 = VentureCapitalist.new("vc7")
VentureCapitalist.tres_commas_club
vc1.offer_contract(sp1, "seriesd", 1000000, "atech")
vc6.funding_rounds
vc1.portfolio
vc1.biggest_investment
vc1.invested("atech")
vc6.total_worth


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
