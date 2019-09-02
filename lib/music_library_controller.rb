require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call

    input = ""

    while input != "exit"
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
    end
  end #call

    #"1. Thundercat - For Love I Come - dance"
    #"2. Real Estate - Green Aisles - country"
    def list_songs
      #binding.pry
      song_objects = Song.all.sort_by {|a| a.name}
      song_objects.each.with_index(1) do |a, i|
        puts "#{i}. #{a.artist.name} - #{a.name} - #{a.genre.name}"
      end
    end

    def list_artists
      artist = Artist.all.sort_by {|a| a.name}
      artist.each.with_index(1) do |a, i|
        puts "#{i}. #{a.name}"
      end
    end

    def list_genres
      genre = Genre.all.sort_by {|a| a.name}
      genre.each.with_index(1) do |a, i|
        puts "#{i}. #{a.name}"
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip

      if artist = Artist.find_by_name(input)
        artist.songs.sort_by {|a| a.name}.each.with_index(1) do |a, i|
          puts "#{i}. #{a.name} - #{a.genre.name}"
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.strip

      if genre = Genre.find_by_name(input)
        genre.songs.sort_by {|a| a.name}.each.with_index(1) do |a, i|
          puts "#{i}. #{a.artist.name} - #{a.name}"
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"

      input = gets.strip.to_i
      if (1..Song.all.length).include?(input) #if the input is included between the length of 1 to the length of the Song.all array -->
        song = Song.all.sort_by{ |a| a.name }[input - 1] #if above is true, sort the Song.all array by name, and grab the index by users input minus 1
      end
      #binding.pry
      puts "Playing #{song.name} by #{song.artist.name}" if song #puts the string if song is true (meaning, not nil)
    end


  #end #call



end
