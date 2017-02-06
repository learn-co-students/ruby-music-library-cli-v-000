require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music_player = MusicImporter.new(@path)
    music_files = music_player.import
  end

  def menu
    puts ""
    puts "Main Menu"
    puts "----------"
    puts "1. [exit]"
    puts "2. [list songs]"
    puts "3. [play song]"
    puts "4. [list artists]"
    puts "5. [list artist]"
    puts "6. [list genres]"
    puts "7. [list genre]"
    puts ""
    print ">> "
  end

  def clear_window
    system "clear"
  end

  def call
        self.clear_window
        puts "Music Library Initializing..."
        sleep 1
        self.clear_window
        puts "Welcome to your Music Library! Please navigate using the Menu."
        self.menu
        line = ">> "

        while user_input = gets.chomp

          case user_input
            when "list songs"
              self.clear_window
              Song.all.each_with_index do |song, index|
                puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
              end
              print line

            when "list artists" #put artist name for each artist imported
              self.clear_window
              Artist.all.each {|artist| puts "#{artist.name}"}
              print line


            when "list artist" #list all songs for a given artist
              self.clear_window
              puts "Which artist would you like to search?\n"
                input = gets.chomp
                artist = Artist.find_by_name(input)
                artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
                print line


            when "list genres" #put genre names for each genre imported
              self.clear_window
              Genre.all.each {|genre| puts genre.name}
              print line

            when "play song" #plays a song by number
              self.clear_window
              puts "Which song would you like to play? Input Song Number or [exit] to return to Menu."
                while input = gets.chomp
                  if input.to_i > song.all.length
                     puts "Invalid song number. Please try again!"
                     print line
                     input = gets.chomp
                  if input.to_i.between?(0,100)
                      current_song = Song.all[input.to_i - 1]
                      puts "\nPlaying #{current_song.artist.name} - #{current_song.name} - #{current_song.genre.name}\n\n\n"
                      puts line
                      break
                  elsif input == "exit"
                      self.clear_window
                      menu
                      break
                    end

            when "list genre" #list all songs for a given genre
              self.clear_window
              puts "Which genre would you like to search?\n"
                input = gets.chomp
                genre = Genre.find_by_name(input)
                genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
                print line

            when "menu"
              self.clear_window
              menu

            when "exit"
              self.clear_window
              puts "Music player powering off..."
              sleep 0.5
              break
          end
      end
    end
end
