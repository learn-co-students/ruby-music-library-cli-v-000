class MusicLibraryController
  attr_accessor :path
  def initialize(path='./db/mp3s')
    @path=path
    MusicImporter.new(path).import
  end

  def call
    input = ""
  while input!="exit"
    puts "Welcome!"
    input = gets.strip
    case input
    when  "list songs"
      songs
    when "list artists"
      artists
    when "list genres"
      genres
    when "play song"
      play_song
    when "list artist"
      list_artist_song
    when "list genre"
      list_genre_song
    end
  end
  end

  def songs
    Song.all.each.with_index(1) do |a,i|
      puts "#{i}. #{a.artist.name} - #{a.name} - #{a.genre.name}"
    end
  end

  def artists
    Song.all.collect {|s| puts s.artist.name}
  end

  def genres
    Song.all.collect {|s| puts s.genre.name}
  end

  def play_song
    puts "which song?"
    song = gets.strip
    song_order=song.to_i
    puts "Playing #{Song.all[song_order-1].artist.name} - #{Song.all[song_order-1].name} - #{Song.all[song_order-1].genre.name}"
  end

  def list_artist_song
    puts "which artist?"
    artist_name = gets.strip
    artist = Artist.find_by_name(artist_name)
    puts artist.songs.collect {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_genre_song
    puts "which genre?"
    genre_name = gets.strip
    genre = Genre.find_by_name(genre_name)
    puts genre.songs.collect {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end
end
