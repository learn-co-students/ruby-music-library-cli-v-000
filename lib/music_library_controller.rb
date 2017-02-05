require 'pry'

class MusicLibraryController


  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def menu
    puts "Music Library Loaded. Choose an option from the menu:"
    puts ""
    puts "1. [exit]"
    puts "2. [list songs]"
    puts "3. [list artists]"
    puts "4. [list genres]"
    puts "5. [list genre songs]"
    puts ""
  end



  def call
      self.menu
      input = ""
        while input != "exit"
          input = gets.chomp
          case input
            #list songs, this is broken
            when "list songs"
              sleep 1
              system "clear"
              Song.all.sort do |song|
                song.artist.name
                binding.pry
              end
            when "list artists" #put artist name for each artist imported
              sleep 1
              system "clear"
              Artist.all.each {|artist| puts artist.name}
            when "list genres" #put genre names for each genre imported
              sleep 1
              system "clear"
              Genre.all.each {|genre| puts genre.name}
            when "list genre songs" #list all songs for a given genre
              sleep 1
              system "clear"
              puts "Which genre would you like to search?"
              input = gets.chomp
              genre = Genre.find_by_name(input)
              genre.songs.each {|song| puts song}
            when "menu"
              menu
            when "exit"
              input = "exit"
          end
        end
    end

end
