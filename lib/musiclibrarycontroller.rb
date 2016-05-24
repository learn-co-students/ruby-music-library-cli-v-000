class MusicLibraryController

  attr_accessor :path, :music_importer, :call

  def initialize(path = './db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(@path)
    @music_importer.import
  end

  def call
    input = nil
    until input == "exit"
      puts "Please enter input:"
      input = gets
      Song.find_by_name(input) || Artist.find_by_name(input) || Genre.find_by_name(input)
    end
  end



end
