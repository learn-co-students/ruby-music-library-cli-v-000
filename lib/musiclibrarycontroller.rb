class MusicLibraryController

  attr_accessor :path, :importer

  def initialize(path = "./db/mp3s")
    @path = path
    @importer = MusicImporter.new(@path)
    @importer.import
  end

  def call
     puts "Welcome to your music library!";

     inputs = [
       "list songs",
       "list artists",
       "list genres",
       "list artist",
       "list genre",
       "play song",
       "exit"
     ]

     input = "";

     until input == "exit" do
       puts "To list all of your songs, enter 'list songs'."
       puts "To list all of the artists in your library, enter 'list artists'."
       puts "To list all of the genres in your library, enter 'list genres'."
       puts "To list all of the songs by a particular artist, enter 'list artist'."
       puts "To list all of the songs of a particular genre, enter 'list genre'."
       puts "To play a song, enter 'play song'."
       puts "To quit, type 'exit'."
       puts "What would you like to do?"

       input = gets.chomp

       case input
       when inputs[0]
           list_songs
         when inputs[1]
           list_artists
         when inputs[2]
           list_genres
         when inputs[3]
           list_songs_by_artist
         when inputs[4]
           list_songs_by_genre
         when inputs[5]
           play_song
       end
     end
   end

end
