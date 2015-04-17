class Deck
  attr_reader :all_cards

  def initialize(all_cards)
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


