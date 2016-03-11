class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""
    until input == "exit"
      puts "Hello, welcome to your music library. Please type one of the following: list artists, list genres, list songs, list artist, list genre, play song, or exit."
    input = gets.chomp
    case input
      when "list songs"
        Song.all.each_with_index  {|song, index| puts "#{index + 1}. #{song.artist} - #{song.name} - #{song.genre}"}

      when "list artists"
        puts Artist.all

      when "list genres"
        puts Genre.all

      when "list artist"
        puts "Please enter the artist you are searching for:"
        input_artist = gets.chomp
        Song.all.select {|song| song.artist.name == input_artist}.each {|song| puts "#{song.artist} - #{song.name} - #{song.genre}"}

      when "play song"
        puts "Please enter the song number you wish to play:"
        input_song = gets.to_i - 1
        puts "Playing #{Song.all[input_song].artist.name} - #{Song.all[input_song].name} - #{Song.all[input_song].genre.name}"

      when "list genre"
        puts "Please enter the genre you are searching for:"
        input_genre = gets.chomp
        Song.all.select {|song| song.genre.name == input_genre}.each {|song| puts "#{song.artist} - #{song.name} - #{song.genre}"}
      end
    end
  end

end
