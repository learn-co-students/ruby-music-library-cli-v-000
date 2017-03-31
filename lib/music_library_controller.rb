class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    music_lib = MusicImporter.new(path)
    music_lib.import
  end

  def call
    puts "get input"
      while (a = gets.chomp) != 'exit'
        puts a
      end
  end

end
