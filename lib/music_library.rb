require 'pry'
require_relative './config/environment.rb'
class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    binding.pry
    puts "Say something bruh..."
    input = gets.chomp
    case input
    when "list songs"
      Song.all
    end
  end
end
