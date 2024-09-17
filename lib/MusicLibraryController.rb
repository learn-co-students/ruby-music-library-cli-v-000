class MusicLibraryController
  attr_accessor :path, :song, :artist, :genre, :songs

  def initialize(path = "./db/mp3s")
    @path = MusicImporter.new(path)
    @path.import
    
    
  end

   def call
     loop do
       puts "Please enter: 'list songs', 'list artists', 'list genres', 'play song', 'list artist', 'list genre', 'exit' "
       input = gets.chomp.downcase
         case
         when input == "list songs"
           list_songs
         when input == "list artists"
           list_artists
         when input == "list genres"
           list_genres
         when input == "play song"
           list_play
         when input == "list artist"
           list_artist_songs
         when input == "list genre"
           list_genre_songs
         end
       
     break if input == "exit"
     end
 
   end
 
   def list_songs
    Song.all.each_with_index do |x, i|
     puts "#{i+1}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
     end
   end 
 
   def list_artists
     Song.all.each_with_index {|x, i| puts "#{i+1}. #{x.artist.name}"}
   end
 
   def list_genres
     Song.all.each_with_index {|x, i| puts "#{i+1}." " #{x.genre.name}"}
   end
 
   def list_play
     puts "Enter a number to play song choice:"
     number = gets.to_i-1
     puts "Playing #{Song.all[number].artist.name} - #{Song.all[number].name} - #{Song.all[number].genre.name}"
   end
 
   def list_artist_songs
     puts "Enter artist for a list of songs:"
       input = gets.chomp
       Artist.all.each do |a|
         if a.name == input
           a.songs.each do |x|
             puts "#{x.artist.name} - #{x.name} - #{x.genre.name}"
           end
        end
     end
   end
 
   def list_genre_songs
     puts "Enter genre for a list of songs:"
       input = gets.chomp
       Genre.all.each do |g|
         if g.name == input
           g.songs.each do |x|
             puts "#{x.artist.name} - #{x.name} - #{x.genre.name}"
           end
        end
     end
   end



end