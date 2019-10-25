class MusicLibraryController
  attr_accessor :music_importer
  def initialize(path= './db/mp3s')
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

    input = ""
    while input != 'exit'
      input = gets
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      when 'exit'

      else
        puts "What would you like to do?"
      end
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by {|song| song.name}
    sorted_songs.each_with_index do |song, line_number|
      puts "#{line_number+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort_by {|artist| artist.name}
    sorted_artists.each_with_index do |artist, line_number|
      puts "#{line_number+1}. #{artist.name}"
    end
  end

  def list_genres
    sorted_genre = Genre.all.sort_by {|genre| genre.name}
    sorted_genre.each_with_index do |genre, line_number|
      puts "#{line_number+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_by_name(gets)
    if artist == nil
      return nil
    end
    sorted_songs = artist.songs.sort_by{|songs| songs.name}
    sorted_songs.each_with_index do |song, line_number|
      puts "#{line_number+1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets)
    if genre == nil
      return
    end
    sorted_songs = genre.songs.sort_by{|songs| songs.name}
    sorted_songs.each_with_index do |song, line_number|
      puts "#{line_number+1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.to_i
    if Song.all.size < song_number || song_number < 1
      return
    end
    sorted_songs = Song.all.sort_by{|song| song.name}
    puts "Playing #{sorted_songs[song_number-1].name} by #{sorted_songs[song_number-1].artist.name}"
  end
end
