class MusicLibraryController



  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    puts "What you want me to list fam? Start off saying lists _______, your choices are artists,songs, genres"
    input = gets.chomp
    while input != "exit" do
      case input
      when "lists artists"
        artists
      when "lists songs"
       songs
      end
    end
end


end
