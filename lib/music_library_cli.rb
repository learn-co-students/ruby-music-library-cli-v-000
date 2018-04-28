class MusicLibraryController

  def initialize(path = './db/mp3s')
    new_import = MusicImporter.new(path)
    new_import.import
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
    loop do
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
      when "exit"
        break
      end
    end
  end

  def sort_by_name(class_name)
    class_name.all.sort_by{|obj| obj.name}
  end

  def print_list(class_name)
    a = sort_by_name(class_name)
    a.each_with_index do |item, index|
      puts "#{index+1}. #{item.name}" if class_name == Artist || class_name == Genre
      puts "#{index+1}. #{item.artist.name} - #{item.name} - #{item.genre.name}" if class_name == Song
    end
  end

  def list_songs
    print_list(Song)
  end

  def list_artists
    print_list(Artist)
  end

  def list_genres
    print_list(Genre)
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    artist = Artist.find_by_name(artist_name)
    if artist
      artist_songs = artist.songs.sort_by{|song| song.name}
      artist_songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre = Genre.find_by_name(genre_name)
    if genre
      genre_songs = genre.songs.sort_by{|song| song.name}
      genre_songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_index = gets.strip.to_i - 1
    l = Song.all.sort_by{|song| song.name}
    if song_index.between?(0, l.size-1)
      song = l[song_index] if song_index.is_a? Integer
      puts "Playing #{song.name} by #{song.artist.name}" if song
    end
  end

end
