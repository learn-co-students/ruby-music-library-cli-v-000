require 'pry'
class MusicLibraryController
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
          ary[1]
        end      

      when 'list genres'

      when 'play song'

      when 'exit'
        break
      else
        puts "One more time, please: "
      end
      
    #  binding.pry
    end
    puts "Goodbye!"

  end
      
    #   case reply
    #   when "list songs"
    #     puts self.songs
    #     binding.pry
    #   when "list artists"
    #     self.songs.collect {|x| x.artist}
    #     # @songs is an array of instances
    #     # i need .collect artists of @songs 
    #   when "list genres"
    #     puts self.songs.genres

    #   when "play song"
        
    #   when "list artist"

    #   when "list genre"
        
    #   else
    #     puts "blah"
    #   end
    # end

end
