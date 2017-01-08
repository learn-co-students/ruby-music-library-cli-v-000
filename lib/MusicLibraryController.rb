class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input= nil
    until input == "exit" do
      input = gets.strip
      if input == "list songs"
        Song.all.each.with_index(1) {|names, index| puts "#{index}. #{names.artist.name} - #{names.name} - #{names.genre.name}"}
      end
      break if input == "exit"
    end
  end
end
