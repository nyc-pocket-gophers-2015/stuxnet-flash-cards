require_relative 'model'
require_relative 'view'
require 'pry'

module Parser

  def load_text(filename)
    newarray = []
    f = File.open(filename, "r")
    f.each_line { |line|
      newarray << line.chomp
    }
    f.close
     newarray.select!{|line| line != ""}
     # p newarray
     final_array = []
     (newarray.length/2).times { |ind| final_array << {:question => newarray[ind*2],:answer => newarray[(ind*2)+1]} }
     #this is where we are trying to make the hash
     # newarray.each_with_index{|element,idx|]]
     final_array

  end
end


class Game
  include Parser
  attr_accessor :my_cards, :my_deck

  def initialize(filepath)
    @my_cards = convert_to_object(load_text(filepath))
    @my_deck = Deck.new(my_cards)
    runner
  end

  def convert_to_object(array_of_hashes)
    array_of_hashes.map { |hash| Card.new(hash) }
  end


  def select_card
    random = rand(0...my_deck.all_cards.length)
    my_deck.all_cards[random]
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
game = Game.new('flashcard_samples.txt')

