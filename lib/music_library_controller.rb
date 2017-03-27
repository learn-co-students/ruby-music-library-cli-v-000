class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
     puts "Welcome to Your Music Library!"
     puts "What would you like to do?"
     input = gets.strip
     while input != "exit"
       if input == "list songs"
         songs
       elsif input == "list artists"
         artists
       elsif input == "list genres"
         genres
       end
     end
  end

end
