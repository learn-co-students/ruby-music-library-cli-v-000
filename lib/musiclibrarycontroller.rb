require 'pry'
class MusicLibraryController

  attr_accessor :path, :importer

  def initialize(path = "./db/mp3s")
    @path = path;

    @importer = MusicImporter.new(@path);
    @importer.import;
  end

  def call
    puts "Welcome to your music library!";

    possible_inputs = [
      "list songs",
      "list artists",
      "list genres",
      "list artist",
      "list genre",
      "play song",
      "exit"
    ]

    user_input = "";

    until user_input == "exit" do
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      user_input = gets.chomp

      case user_input
        when possible_inputs[0]
          list_songs
        when possible_inputs[1]
          list_artists
        when possible_inputs[2]
          list_genres
        when possible_inputs[3]
          list_songs_by_artist
        when possible_inputs[4]
          list_songs_by_genre
        when possible_inputs[5]
          play_song
      end
    end
  end

  def list_songs
    songs = Song.all.sort_by {|song| song.name};
    songs.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"};
  end

  def list_artists
    artists = Artist.all.sort_by! {|artist| artist.name};
    artists.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"};
  end

  def list_genres
    genres = Genre.all.sort_by! {|genre| genre.name};
    genres.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"};
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp.downcase;
    artist_songs = Song.all.select {|song| song.artist.name.downcase == user_input};
    artist_songs_abc = artist_songs.sort_by! {|song| song.name}
    artist_songs_abc.each_with_index{|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp.downcase;
    genre_songs = Song.all.select {|song| song.genre.name.downcase == user_input};
    genre_songs_abc = genre_songs.sort_by! {|song| song.name}
    genre_songs_abc.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
  end

  # => Alternate solution
  #def play_song
  #  puts "Which song number would you like to play?"
  #  response = gets.strip.to_i
  #  Song.all.sort{|a,b| a.name <=> b.name}.each_with_index do |song, index|
  #    #binding.pry
  #    if response == index + 1
  #      puts "Playing #{song.name} by #{song.artist.name}"
  #    end
  #  end
  #end

  def play_song
    puts "Which song number would you like to play?";
    song_list = Song.all.sort_by {|song| song.name};
    user_input = gets.chomp.to_i;
    song_list.each_with_index {|song, index|
      if index + 1 == user_input
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    }
  end

end
