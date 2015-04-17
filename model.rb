class Deck
  attr_reader :all_cards

  def initialize(name, all_cards)
    @name = name
    @all_cards = all_cards
  end
end

class Card
  attr_reader :question, :answer

  def initialize(args = {})
    @question = args[:question]
    @answer = args[:answer]
  end
end


