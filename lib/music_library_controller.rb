class MusicLibraryController
  require "pry"

  def initialize(path='./db/mp3s')
    file=MusicImporter.new(path)
    file.import
  end

  def call
    input=""
    until input== "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "What would you like to do?"
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      input = gets.strip

      if input== "list songs"
        list_song
      end
    end
  end

  def list_songs
      Song.all.sort.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end


end
