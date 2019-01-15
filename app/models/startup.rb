class Startup

  attr_reader :name, :founder, :domain

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.find_by_founder(name)
    @@all.find { | startup | startup.founder == name }
  end

  def self.domains
    domains_array = @@all.each.map { | startup | startup.domain }
    domains_array.uniq
  end

  def pivot(name, domain)
    @name = name
    @domain = domain
  end

  def sign_contract(venture_capitalist, type, investment, domain)
    FundingRound.new(self, venture_capitalist, type, investment, domain)
  end

  def funding_rounds
    FundingRound.all.select { | round | round.startup == self }
  end

  def total_funds
    rounds_array = self.funding_rounds.map { | round | round.investment}
    sum = 0
    rounds_array.each { | investment | sum += investment}
    sum
  end

  def num_funding_rounds
    self.funding_rounds.size
  end

  def investors
    investors_array = self.funding_rounds.map { | round | round.venture_capitalist }
    investors_array.uniq
  end

  def big_investors
    VentureCapitalist.tres_commas_club.select { | investor | self.investors.include?(investor) }
  end
end
