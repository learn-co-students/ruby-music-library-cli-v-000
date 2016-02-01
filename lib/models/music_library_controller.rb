class MusicLibraryController
  attr_reader :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
   input = ""
   while input != "exit"
     puts "What would you like to do?"
     puts "Options: list songs, list artists, list genres, play song, list artist, list genre, and exit" 
     input = gets.strip
     case input 
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres 
      when "play song"
        play_song
        puts "plays song"
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end 
    end

  end

      # list all songs
  def list_songs
    Song.all.each_with_index do|v, i| 
      i += 1 
      puts "#{i}. #{v.artist.name} - #{v.name} - #{v.genre.name} "
    end
  end
     # list all artists
  def list_artists
    Artist.all.each{|a| puts "#{a.name}"}
  end
     # list all genres
  def list_genres
    Genre.all.each{|g| puts "#{g.name}"}
  end
     # play a song - random?
  def play_song
    puts "Choose a song to play"
    song_number = gets.strip.to_i-1
    song = Song.all[song_number]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

     # list artist
  def list_artist
    puts "What artist's songs would you like to see?"
    artist_input = gets.to_s.strip
    song_array = Song.all.find_all { |a| a.artist.name == artist_input }
    song_array.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}    
  end
     # list genre
  def list_genre
    puts "What genre's songs would you like to see?"
    genre_input = gets.to_s.strip
    genre_array = Song.all.find_all { |g| g.genre.name == genre_input }
    genre_array.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}    
  end

end