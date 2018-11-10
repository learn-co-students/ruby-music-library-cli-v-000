require 'pry'
class MusicLibraryController
  def initialize(path = './db/mp3s')
      @path = path
      @music_importer = MusicImporter.new(path)
      @music_importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    responce_1= gets.chomp

    while responce_1 = gets.chomp # loop while getting user input
      case responce_1
      when "exit"
        #puts "Welcome to your music library!"
        break # make sure to break so you don't ask again
      end
    end
  end

    def list_songs
 Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
  #binding.pry
    puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
  end
    end

    def list_artists

    end

    def list_genres
    end

    def list_songs_by_artist
    end

    def list_songs_by_genre
    end

    def play_song
    end




  # end

end
