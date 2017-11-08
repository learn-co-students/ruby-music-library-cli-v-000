class MusicLibraryController

  def initialize(path)
    @path = path
    @music_importer = MusicImporter.new(path)
    #@music_importer.import
  end

  def call
    #welcome
    #ask user for input
    #loops until user types exit
    until input == "exit"
      puts "Enter a song choice"
      input = gets.chomp
    end
  end

end
