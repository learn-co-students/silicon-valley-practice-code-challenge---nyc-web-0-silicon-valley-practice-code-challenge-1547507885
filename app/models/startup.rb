class Startup
  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, domain, founder)
    @name = name
    @domain = domain
    @founder = founder
    @@all << self
  end

  def pivot(new_domain, new_name)
    @name = new_name
    @domain = new_domain
  end

  def self.domains
    self.all.map{|all| all.domain}
  end

  def self.find_by_founder(founder)
    self.all.find{|all| all.founder}
  end

  ##### ASSOCIATIONS + AGGREGATE METHODS ####

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment.to_f)
  end

  def funding_rounds
    funding_rounds = FundingRound.all.select{|fr| fr.startup == self}
  end

  def num_funding_rounds
    funding_rounds.count
  end

  def total_funds
    funding_rounds.map{|fr| fr.investment}.inject(:+)
  end

  def investors
    funding_rounds.map{|fr| fr.venture_capitalist.name}.uniq
  end

  def big_investors
    funding_rounds.map{|fr| fr.venture_capitalist.name}.uniq & VentureCapitalist.tres_commas_club
  end

end ## END OF STARTUP CLASS
