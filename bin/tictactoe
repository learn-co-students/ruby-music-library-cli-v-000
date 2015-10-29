#!/usr/bin/env ruby

require_relative '../config/environment'

puts "Welcome to Tic Tac Toe!"
game = Game.new
until game.won?
  game.play
end

play_again = ""
until play_again.downcase == "n" || play_again.downcase == "no"
  puts "Would you like to play again?"
  play_again = gets.strip
  play_again.downcase == "y" || play_again.downcase == "yes"
  game = Game.new
  until game.won?
    game.play
  end
end
