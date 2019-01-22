class MusicLibraryController 
  extend Concerns::Findable 
  def initialize(path='./db/mp3s')
    @path = path
    mi = MusicImporter.new(path)
    mi.import
  end
  
  def call
    music_lib_controller = ""
    until music_lib_controller == "exit"
    
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    music_lib_controller = gets.strip
    end
  end
  
  def list_songs
   arr = Song.all.sort do |a, b|
      a.name <=> b.name
    end
      counter = 0
        arr.each do |i|
          counter += 1 
            puts "#{counter}. #{i.artist.name} - #{i.name} - #{i.genre.name}"
        end
    end
  
  def list_artists
    arr = Artist.all.sort do |a, b|
      a.name <=> b.name
    end
      counter = 0
        arr.each do |i|
          counter += 1 
            puts "#{counter}. #{i.name}"
        end
  end

  def list_genres
    arr = Genre.all.sort do |a, b|
      a.name <=> b.name
    end
    counter = 0 
    arr.each do |i|
      counter += 1 
      puts "#{counter}. #{i.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    u_input = gets.strip
    artist = Artist.find_by_name(u_input)
    if artist != nil 
      counter = 0
      artist.songs.sort{|a,b| a.name <=> b.name }.each do |i|
      counter += 1 
      puts "#{counter}. #{i.name} - #{i.genre.name}" 
     end   
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    u_input = gets.strip
    genre = Genre.find_by_name(u_input)
    if genre != nil 
      counter = 0 
      genre.songs.sort{|a,b| a.name <=> b.name}.each do |i|
        counter += 1 
        puts "#{counter}. #{i.artist.name} - #{i.name}"
      end
    end
  end
  
  
  def play_song
    puts "Which song number would you like to play?"
    self.list_songs
    u_input = gets.strip.to_i-1
    if u_input != nil 
      the_song = list_songs[u_input]
        puts "Playing #{the_song.name} by #{the_song.artist.name}"

    end
 
 
  end
  
end




