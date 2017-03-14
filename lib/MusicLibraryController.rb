class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s" )
    @path = path
    new_path = MusicImporter.new(path)
    new_path.import
  end

  def call
    input = ""
    until input == "exit"
    puts "What would you like to do?"
    input = gets.chomp

    case input
    when "list songs"
      Song.all.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    when "list artists"
      Song.all.each do |song|
        puts "#{song.artist.name}"
      end
    when "list genres"
      Song.all.each do |song|
        puts "#{song.genre.name}"
      end
    when "play song"
      Song.all.each do |song|
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    when "list artist"
      Song.all.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    when "list genre"
      Genre.all.each do |genre|
        genre.songs.each do |song|
          puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      end
    end
  end
  end
end
