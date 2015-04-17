class View
  class << self
    def display_welcome
      puts "Welcome to the greatest flashcard game of forever!"
    end

    def display_question(q)
      puts q
    end

    def display_correct(a)
      display_banner
      puts "As it turns out, #{a} is the correct answer! You clearly cheated."
    end

    def display_incorrect
      puts "WRONG! We can add this to the world's longest list, entitled ''Instances Wherein You Have Failed''"
    end

    def display_banner
      40.times { print "*" }
      puts "\n\n"
    end

    def display_options
      puts "Prepare for your inevitable failure! (Type 'Quit' to exit program)"
    end

    def load_screen
      display_banner
      puts "Please Wait \n"
      3.times { print ".  "; sleep(1) }
      puts
    end
  end
end
