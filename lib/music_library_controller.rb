class MusicLibraryController
  attr_reader :path, :music_importer

  def initialize(path='./db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    input = ''
    until input == "exit"
      puts "Give a path to import music files from. Type 'exit' to quit"
      input = gets.chomp

      case input
      when "list songs"
        i = 1
        @music_importer.files.sort.each do |file|
          puts "#{i}. #{file}"
          i += 1
        end
      when "list artists"
        Artist.all.each do |artist|
          puts artist.name
        end
      when "list genres"
        Genre.all.each do |genre|
          puts genre.name
        end
      when "play song"
        i = 1
        files = @music_importer.files.sort
        files.each do |file|
          puts "#{i}. #{file}"
          i += 1
        end
        puts "Choose a song (number 1 - #{i-1})"
        choice = gets.chomp.to_i - 1
        puts "Playing #{files[choice]}"
      when "list artist"
        puts "Choose an artist"
        artist = Artist.find_by_name(gets.chomp)
        artist.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "list genre"
        puts "Choose a genre"
        genre = Genre.find_by_name(gets.chomp)
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      when "exit"
        puts "Quitting Music Library."
      else
        puts "Not a valid input. Try again"
      end
    end
  end

end
