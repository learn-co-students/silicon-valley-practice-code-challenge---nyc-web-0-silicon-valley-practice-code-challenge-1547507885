class FundingRound

  attr_reader :startup, :venture_capitalist, :type, :investment_amt

  @@all = []

  def self.all
    @@all
  end

  def initialize(startup, venture_capitalist, type, investment_amt)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment_amt = investment_amt

    @@all << self
  end

end #end of class
