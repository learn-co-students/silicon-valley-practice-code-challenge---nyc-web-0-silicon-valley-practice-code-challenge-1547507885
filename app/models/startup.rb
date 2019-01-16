class Startup

  attr_reader :founder, :domain, :name

  @@all = []

  def self.all
    @@all
  end

  def self.domains
    @@all.select do |startups|
      startups.domain
    end
  end

  def self.find_by_founder(founder)
    @@all.find do |startups|
      startups.founder == founder
    end
  end


  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def pivot(domain, name)
  #binding.pry
  @domain = domain
  @name = name
  end

  def sign_contract(venture_capitalist, type, amt)
    FundingRound.new(self, venture_capitalist, type, amt)
  end

  def funding_rounds
    FundingRound.all.select do |frs|
      frs.startup == self
   end
 end

  def num_funding_rounds
    funding_rounds.length
  end

  def investors
    funding_rounds.map do |my_frs|
      my_frs.venture_capitalist
    end
  end

  def big_investors
    #binding.pry
     investors.select do |my_investors|
      binding.pry
      my_investors.worth > 1000000000
  end

  
end#end of class







end #end of class
