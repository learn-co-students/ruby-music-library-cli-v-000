class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
  end

  def call
    input = 'nil'
    while input != 'exit'
      menu
      input = gets.strip
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'play song'
        play_song
      when 'list artist'
        list_artist
      when 'list genre'
        list_genre
      when 'exit'
        break
      end
    end
  end

  def menu
    puts "What would you like to do?"
    puts 'list songs'
    puts 'list artists'
    puts 'list genres'
    puts 'play song'
    puts 'list artist'
    puts 'list genre'
    puts 'exit'
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{print_song(song)}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts artist.name
    end
  end

  def list_artist
    Artist.all.each do |artist|
      puts artist.name
    end
    puts "Name the artist you would like to list"
    artist_input = gets.strip
    if (artist = Artist.find_by_name(artist_input))
      artist.songs.each do |song|
        puts print_song(song)
      end
    else
      puts "Artist not found!"
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end

  def play_song
    puts "What song would you like to play?[1-99]"
    song_input = gets.strip.to_i
    if song_input.between?(1,99)
      song = Song.all[song_input-1]
      puts "Playing #{print_song(song)}"
    end
  end

  def print_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_genre
    Genre.all.each do |genre|
      puts genre.name
    end
    puts "What genre would you like to list?"
    genre_input = gets.strip
    if (genre = Genre.find_by_name(genre_input))
      genre.songs.each do |song|
        puts print_song(song)
      end
    end
  end

end
