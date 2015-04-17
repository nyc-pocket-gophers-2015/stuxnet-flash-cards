# require_relative 'card_model'
# require_relative 'deck_model'
require_relative 'view'
require 'pry'

# class Card
#   attr_accessor :question, :answer
#   def initialize
#     @question = "Hello?"
#     @answer = "meow"
#   end
# end

# class Deck
#   attr_reader :cards
#   def initialize(cards)
#     @cards = cards
#   end
# end


class Game
  attr_accessor :my_cards, :my_deck

  def initialize(filepath)
    @my_cards = [Card.new]
    @my_deck = Deck.new(my_cards)
    runner
  end

  def select_card
    random = rand(0...my_deck.cards.length)
    my_deck.cards[random]
  end

  def get_question(obj)
    View.display_question(obj.question)
  end

  def get_answer(obj)
    obj.answer
  end

  def get_input
    gets.chomp.downcase
  end

  def check_answer(answer,input)
    answer == input ? View.display_correct(answer) : View.display_incorrect
  end

  def runner
    system "clear"
    View.display_welcome
    input = ""
    until input == "quit"
      View.display_options
      my_card = select_card
      View.display_question(my_card.question)
      input = get_input
      input == "quit" ? break : check_answer(my_card.answer, input)
      View.load_screen
      system("clear")
    end
  end
end
# binding.pry
game = Game.new("shitogo")

