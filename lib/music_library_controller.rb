class MusicLibraryController
  attr_accessor :path
  attr_reader :response

  def initialize(path='./db/mp3s')
    self.path = path
    MusicImporter.new(path).import
  end

  def call
    response = ''
    while response != 'exit'
      "Welcome to your music library..."
      "What would you like to do?"
      response = gets.chomp
      case response
      when "list songs"
        "Listing songs"
      when "list artists"
        "Listing artists"
      when "list genres"
        "Listing genres"
      when "list artist"
        "Listing all songs by this artist"
      when "list genre"
        "Listing all songs in this genre"
      when "play song"
        "Playing song"
      else
        "See you later!"
      end
    end
  end
end

#  def response
#    puts "Would you like to (a) continue or (b) exit?"
#    response = gets
#    response == 'exit' ? true : false
#  end
#end

#MusicImporter.new(path).import
