class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = nil

    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."

    while input != "exit"
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
  end

  def list_songs
    songs_list = Song.all.sort_by(&:name)
    songs_list.each.with_index(1) { |s, i| puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end

  def list_artists
    artists_list = Artist.all.sort_by(&:name)
    artists_list.each.with_index(1) { |a, i| puts "#{i}. #{a.name}" }
  end

  def list_genres
    genres_list = Genre.all.sort_by(&:name)
    genres_list.each.with_index(1) { |g, i| puts "#{i}. #{g.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    by_artist = Artist.find_by_name(input)
    unless !by_artist
      artist_songs = by_artist.songs.sort_by(&:name)
      artist_songs.each.with_index(1) { |song, i| puts "#{i}. #{song.name} - #{song.genre.name}" }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    by_genre = Genre.find_by_name(input)
    unless !by_genre
      genre_songs = by_genre.songs.sort_by(&:name)
      genre_songs.each.with_index(1) { |song, i| puts "#{i}. #{song.artist.name} - #{song.name}" }
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    song_num = Song.all.sort_by(&:name)[input - 1]
    if song_num && input >= 1 && input <= Song.all.length
      puts "Playing #{song_num.name} by #{song_num.artist.name}"
    end
  end

end
