class View

  def display_welcome
    puts "Welcome to the greatest flashcard game of forever! Prepare for your inevitable failure!"
  end

  def display_question(q)
    puts q
  end

  def display_correct(a)
    puts "As it turns out, #{a} is the correct answer! You clearly cheated."
  end

  def display_incorrect
    puts "WRONG! We can add this to the world's longest list, entitled ''Instances Wherein You Have Failed''"
  end

  def display_banner
    25.times { puts "*" }
  end
end
