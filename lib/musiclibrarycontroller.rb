class MusicLibraryController

  attr_accessor :filepath

  def initialize(filepath="./db/mp3s")
    MusicImporter.import(filepath)

  end

  def call
    puts "Welcome!"
    answer = input.gets
  end

end
