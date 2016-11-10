class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "Welcome to the Music Library CLI!"
    puts "Please type: list songs, list artist/s, list genre/s, or play song."
    puts "You may also search for a song, artist, or genre by typing out its name."
    puts "To leave the program, please type: exit."
    choice = gets.chomp
    case choice
    when "list songs"
      Song.all.each_with_index(1) do {|value, index| index"." value.artist" - "value.name" - "value.genre.name }
    when "list artists"
    when "list genres"
    when "play song"
    when "list artist"
    when "list genre"
    when "exit"
    else
      puts "invalid option!"
      self.call
    end
  end
end
