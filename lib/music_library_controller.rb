class MusicLibraryController
  attr_reader :path

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
    input = gets.chomp

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
    end

    until input == "exit"
      input = gets.chomp
    end
  end

  def list_songs
    sorted(Song.all).each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted(Artist.all).each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres
    sorted(Genre.all).each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.all.detect { |a| a.name == input }

    if !artist.nil?
      sorted_songs = artist.songs.sort_by { |song| song.name }
      sorted_songs.each_with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.all.detect { |g| g.name == input }

    if !genre.nil?
      sorted_songs = genre.songs.sort_by { |song| song.name }
      sorted_songs.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    sorted_songs = sorted(Song.all)
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if input > 0 && input <= sorted_songs.length
      play_this = sorted_songs[input - 1]
      puts "Playing #{play_this.name} by #{play_this.artist.name}"
    end
  end

  def sorted(array)
    array.sort_by { |instance| instance.name }
  end

end
