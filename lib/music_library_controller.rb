class MusicLibraryController
  
  attr_reader :path 
  
  def initialize(path='./db/mp3s')
    @path = path 
    MusicImporter.new(@path).import 
  end
  
  def call
    input = nil 
    while input != 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp
      if input == 'list songs'
        self.list_songs 
      elsif input == 'list artists'
        self.list_artists
      elsif input == 'list genres'
        self.list_genres 
      elsif input == 'list artist'
        self.list_songs_by_artist 
      elsif input == 'list genre'
        self.list_songs_by_genre 
      elsif input == 'play song'
        self.play_song 
      end
    end
  end
 
  def list_songs
    sorted_songs = Song.all.sort{ |song, song2| song.name <=> song2.name }
    sorted_songs.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      #output format => 1. Thundercat - For Love I Come - dance
    end
  end
  
  def list_artists
    sorted_artists = Artist.all.sort{|artist, artist2| artist.name <=> artist2.name}
    sorted_artists.each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
      #output format => 1. Thundercat
    end
  end
  
  def list_genres
    sorted_genres = Genre.all.sort{|genre, genre2| genre.name <=> genre2.name}
    sorted_genres.each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
      #output format => 1. dance
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    if Artist.find_by_name(artist_name)
      artist = Artist.find_by_name(artist_name)
      sorted = artist.songs.sort{|song, song2| song.name <=> song2.name}
      
      sorted.each_with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
        #output format => "1. Green Aisles - country"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    if Genre.find_by_name(genre_name)
      genre = Genre.find_by_name(genre_name)
      sorted = genre.songs.sort{|song, song2| song.name <=> song2.name}
      
      sorted.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
        #output format => "1. Real Estate - It's Real"
      end
    end
  end
  
  def play_song
    sorted_songs = Song.all.sort{ |song, song2| song.name <=> song2.name }
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i 
    if input.between?(1, sorted_songs.size)
      puts "Playing #{sorted_songs[input - 1].name} by #{sorted_songs[input - 1].artist.name}"
    end
  end
  
  
end