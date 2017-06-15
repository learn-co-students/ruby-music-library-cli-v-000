class MusicLibraryController

attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
  user_input = []
    until user_input == "exit"
      user_input = gets.chomp
      case user_input
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
    input = gets.strip
    song = Song.all[input.to_i-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    input = gets.strip
    Artist.find_by_name(input).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre
    input = gets.strip
    Genre.find_by_name(input).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

end
