class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to the terminal music player"
    puts "Enter one of the following:"
    options = ["Songs", "Artists", "Genres", "Play Song", "Artist Songs", "Genre Songs"]
    options.each do |topic|
      puts "#{topic}"
    end
    input = gets.strip.upcase
    case input
    when "EXIT"
      puts "Goodbye"
    when "SONGS"
      Song.all.each_with_index do |song, index|
        puts "#{index+1}, #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    when "ARTISTS"
      Artist.all.each do |artist|
        puts artist.name
      end
    when "GENRES"
      Genre.all.each do |genre|
        puts genre.name
      end
    when "PLAY SONG"
      puts "Enter a song to play:"
      song = Song.all[gets.to_i - 1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    when "ARTIST SONGS"
      puts "Enter artist name:"
      artist_name = gets.chomp
      Artist.find_by_name(artist_name).songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    when "GENRE SONGS"
      puts "Enter genre:"
      genre_name = gets.chomp
      Genre.find_by_name(genre_name).song.each do |song|
        puts "#{song.genre.name} - #{song.name} - #{song.artist.name}"
      end
    end
  end

end