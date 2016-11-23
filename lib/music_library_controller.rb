require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end


    def call
      input = ""
    #  input = gets.strip
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      while input != "exit"

        input = gets.strip
        if input == "list songs"
          songs

        elsif input == "list artists"
          artists


        end
      end
    end

  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end




end
