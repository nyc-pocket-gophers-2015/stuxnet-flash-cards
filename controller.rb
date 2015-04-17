require_relative 'card_model'
require_relative 'deck_model'
require 'pry'

class Game
  attr_accessor :my_cars, :my_deck

  def initialize(filepath)
    View.display_welcome
    @my_cards =
    @my_deck = Deck.new(my_cards)
    runner
  end

  def get_question(obj)
    View.display_question(obj.question)
  end

  def get_answer(obj)
    obj.answer
  end

  def check_answer(obj,input)
    answer = get_answer(obj)
    answer == input ? View.display_correct(answer) : View.display_incorrect
  end

  def runner
    View.display_welcome
  end
end

