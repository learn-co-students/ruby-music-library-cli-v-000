class MusicLibraryController
  attr_accessor :path

  def initilize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  # def call
  #   input = ""
  #   while  input != "exit"
  #     puts "Welcome to Your Music Library!"
  #     puts "What would you like to do?"
  #     input = gets.strip
  #     case input
  #     when "list songs"
  #     	songs
  #     when "list artists"
  #     	artists
  #     when "list genres"
  #     	genres
  #     end
  #   end
  # end
end
