require 'pry'

class MusicLibraryController



  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = nil
    while input != "exit" do
      puts "Hey! Guess what time it is! Music Library Time!!!"
      puts "What you want me to list fam? Start off saying lists _______, your choices are artists,songs, genres"
      input = gets.chomp
      case input
      when "lists artists"
        lists_artists
      when "lists songs"
       songs
      end
    end
end

  def lists_artists
   Artist.all.each_wih_index(1) do |artist, index|
    puts "#{index}. #{artist}"
    binding.pry
   end
  end

end
