require_relative 'model'
require_relative 'view'
require 'pry'
require 'byebug'

module Parser

  def load_text(filename)
    newarray = []
    f = File.open(filename, "r")
    f.each_line { |line|
      newarray << line.chomp
    }
    f.close
     newarray.select!{|line| line != ""}
     final_array = []
     (newarray.length/2).times { |ind| final_array << {:question => newarray[ind*2],:answer => newarray[(ind*2)+1]} }
     final_array
  end
end


class Game
  include Parser
  attr_accessor :my_cards, :my_decks, :my_deck

  def initialize(filepaths)
    deck_names = ["easy","medium","hard"]
    @my_deck = nil
    @my_decks = filepaths.each_with_index.map do |filepath, index|
      @my_cards = convert_to_object(load_text(filepath))
      Deck.new(deck_names[index], my_cards)
    end
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

  def get_input
    gets.chomp.downcase
  end

  def check_answer(answer,input)
    answer == input ? View.display_correct(answer) : View.display_incorrect
  end

  def select_deck
    input = 0
    input = gets.chomp.to_i until input != 0
    my_decks[input - 1] != nil ? self.my_deck = my_decks[input - 1] : select_deck
  end

  def deck_method
    View.display_welcome
    View.display_deck_options
    select_deck
  end

  def runner
    system "clear"
    deck_method
    input = ""
    until input == "quit"
      View.display_options
      my_card = select_card
      View.display_question(my_card.question)
      input = get_input
      case input
      when "quit"
        break
      when "switch"
        deck_method
      when my_card.answer
        View.display_correct
      else
        View.display_incorrect
      end
      View.load_screen
      system("clear")
    end
  end
end
game = Game.new(['easy_mode.txt','flashcard_samples.txt'])

