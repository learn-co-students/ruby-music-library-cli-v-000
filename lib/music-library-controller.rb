class MusicLibraryController
  #class methods
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  #instance methods
  def call
    input = ""
    while input != "exit"
      puts "What would you like to do? (type 'options' for a list of options)"
      input = gets.chomp
      case input
      when "options"
        puts "Your options are: list songs, list artists, list genres, play song, list artist, and list a genre's songs."
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_artist_songs
      when "list genre"
        list_genre_songs
      end
    end
  end

  #helper methods
  def songs
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  def artists
    Artist.all.each {|artist| puts "#{artist.name}"}
  end
  def genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end
  def play_song
    puts "Okay, which song would you like to play? (type 'songs' for a list of songs)"
    song_name = gets.chomp
    song = Song.find_by_name(song_name)
    puts puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
  def list_artist_songs
    puts "Okay, which artist would you like to list?"
    artist_name = gets.chomp
    artist = Artist.find_by_name(artist_name)
    artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  def list_genre_songs
    puts "Okay, which genre would you like to list?"
    genre_name = gets.chomp
    genre = Genre.find_by_name(genre_name)
    genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
end
