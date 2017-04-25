class MusicLibraryController
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end
  def call
    user_input = nil
    while user_input != "exit"
      user_input = gets.chomp
    end
  end
end
