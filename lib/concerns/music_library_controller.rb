class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s/.")
    importer = MusicImporter.new(path)
    importer.import
  end

#   def call
#     input = ""
#   when input != "exit"
#     puts "Welcome to Your Music Library!"
#     puts "What would you like to do?"
#     input = gets.strip
#     case user_input
#     when "list artists"
#
#     when "list genres"
#
#     when "list artist"
#
#     when "list genre"
#
#     when "play song"
#
#     when "exit"
#     end
#   end
#
# "To list all of the artists in your library, enter 'list artists'"
# "To list all of the genres in your library, enter 'list genres'."
# "To list all of the songs by a particular artist, enter 'list artist'."
# "To list all of the songs of a particular genre, enter 'list genre'."
# "To play a song, enter 'play song'."
# "To quit, type 'exit'."
end
