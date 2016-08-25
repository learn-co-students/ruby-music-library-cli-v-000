require 'pry'
class MusicLibraryController
  extend Concerns::Findable
  attr_accessor :path, :new_importer

  def initialize(filepath = './db/mp3s')
   @path = filepath
   @new_importer = MusicImporter.new(filepath).import
   #@songs is an array of Song instances
  end


  def call
    puts "Input please: "
    loop do
      input = gets.chomp

      case input
      when 'list songs'
        self.new_importer.each_with_index do |song, index|
        puts "#{index + 1}. " + song
      end

      when 'list artists'
        self.new_importer.each do |song|
          ary = song.split(" - ")
          puts ary[0]
        end      

      when 'list genres'
        self.new_importer.each do |song|
          ary = song.split(" - ")
          puts ary[2]
        end

      when 'play song'
        puts "Playing " + self.new_importer[0]

      when 'list artist'
        puts self.new_importer
        artist = gets.chomp
        binding.pry
        self.new_importer.collect do |song|
          song.find_by_name(artist)
        end


      when 'exit'
        break
      else
        puts "One more time, please: "
      end
      
    # binding.pry
    end
    puts "Goodbye!"
  end
end
