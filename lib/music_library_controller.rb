class MusicLibraryController 
  attr_accessor :path 
  
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path).import
  end
  
  def call 
    response = ""
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    while response != "exit"
      response = gets.strip
      case response 
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
  
  def list_songs
    i = 1 
    list = Song.all.collect.sort_by {|song| song.name}
    list.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1 
    end
  end 
  
  def list_artists 
    i = 1 
    list = Artist.all.collect.sort_by {|artist| artist.name}
    list = list.collect {|artist| artist.name}
    list = list.uniq
    list.each do |artist| 
      puts "#{i}. #{artist}"
      i += 1 
    end
  end
  
  def list_genres 
    i = 1 
    list = Genre.all.collect.sort_by {|genre| genre.name}
    list = list.collect {|genre| genre.name}
    list = list.uniq 
    list.each do |genre| 
      puts "#{i}. #{genre}" 
      i += 1 
    end
  end 
  
  def list_songs_by_artist 
    i = 1 
    puts "Please enter the name of an artist:"
    response = gets.strip
    list = Artist.find_by_name(response)
    if list != nil
      list = list.songs.sort_by {|song| song.name}
      list.each do |song|
        puts "#{i}. #{song.name} - #{song.genre.name}"
        i += 1 
      end
    end
  end 
  
  def list_songs_by_genre 
    i = 1 
    puts "Please enter the name of a genre:"
    response = gets.strip
    list = Genre.find_by_name(response)
    if list != nil
      list = list.songs.sort_by {|song| song.name}
      list.each do |song|
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i += 1 
      end
    end
  end
  
  def play_song 
    list = Song.all.collect.sort_by {|song| song.name}
    response = 0 
    puts "Which song number would you like to play?"
    response = gets.strip.to_i
    if response.is_a?(Integer) 
      if response > 0 && response <= list.size
        puts "Playing #{list[response - 1].name} by #{list[response - 1].artist.name}"
      end
    end
  end
  
end 

