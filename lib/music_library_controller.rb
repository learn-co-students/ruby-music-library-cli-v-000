class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = gets.chomp

    if input == "list songs"
      alpha = Song.all.sort_by{|s| s.artist.name}
      counter = 1
      alpha.each do |s|
        puts "#{counter}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        counter += 1
      end
      counter
    elsif input == "list artists"
      puts "#{Artist.all}"
    elsif input == "list genres"
      puts "#{Genre.all}"
    else
      input = gets.chomp until input == "exit"
    end
  end
end
