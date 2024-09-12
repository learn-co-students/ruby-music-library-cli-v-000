class MusicLibraryController
attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path=path
    MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == "exit"
      input = gets
      list_songs if input == "list songs"
      list_artists if input == "list artists"
      list_genres if input == "list genres"
      play_song if input == "play song"
      list_artist if input == "list artist"
      list_genre if input == "list genre"
    end
  end

  def list_songs
    bla = Song.all.map {|x| "#{x.artist.name} - #{x.name} - #{x.genre.name}"}
    puts bla.sort.each_with_index {|x,index| puts "#{index+1}. #{x}"}
  end

  def list_artists
    puts Artist.all.map {|x| x.name}
  end

  def list_genres
    puts Genre.all.map {|x| x.name}
  end

  def play_song
    song = Song.find_by_name("Larry Csonka")
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name} "
  end

  def list_artist
    artist = gets
    artist = Artist.find_by_name(artist)
    artist.songs.each {|x| puts "#{x.artist.name} - #{x.name} - #{x.genre.name}"}
  end

  def list_genre
    genre = gets
    genre = Genre.find_by_name(genre)
    genre.songs.each {|x| puts "#{x.artist.name} - #{x.name} - #{x.genre.name}"}
  end
end