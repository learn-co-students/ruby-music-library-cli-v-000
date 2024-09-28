

class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    input = ""
    while input != "exit"
    input = gets.strip
    case input
    when "list songs"
      songs
    when "list artists"
      artists
    when "list genres"
      genres
    when "play song"
      play_song
    when "list artist"
      list_artist
    when "list genre"
      list_genre
    end
  end

  def songs

    Song.all.sort_by{|song| song.artist.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end

  def artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end

  def genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play_song
    puts "Which song would you like to play?"
    song_name_input = gets.strip
    song_to_play = Song.all.sort_by{|song| song.artist.name}[song_name_input.to_i-1]
    puts "Playing #{song_to_play.artist.name} - #{song_to_play.name} - #{song_to_play.genre.name}"
  end

  def list_artist
    puts "Which artist would you like to list songs for?"
    artist_name_input = gets.strip
    Artist.find_by_name(artist_name_input).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    puts "which genre would you like to list songs for?"
    genre_name_input = gets.strip
    Genre.find_by_name(genre_name_input).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end