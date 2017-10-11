# #!/usr/bin/env ruby

 require_relative '../config/environment'

 require_relative '../lib/concerns/findable.rb'

 require_relative '../lib/artist.rb'
 require_relative '../lib/genre.rb'
 require_relative '../lib/song.rb'

 #MusicLibraryController.new.call

 #what is this file?
class MusicLibraryController


 def initialize(path='./db/mp3s')
   @path = path
   MusicImporter.import #is this right?
 end

  # file = MusicImporter.new(path)
  # import.


 def call # needs to loop  4 times do
   4 times do
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts ("To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?")
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
   puts "Please enter the name of an artist:""Please enter the name of an artist:""Please enter the name of an artist:"Please enter the name of an artist:"
 end

end
