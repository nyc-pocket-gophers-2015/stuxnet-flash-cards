class Deck
  attr_reader :all_cards

  def initialize(name, all_cards)
    @name = name
    @all_cards = all_cards
  end
end

class Card
  attr_reader :question, :answer

  attr_accessor :counter

  def initialize(args = {})
    @question = args[:question]
    @answer = args[:answer].upcase
    @counter = 0
  end
end


