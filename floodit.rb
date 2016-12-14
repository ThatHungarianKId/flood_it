# Call ruby gems from gemfile.
# The console_splash gem for displaying a splash page and 
# the colorize gem for printing a coloured board
require 'console_splash'
require 'colorize'
 
# Declare global variable for width and height which will be used
#   to initialise the game board
$width = 14
$height = 9

# Define a method for the game menu, which will take user input 
#   and call an appropriate method
def menu(width, height)
  puts "Main Menu:"
  puts "s = start game"
  puts "c = change size"
  puts "q = quit"
  puts "No games played yet"
  print "Please enter a choice: "
  userChoice = gets.chomp 
    if (userChoice == "s") 
       init_board(width,height)
    elsif (userChoice == "c") 
       puts "New Width?"
       width = gets.chomp
       puts "New Height?"
       height = gets.chomp
       menu(width.to_i, height.to_i)
    elsif (userChoice == "q") then
      exit
    end
end
 
# Define a get_board method, returning an array of randomised colours  
# I misunderstood the brief and didn't realise this method had to only contain 
#   a 2d array with just random colours rather than actually printing it.    
def get_board(width, height)
  colors = [:red, :green, :blue, :yellow, :cyan, :magenta]
  board = Array.new(height){Array.new(width){|f| colors.sample}} 
  return board
end
       
# Define a method for colouring strings with the appropriate background 
#   colour 
def block(color)
  if color == :red
    print "  ".colorize( :background => :red)
  elsif color == :blue
    print "  ".colorize( :background => :blue)
  elsif color == :green
    print "  ".colorize( :background => :green)
  elsif color == :yellow
    print "  ".colorize( :background => :yellow) 
  elsif color == :cyan
    print "  ".colorize( :background => :cyan)
  elsif color == :magenta
    print "  ".colorize( :background => :magenta)
  end
end     

       
# Define a method to initialise game board. This was my original attempt 
#   to create a game board with randomised colours     
def init_board(width, height)
  # TODO: Find a way to use the arguments from the get_board 
  #    method and pass them into the initial game board
  $grid = Array.new(height){Array.new(width){rand(6)+1} }
  $grid[0][0] = 0
  colors = [:red, :blue, :green, :yellow, :cyan, :magenta]
  randCol = block(colors.sample)
  newColors = [randCol,:red, :blue, :green, :yellow, :cyan, :magenta]
  $grid.each do |e|
    e.each do |f|
       block(newColors[f])
    end
    puts 
  end
end   
 
 
 
 
 
# Attempt at a recursion method
def recursion(selectedColor, i, j)
  # FIXME: The recursion algorithm can either print a new board 
  #   with all one colour or a new board with only [0][0] 
  #   coloured in.
  previousColor = $grid[i][j]
  $grid[i][j] = selectedColor
  if selectedColor == 1
   block(:red)
      elsif selectedColor == 2
        block(:blue)
      elsif selectedColor == 3
        block(:green)
      elsif selectedColor == 4
        block(:yellow)
      elsif selectedColor == 5
        block(:cyan)
      elsif selectedColor == 6
        block(:magenta)  
      end 
  puts
  if i == 15 || j == 10
    return
  end
  if $grid[i+1][j] == previousColor
    recursion(selectedColor, i+1, j)
      if selectedColor == 1
        block(:red)
      elsif selectedColor == 2
        block(:blue)
      elsif selectedColor == 3
        block(:green)
      elsif selectedColor == 4
        block(:yellow)
      elsif selectedColor == 5
        block(:cyan)
      elsif selectedColor == 6
        block(:magenta)  
      end 
  puts
  end
  if $grid[i][j+1] == previousColor 
    recursion(selectedColor, i, j+1)
  end
  if $grid[i-1][j] == previousColor 
    recursion(selectedColor, i-1, j)
  end
  if $grid[i][j-1] == previousColor 
    recursion(selectedColor, i, j-1)
  end
end
       
 
 
 
def start_game(width, height) 
  grid = Array.new(height){Array.new(width)}
  print grid
 
end
   
         
# Use console_splash to define a splash page
splash = ConsoleSplash.new(30,80)
splash.write_header("Flood-It", "Joseph Igali", "0.0.1",
  {:nameFg => :blue, :authorFg => :red, :versionFg => :green})
splash.write_top_pattern(">", {:fg => :green})
splash.write_bottom_pattern("<", {:fg => :red})
splash.write_vertical_pattern("*", :fg => :blue)
'clear'
 
# Print the splash page
splash.splash
 
# Allow user to access menu by pressing enter
userInput = gets
if (userInput == "\n")
  menu($width,$height)
end
       
# This code still needs work (part of the recursion algorithm)
print "Pick a colour: "
userInput = gets.chomp
if userInput == "r"
userChoice = 1
elsif userInput == "b"
userChoice = 2
elsif userInput == "g"
userChoice = 3
elsif userInput == "y"
userChoice = 4
elsif userInput == "c"
userChoice = 5
elsif userInput == "m"
userChoice = 6
end
recursion(userChoice, 1, 1)