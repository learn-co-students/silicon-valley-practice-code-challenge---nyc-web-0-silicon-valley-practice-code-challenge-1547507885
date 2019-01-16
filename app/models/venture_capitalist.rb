class VentureCapitalist

  attr_accessor :worth
  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, worth)
    @name = name
    @worth = worth

    @@all << self
  end

  def name
    self.name
  end

  def self.tres_commas_club
    @@all.select do |vcs|
      vcs. worth > 1000000000
    end
  end

  def offer_contract(startup, type, amt)
    FundingRound.new(startup, self, type, amt)
  end

  def funding_rounds
    FundingRound.all.select do |frs|
      frs.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |my_frs|
      my_frs.startup
    end
  end

  def biggest_investment
    funding_rounds.max_by do |my_frs|
        my_frs.investment_amt
     end
  end

  def invested(domain_string)
    funding_rounds.map do |my_frs|
      #binding.pry
      if my_frs.startup.domain == domain_string
        binding.pry
        my_frs.investment_amt
      end
    end
  end


end #end of class
