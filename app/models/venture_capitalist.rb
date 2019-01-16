class VentureCapitalist

  attr_reader :name
  attr_accessor :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    tres_array = self.all.select{|all| all.total_worth > 1000000000}
    tres_array.map{|vc| vc.name}
  end

  ######### ASSOCIATIONS AND AGGREGATE METHODS ########

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment.to_f)
  end

  def funding_rounds
    FundingRound.all.select{|fr| fr.venture_capitalist == self}
  end

  def portfolio
    funding_rounds.map{|fr| fr.startup.name}.uniq
  end

  def biggest_investment
    funding_rounds.max_by{|fr| fr.investment}
  end

  def invested(domain)
    invested_array = funding_rounds.select{|fr| fr.startup.domain == domain}
    invested_array.map{|fr| fr.investment}.inject(:+)
  end
end ## END OF VENTURE CAPITALIST CLASS
