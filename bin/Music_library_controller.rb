class MusicLibraryController


  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
 end

 def call # needs to loop  4 times do
   input = ""
   while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts ("To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
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
        list_genre
      when "play song"
        play_song
    end
 end

 def list_songs
   #puts all songs -- not hard-coded, numbered list, alphabetized
 end

 def list_artists
   #puts all artists-- numbered, not hard-coded
 end

 def list_genres
   # same, numbered list, alphabetical order
 end

 def list_songs_by_artist
 end

end
