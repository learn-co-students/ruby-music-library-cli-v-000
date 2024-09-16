class MusicLibraryController
  attr_accessor :path 
  def initialize(path = "./db/mp3s")
    @path = path 
    new = MusicImporter.new(path)
    new.import
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
      when "exit"
        return
    end
    call
  end
  
  def list_songs
    list = Song.all.sort {|a,b| a.name <=> b.name}
    list.each.with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
  end
  
  def list_artists
    list = Artist.all.sort {|a,b| a.name <=> b.name}
    list.each.with_index do |artist, i|
     puts "#{i+1}. #{artist.name}"
   end
   end
   
   def list_genres
    list = Genre.all.sort {|a,b| a.name <=> b.name}
    list.each.with_index do |genre, i|
     puts "#{i+1}. #{genre.name}"
   end
   end
   
   def list_songs_by_artist
     puts "Please enter the name of an artist:"
     name = gets.strip
     artist = Artist.find_by_name(name)
     if !artist.nil?
     list = artist.songs.sort {|a,b| a.name <=> b.name}
     list.each.with_index do |song, i| 
       puts "#{i+1}. #{song.name} - #{song.genre.name}"
      end
     end
   end
   
   def list_songs_by_genre
     puts "Please enter the name of a genre:"
     name = gets.strip
     genre = Genre.find_by_name(name)
     if !genre.nil?
     list = genre.songs.sort {|a,b| a.name <=> b.name}
     list.each.with_index do |song, i| 
       puts "#{i+1}. #{song.artist.name} - #{song.name}"
      end
     end
   end
   
   def play_song
     puts "Which song number would you like to play?"
     song_number = gets.strip.to_i 
     list = Song.all.sort {|a,b| a.name <=> b.name}
     if song_number >= 1 && song_number <= Song.all.count
       list.each_with_index do |song,index|
         if (index + 1) == song_number
           puts "Playing #{song.name} by #{song.artist.name}"
          end
        end
    end 
  end

end