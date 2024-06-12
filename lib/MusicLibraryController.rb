require 'pry'

 class MusicLibraryController
   attr_accessor :playlist, :imported_playlist

   def initialize(path = "./db/mp3s")
     @playlist = MusicImporter.new(path)
     @imported_playlist = @playlist.import
   end

   def call
     inputs = []
     until inputs.include?("exit")
       inputs << gets.strip
       output(inputs.last)
     end
   end

   def output(input)
     case input
     when "list songs"
         self.list_songs
       when "list artists"
         self.list_artists
       when "list genres"
         self.list_genres
       when "play song"
         self.play_song
       when "list artist"
         self.list_artist
       when "list genre"
         self.list_genre
     end
   end

   def list_songs
     #prendo tutte le canzoni e le mettoin ordine alfabetico secondo artista.
     #per ognuna di quelle canzoni stampo il nome nel formato: artista - nome - genere.
     Song.all.sort_by!{|song| song.artist.name}.each_with_index do |song, index|
       puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     end
   end

   def list_artists
     Artist.all.each {|artist| puts "#{artist.name}"}
   end

   def list_genres
     Genre.all.each {|genre| puts "#{genre.name}"}
   end

   def play_song
      puts "Enter song number : "
     input = gets.strip
     #nella mia playlist di canzoni, tra tutti i file, cerco quello con indice pari all'input -1.
     puts "Playing #{self.playlist.files[input.to_i - 1]}"
   end

   def list_artist
     puts "Enter artist name:"
     input = gets.strip
     self.playlist.files.each do |song|
       puts "#{song}" if song.split(" - ")[0] == input #posso anche usare song.include?(input).
     end
   end

   def list_genre
     puts "Enter genre:"
     input = gets.strip
     self.playlist.files.each do |song|
       puts "#{song}" if song.split(" - ")[2].gsub(".mp3", "") == input  #posso anche usare .include?(input)
     end
   end

 end
