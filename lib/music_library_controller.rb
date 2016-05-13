class MusicLibraryController
  attr_accessor :import

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = nil
    while input != "exit"
      puts "Konnichiwa, Please select a music track: "
      input = gets.chomp
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
  end

  def songs
    Song.all.each_with_index {|song, idx| puts "#{idx + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def artists
    Artist.all.each {|artist| puts artist.name}
  end

  def genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_song
    puts "Enter a song number: "
    choice = gets.chomp.to_i
    song = Song.all[choice -1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "Enter an artist: "
    artist = gets.chomp
    artist = Artist.find_by_name(artist)
    artist.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_genre
    puts "Enter a genre:"
    genre = gets.chomp
    genre = Genre.find_by_name(genre)
    genre.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end
end
