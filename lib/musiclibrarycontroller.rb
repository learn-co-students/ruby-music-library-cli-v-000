require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path= './db/mp3s')
    @path = path
    new_song = MusicImporter.new(path)
    new_song.import
    #binding.pry
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

    input = gets.strip
    until input == "exit"
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
      puts "What would you like to do?"
      input = gets.strip
    end

    def list_songs
      #binding.pry
      Song.all.sort {|a, b| a.name <=> b.name}.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
      #binding.pry
      Artist.all.sort {|a, b| a.name <=> b.name}.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
    end

    def list_genres
      Genre.all.sort {|a, b| a.name <=> b.name}.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip
      #binding.pry
      Artist.all.detect do |a|
        if a.name == input
          a.songs.sort {|a, b| a.name <=> b.name}.each_with_index {|s, index| puts "#{index + 1}. #{s.name} - #{s.genre.name}"}
      end
    end
  end

   def list_songs_by_genre
  #   #binding.pry
     puts "Please enter the name of a genre:"
     input = gets.strip
     Genre.all.detect do |g|
       if g.name == input
         g.songs.sort {|a, b| a.name <=> b.name}.each_with_index {|s, index| puts "#{index +1}. #{s.artist.name} - #{s.name}"}
       end
     end
   end

   def play_song
     puts "Which song number would you like to play?"
     input = gets.strip.to_i
     if (1..Song.all.length).include?(input)
       song = Song.all.sort {|a, b| a.name <=> b.name}[input - 1]
    end
     puts "Playing #{song.name} by #{song.artist.name}" if song

  end






end


end
