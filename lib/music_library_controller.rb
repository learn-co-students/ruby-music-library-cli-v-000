class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    puts "Welcome to your music library. What would you like to do?"
    input = gets.chomp
    if input == "list songs"
      order = 1
      Song.all.each do |song|
        puts "#{order}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
       order += 1
      end
    end
  end

end