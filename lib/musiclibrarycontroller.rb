class MusicLibraryController 
  attr_accessor :path 
  
  def initialize(path = "./db/mp3s")
    @path = path 
    MusicImporter.new(path).import
  end
  
  def call 
    to_do = ""
    until to_do == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'." 
      puts "What would you like to do?" 
      to_do = gets.strip
      
      if to_do == 'play song'
        play_song
      elsif to_do == 'list artists'
        list_artists
      elsif to_do == 'list_artist'
        list_songs_by_artist
      elsif to_do == 'list genres'
        list_artists
      else to_do == 'list_genre'
        #list_songs_by_genre
      end
    end
  end
  
  def list_songs
    Song.all.sort_by(&:name).each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      #binding.pry
    end
  end

  def list_artists
    Artist.all.sort_by(&:name).each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort_by(&:name).each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    answer = gets.strip
    if artist = Artist.find_by_name(answer)
      artist.songs.sort_by(&:name).each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    answer = gets.strip
    if genre = Genre.find_by_name(answer)
      genre.songs.sort_by(&:name).each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?" 
    answer = gets.strip.to_i
    if Song.all.length.include?(answer)
    end
  end
end