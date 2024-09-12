require "pry"
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    @importer = MusicImporter.new(@path)
    @importer.import

  end

  def call
    input = gets

    list_songs
    play_songs
    while input != "exit"
      input = gets
    end
  end

  def list_songs
    x = 1
    array = []
    @importer.files.each do |filename|
      array << filename
    end
    array.sort!
    array.each do |y|
      puts "#{x}. #{y}"
      x+=1
    end

  end
  def play_songs
    puts "Playing #{@importer.files[0]}"
  end

end
