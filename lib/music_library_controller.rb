class MusicLibraryController
  attr_accessor :path, :songs

  def initialize(path="./db/mp3s")
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
      input = gets.chomp

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
      #if you want to make the CLI a bit more usable, expose this. Makes test suite fail but better experience
      #puts "Would you like to do something else? Answer 'yes' or 'no'"
      #input2 = gets.chomp
      #input = "exit" if input2 == "no"
    end
  end

  def list_songs
    Song.all.sort_by(&:name).each.with_index{|song,i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by(&:name).each.with_index{|artist,i| puts "#{i+1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort_by(&:name).each.with_index{|genre,i| puts "#{i+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.find_by_name(input) != nil
      Artist.find_by_name(input).songs.sort_by(&:name).each.with_index{|song,i| puts "#{i+1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input) != nil
      Genre.find_by_name(input).songs.sort_by(&:name).each.with_index{|song,i| puts "#{i+1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp
    if input.to_i <= Song.all.size && input.to_i > 0
      song = Song.all.sort_by(&:name)[input.to_i-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
