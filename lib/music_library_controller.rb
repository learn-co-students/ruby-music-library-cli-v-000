class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = gets.strip
    until input == "exit" do 
      input = gets.strip
    end
  end

end