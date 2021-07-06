class MusicLibraryController
  
  attr_accessor :path 
  
  def initialize(path = "./db/mp3s")
    @path = path 
    import_file = MusicImporter.new(path)
    import_file.import
  end 
  
  def call 
    input = ''
    until input == "exit"
    
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
    when 'list songs'
      list_songs
    when 'list artists'
      list_artists
    when 'list genres'
      list_genres 
    when 'list artist'
      list_songs_by_artist
    when 'list genre'
      list_songs_by_genre
    when 'play song' 
      play_song 
      end
    end
  end 
  
  def list_songs 
    sorted = Song.all.sort_by { |song| song.name }
    sorted.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end	    
  end
  
  def list_artists 
    sorted = Artist.all.sort_by { |artist| artist.name }
    sorted.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end 
  end 
  
  def list_genres
    sorted = Genre.all.sort_by { |genre| genre.name }
    sorted.each_with_index do |genre, index| 
      puts "#{index+1}. #{genre.name}" 
    end
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    c = 1
    sorted = Song.all.sort_by { |song| song.name }
    sorted.each do |song|
      if song.artist.name == input 
        puts "#{c}. #{song.name} - #{song.genre.name}"
        c += 1
      end
    end 
  end 
  
  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    input = gets.strip
    c = 1
    sorted = Song.all.sort_by { |song| song.name }
    sorted.each_with_index do |song|
      if song.genre.name == input 
        puts "#{c}. #{song.artist.name} - #{song.name}" 
        c += 1
      end
    end
  end 
  
  def play_song 
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort_by { |song| song.name }[input-1]
    end
    if song
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end	

end 