


class Deck

def initialize(args = {})
  @all_cards = []


  end

end




class Card

  def initialize(args = {})
    @question = args[:question]
    @answer = args[:answer]

  end


end



#_---



module Parser

  def self.load_text(filename)
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
     p final_array
     #this is where we are trying to make the hash
     # newarray.each_with_index{|element,idx|



  end
end


Parser.load_text('flashcard_samples.txt')

