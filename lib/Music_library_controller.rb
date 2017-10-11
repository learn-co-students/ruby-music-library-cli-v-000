require 'pry'
class MusicLibraryController
  extend Concerns::Findable

 def initialize(path="./db/mp3s")
    MusicImporter.new(path).import

 end

 def call

      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip


    case input
      when "list songs"
        list_songs
        call
      when "list artists"
         list_artists
         call
      when "list genres"
         list_genres
         call
      when "list artist"
       list_songs_by_artist
       call
      when "list genre"
        list_songs_by_genre
        call
      when "play song"
        play_song
        call
      when "exit"
        
      else
        puts "try again"
        call
    end
 end

 def list_songs

    Song.all.sort_by{|song| song.name}.each_with_index do |song, i|
    puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
 end

 def list_artists
   Artist.all.sort_by{|artist| artist.name}.each_with_index do |artist, i|
   puts "#{i + 1}. #{artist.name}"
   end
 end

 def list_genres
   Genre.all.sort_by{|genre| genre.name}.each_with_index do |genre, i|
     puts "#{i + 1}. #{genre.name}"
   end
 end

 def list_songs_by_artist
   puts "Please enter the name of an artist:"
   input = gets.strip
# binding.pry
#confused -- the input has the artist's name -- so how do I call Artist.songs?
   if artist =  Artist.find_by_name(input)
     #find Artist.songs -- how?
    artist.songs.sort_by{|song| song.name}.each_with_index do |song, i|
       puts "#{i + 1}. #{song.name} - #{song.genre.name}"
     end
   end
 end

 def list_songs_by_genre

   puts "Please enter the name of a genre:"
   input = gets.strip #why isn't this input working?

   genre = Genre.find_by_name(input)
   if genre
     genre.songs.sort_by{|song| song.name}.each_with_index do |song, i|
       puts "#{i+ 1}. #{song.artist.name} - #{song.name}"
     end
   end
 end

 def play_song
   puts "Which song number would you like to play?"
   input = gets.strip.to_i

   if input.between?(1, Song.all.length)
     song = Song.all.sort_by{|song| song.name}[input - 1]

     puts "Playing #{song.name} by #{song.artist.name}"
   end
 end

end
