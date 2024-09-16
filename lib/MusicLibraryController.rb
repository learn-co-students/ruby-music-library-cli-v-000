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
    input = ""

    while input != "exit"
      puts "Input here, please: "
      puts "And: "
      input = gets.chomp
      
      case input
      when 'list songs'
        self.new_importer.each.with_index(1) do |song, index|
        puts "#{index}. " + song
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
        ary = self.new_importer
        ary.each do |song|
          song = song.split(" - ")
          puts "#{song[0]} - #{song[1]} - #{song[2]}"
        
        end

      when 'list genre'
        self.new_importer.each do |song|
          song = song.split(" - ")
          puts "#{song[0]} - #{song[1]} - #{song[2]}"
        end
      
      when 'exit'
        break

      else
        puts "One more time, please: "
      end
      
  #  binding.pry
    end
    puts "Goodbye!"
  end
end
