class FundingRound

  attr_reader :startup, :venture_capitalist, :type, :investment, :domain

  @@all = []

  def self.all
    @@all
  end

  def initialize(startup, venture_capitalist, type, investment, domain)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    if investment >= 0
      @investment = investment.to_f
    else
      @investment = 0.0
    end
    @domain = domain
    @@all << self
  end
end
