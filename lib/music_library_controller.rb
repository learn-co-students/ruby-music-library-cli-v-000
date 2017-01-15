class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    #binding.pry
      user_input = ""
      while user_input != "exit"
        puts "What would you like to listen to?"
        user_input = gets.strip
      if user_input == "list songs"
        "what about now"
      end
    end

  end


end
