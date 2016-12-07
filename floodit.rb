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

def block(color)
  if color == "red"
    print "  ".colorize( :background => :red)
  elsif color == "blue"
    print "  ".colorize( :background => :blue)
  elsif color == "green"
    print "  ".colorize( :background => :green)
  elsif color == "yellow"
    print "  ".colorize( :background => :yellow) 
  elsif color == "cyan"
    print "  ".colorize( :background => :cyan)
  elsif color == "magenta"
    print "  ".colorize( :background => :magenta)
  end
end

def init_game_board(width, height)
  grid = Array.new(height){Array.new(width){rand(6)+1} }
  grid[0][0] = 0
  colors = ["red", "red", "blue", "green", "yellow", "cyan", "magenta"]
  grid.each do |e|
    e.each do |f|
       block(colors[f])
    end
    puts 
  end
end
def menu(width, height)
  puts "Main Menu:"
  puts "s = start game"
  puts "c = change size"
  puts "q = quit"
  puts "No games played yet"
  print "Please enter a choice: "
  userChoice = gets.chomp 
    if (userChoice == "s") then
       init_game_board(width, height)
    elsif (userChoice == "c") then
       puts "New Width?"
       width = gets.chomp
       puts "New Height?"
       height = gets.chomp
       menu(width.to_i, height.to_i)
    elsif (userChoice == "q") then 
      exit
    end
end
if (userInput == "j") then 
  menu(14, 5)
end

    

def get_board(width, height)
  print ""
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