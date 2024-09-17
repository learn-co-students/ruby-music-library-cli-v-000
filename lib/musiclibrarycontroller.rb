class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
  	@path = path
  	MusicImporter.new(path).import
  end

  def call
  	input = nil
  	until input == "exit"
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
      	list_artist
      when "list genre"
      	list_genre
      end
  	end
  end

  def list_songs
  	Song.all.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
  	Artist.all.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
  	Genre.all.each {|genre| puts "#{genre.name}"}
  end


  def play_song
  	puts "Enter a song number: "
  	current_song = gets.chomp.to_i
  	song = Song.all[current_song - 1]
  	puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
  	puts "Enter an artist name: "
  	artist = gets.chomp
  	current_artist = Artist.find_by_name(artist)
    current_artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre
  	puts "Enter a genre name: "
  	genre = gets.chomp
  	current_genre = Genre.find_by_name(genre)
  	current_genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
end