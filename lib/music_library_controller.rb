require'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    music = MusicImporter.new(path)
    music.import

  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "What would you like to do?"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
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
    Song.sorted.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_input = gets.strip.to_i                      #song_input stores user request, adjusted for index beginning at 0.
    if song_input.between?(1, Song.all.count)         #play_song runs element if song_input is in in range 1 - collection size
      #song = Song.sorted[song_input-1] 
      song = Song.all.sort {|x,y| x.name <=> y.name}[song_input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.strip

    artist = Artist.find_by_name(artist_input)                      #artist_input is searched through all instances of artist class
      if artist                                                     #if artist variable returns truthy value, iterator is run, nil value skips each iterator.
         sorted_songs = artist.songs.sort {|a,b| a.name <=> b.name} #alphabetize songs by artist instance with sort method, stored in variable sorted_songs
         sorted_songs.each_with_index do |song, index|              #sorted_songs alphabetized instance songs to be displayed in each_with_index iterator
           puts "#{index+1}. #{song.name} - #{song.genre.name}"
         end
      end
  end

  def list_artists
    Artist.sorted.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.sorted.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end


  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    genre = Genre.find_by_name(genre_input)
      if genre
        sorted_genres = genre.songs.sort {|a,b| a.name <=> b.name}
        sorted_genres.each_with_index do |song, index|
          puts "#{index+1}. #{song.artist.name} - #{song.name}"
        end
      end
  end
end
