
class MusicLibraryController

  def initialize(path = "./db/mp3s")

   imported = MusicImporter.new(path)
   imported.import

  end

  def call
    user_input = ""
    while user_input != "exit"
      user_input = gets.strip

      case user_input
      when "songs"
        Song.all.each do |each_song|
          puts each_song.name

        end

      when "artist"

      when "genre"


      end

      # user_input = "exit"
    end
  end


end
