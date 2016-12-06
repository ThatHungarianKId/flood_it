require 'console_splash'
require 'colorize'
splash = ConsoleSplash.new(30,80)
splash.write_header("Flood-It", "Joseph Igali", "0.0.1",
  {:nameFg => :blue, :authorFg => :red, :versionFg => :green})
splash.write_top_pattern(">", {:fg => :green})
splash.write_bottom_pattern("<", {:fg => :red})
splash.write_vertical_pattern("*", :fg => :blue)
'clear'
splash.splash
userInput = gets.chomp
def game_board 
  grid = Array.new(3){Array.new(3) {'  '}}
  print grid
  
end
def menu 
  puts "Main Menu:"
  puts "s = start game"
  puts "c = change size"
  puts "q = quit"
  puts "No games played yet"
  print "Please enter a choice: "
  userChoice = gets.chomp 
    if (userChoice == "s") then
       game_board
    end
end
if (userInput == "j") then 
  menu
end

    

def get_board(width, height)
  # TODO: Implement this method
  #
  # This method should return a two-dimensional array.
  # Each element of the array should be one of the
  # following values (These are "symbols", you can use
  # them like constant values):
  # :red
  # :blue
  # :green
  # :yellow
  # :cyan
  # :magenta
  #
  # It is important that this method is used because
  # this will be used for checking the functionality
  # of your implementation.
end

# TODO: Implement everything else as described in the
#       assignment brief.