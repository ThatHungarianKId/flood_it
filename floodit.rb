require 'console_splash'
require 'colorize'
splash = ConsoleSplash.new(30,80)
splash.write_header("Flood-It", "Joseph Igali", "0.0.1")
splash.write_top_pattern(">")
splash.write_bottom_pattern("<")
splash.write_vertical_pattern("*")
'clear'
splash.splash
userInput = gets.chomp
def menu 
  puts "Main Menu:"
  puts "s = start game"
  puts "c = change size"
  puts "q = quit"
  if (highscore == nil) then 
    puts "No games played yet"
  else 
      highscore
  end
  userChoice = "Please enter your choice"
end
if (userInput == "\n") then 
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
