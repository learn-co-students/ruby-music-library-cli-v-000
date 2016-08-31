class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new[path]
    importer.import
  end
end

def call
  input = ""
  while input != "exit"
    puts "Welcome to Your Music Library!"
    puts "What would you like to do?"
    input = gets.strip
    case input
    when "list songs"
      songs
    when "list artists"
      artists
    when "list genres"
      genres
    when "list artist"
      list_artist
    when "list genres"
      list_genres
    when "play song"
      play_song
    end
  end
end
