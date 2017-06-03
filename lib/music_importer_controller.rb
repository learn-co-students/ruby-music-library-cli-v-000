class MusicLibraryController

attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    @music_import= []
    @music_import= MusicImporter.new(path).import
  end

  def call
    input= " "
    while input!= "exit"
      input = gets.chomp
      input
    end
  end



end
