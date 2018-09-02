class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end
  
  def call
    request = ""
    while request != "exit"
      greeting
      request = gets.strip
      case request
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
          break
        else
        end
     end
  end
  

  def list_songs
    ordered = Song.all.sort_by(&:name)
    ordered.collect.with_index { |s,i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end
  
  # list_artists prints all artists in the music library in 
  # a numbered list (alphabetized by artist name)
  def list_artists
    Artist.all.sort_by(&:name).map.with_index { |a,i| puts "#{i+1}. #{a.name}" }
  end
  
  # list_genres prints all genres in the music library in a 
  # numbered list (alphabetized by genre name)
  def list_genres
    Genre.all.sort_by(&:name).map.with_index { |a,i| puts "#{i+1}. #{a.name}" }
  end
  
  #list_songs_by_artist prompts the user to enter an artist
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.strip
    if artist = Artist.all.find { |a| a.name == name }
      sorted_songs = artist.songs.sort_by(&:name)
      sorted_songs.each_with_index { |s,i| puts "#{i+1}. #{s.name} - #{s.genre.name}" }
    end
  end
  
  #list_songs_by_genre prints all songsby a particular genre in a numbered list (alphabetized by song name)
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets.strip
    if genre = Genre.all.find { |g| g.name == name }
      sorted = genre.songs.sort_by(&:name)
      sorted.each_with_index { |s,i| puts "#{i+1}. #{s.artist.name} - #{s.name}" }
    end
  end
      
  #"Playing Larry Csonka by Action Bronson")    
  def play_song
    puts "Which song number would you like to play?"
    song_num = gets.strip.to_i
    ordered = Song.all.sort_by(&:name)
    
    if !(ordered[song_num-1].nil?) && song_num.between?(1, Song.all.length)
      song = ordered[song_num-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
  private 
  
  def greeting
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end
  
end