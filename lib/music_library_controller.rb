class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      input = gets.chomp
    case input
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "play song"
      play_song
    when "list artist"
      artist_list
    when "list genre"
      genre_list
  end
  end
end

  def list_songs
    Song.all.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    Song.all.each {|song| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def artist_list
    input = gets.chomp
    artist = Artist.all.detect {|a| a.name == input}
    artist.songs.each {|b| puts "#{b.artist.name} - #{b.name} - #{b.genre.name}"}
  end

  def genre_list
    input = gets.chomp
    genre = Genre.all.detect {|a| a.name == input}
    genre.songs.each {|b| puts "#{b.artist.name} - #{b.name} - #{b.genre.name}"}
  end
end
