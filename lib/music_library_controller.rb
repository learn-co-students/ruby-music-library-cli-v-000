class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = nil
    menu
    while input != "exit"
      input = gets.strip

      case input
      when "list songs"
        songs = Song.all.each.with_index(1) do |song, index|
          puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list artists"
        artists = Artist.all.each do |artist|
          puts artist.name
        end
      when "list genres"
        genres = Genre.all.each do |genre|
          puts genre.name
        end
      when "play song"
        puts "which song number would you like to play"
        input = gets.strip.to_i - 1
        puts "Playing #{Song.all[input].artist.name} - #{Song.all[input].name} - #{Song.all[input].genre.name}"
      when "list artist"
        puts "which artist"

        input = gets.strip
        artist = Artist.find_by_name(input)

        artist.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list genre"
        puts "list genre"

        input = gets.strip
        genre = Genre.find_by_name(input)

        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{genre.name}"
        end
      end
    end
  end

  def menu
    puts "type list songs"
    puts "To see a list of songs"
  end
end
