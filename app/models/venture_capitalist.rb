class VentureCapitalist

  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.tres_commas_club
    @@all.select { | investor | investor.total_worth >= 1000000000 }
  end

  def offer_contract(startup, type, investment, domain)
    FundingRound.new(startup, self, type, investment, domain)
  end

  def funding_rounds
    FundingRound.all.select { | round | round.venture_capitalist == self }
  end

  def portfolio
    startups_array = self.funding_rounds.map { | round | round.startup }
    startups_array.uniq
  end

  def biggest_investment
    rounds_array = self.funding_rounds.map { | round | round.investment }
    sorted_rounds = rounds_array.sort_by { | round | round }
    sorted_rounds[sorted_rounds.size - 1]
  end

  def invested(domain)
    domain_array = self.funding_rounds.select { | round | round.domain == domain }
    sum = 0
    domain_array.each { | round | sum += round.investment.to_f }
  end

  def total_worth
    investment_array = self.funding_rounds.map { | round | round.investment }
    sum = 0
    investment_array.each { | investment | sum += investment.to_f }
    sum
  end
end
