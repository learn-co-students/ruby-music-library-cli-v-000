require "pry"

class MusicLibraryController
  extend Concerns::Findable

  attr_accessor :songs

  def initialize(path= "./db/mp3s")
    @path = path
    new_musicimporter_object = MusicImporter.new(path)
    new_musicimporter_object.import
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

    if input == "list songs"
      self.list_songs
    elsif input == "list artists"
      self.list_artists
    elsif input == "list genres"
      self.list_genres
    elsif input == "list artist"
      self.list_songs_by_artist
    elsif input == "list genre"
      self.list_songs_by_genre
    elsif input == "play song"
      self.play_song


    end
  end

  end

  def list_songs
    songs_alphabetical = Song.all.uniq.sort_by {|song| song.name}
    songs_alphabetical.each.with_index(1) do |song,index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
  end

  def list_artists
    artist_alphabetical = Artist.all.uniq.sort_by {|artist| artist.name}
    artist_alphabetical.each.with_index(1) do |artist,index|
        puts "#{index}. #{artist.name}"
      end
  end

  def list_genres
    genre_alphabetical = Genre.all.uniq.sort_by {|genre| genre.name}
    genre_alphabetical.each.with_index(1) do |genre,index|
        puts "#{index}. #{genre.name}"
      end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if chosen_artist = Artist.find_by_name(input)
      artist_songs = chosen_artist.songs
      song_artist_alpha = artist_songs.uniq.sort_by {|song| song.name}
      song_artist_alpha.each.with_index(1) do |song,index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if chosen_genre = Genre.find_by_name(input)
      genre_songs = chosen_genre.songs
      song_genre_alpha = genre_songs.uniq.sort_by {|song| song.name}
      song_genre_alpha.each.with_index(1) do |song,index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
      input = gets.chomp.to_i
      if (1..Song.all.uniq.size).include?(input)
        file_name = Song.all.uniq.sort_by {|song| song.name}[input - 1]
        puts "Playing #{file_name.name} by #{file_name.artist.name}"
      end
    end

end
