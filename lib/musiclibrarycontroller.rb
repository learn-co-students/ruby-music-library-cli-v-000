class MusicLibraryController

  attr_accessor :filepath

  def initialize(filepath = "./db/mp3s")
    MusicImporter.new(filepath).import
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

    input = nil
    until input == "exit"
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
      end #case
    end
  end

  def list_songs
    arr = Song.all.sort_by(&:name)
    arr.each.with_index(1) { |a, i| puts "#{i}. #{a.artist.name} - #{a.name} - #{a.genre.name}" }
  end

  def list_artists
    arr = Artist.all.sort_by(&:name)
    arr.each.with_index(1) { |a, i| puts "#{i}. #{a.name}" }
  end

  def list_genres
    arr = Genre.all.sort_by(&:name)
    arr.each.with_index(1) { |a, i| puts "#{i}. #{a.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist_object = Artist.find_by_name(input)
    if artist_object
      a = artist_object.songs.sort_by(&:name)
      a.each.with_index(1) { |song, i| puts "#{i}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts("Please enter the name of a genre:")
    input = gets.chomp
    genre_object = Genre.find_by_name(input)
    if genre_object
      a = genre_object.songs.sort_by(&:name)
      a.each.with_index(1) { |song, i| puts "#{i}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts("Which song number would you like to play?")
    arr = Song.all.sort_by(&:name)
    input = gets.chomp.to_i
    puts "Playing #{arr[input-1].name} by #{arr[input-1].artist.name}" if input.between?(1,arr.length)

  end

end #class MusicLibraryController
