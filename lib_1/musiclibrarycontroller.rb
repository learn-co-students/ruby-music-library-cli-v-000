class MusicLibraryController
  
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    musicimporter =  MusicImporter.new(path)
    musicimporter.import
  end 
  
  # def call
  #   p 'Welcome to your music library!'
  #   answer = ''
  #     while answer != gets.chomp
  #       loop { puts '"To list all of your songs, enter 'list songs''}
  #       break if 
        
  #     end  
  # end
  
  
  def call
     answer = gets.strip

     if answer != exit

     puts "Welcome to your music library!"
     puts "To list all of your songs, enter 'list songs'."
     puts "To list all of the artists in your library, enter 'list artists'."
     puts "To list all of the genres in your library, enter 'list genres'."
     puts "To list all of the songs by a particular artist, enter 'list artist'."
     puts "To list all of the songs of a particular genre, enter 'list genre'."
     puts "To play a song, enter 'play song'."
     puts "To quit, type 'exit'."
     puts "What would you like to do?"

     case answer
         when "list songs"
           list_songs
         when "list artists"
           list_artists
         when "list genres"
           list_genres
         when "list artist"
           list_songs_by_artist
         when "list genre"
           list_songs_by_genre
         when "play song"
           play_song
         end
     end
   end
end