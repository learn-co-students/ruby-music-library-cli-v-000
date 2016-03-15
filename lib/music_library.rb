class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    music = MusicImporter.new(path)
    music.import

  end

  def call()
    puts "What would you like to do?"
    option=gets.chomp

    case option.downcase
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "play song"
      play_song
    when "list artist"
      list_artist
    when "list genre"
      list_genre
    end
  end

  def list_songs
    Song.all.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    self.call
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist.name}"}
    self.call
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
    self.call
  end

  def play_song
    puts "Which song? (enter a number)"
    song_request = gets.chomp
    song = Song.all[song_request.to_i - 1]

    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    self.call
  end

  def list_artist
    puts "Which artist?"
    artist_request = gets.chomp

    artist = Artist.find_by_name(artist_request)
    artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    self.call
  end

  def list_genre
    puts "Which genre?"
    genre_request = gets.chomp

    genre = Genre.find_by_name(genre_request)
    genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
    self.call
  end

end