class MusicLibraryController

  def initialize(path= './db/mp3s')
    MusicImporter.new(path).import
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
    
    action = gets.chomp
    
    while action != "exit"
      if action == "list songs"
        list_songs
      elsif action == "list artists"
       list_artists
      elsif action == "list genres"
        list_genres
      elsif action == "list artist"
        list_songs_by_artist
      elsif action == "list genre"
        list_songs_by_genre
      elsif action == "play song"
        play_song
     end 
    
    action = gets.chomp
    end
  end 
  
  def list_songs
    formatter(Song)
  end 

  def list_artists
      formatter(Artist)
  end 
  
  def list_genres
    formatter(Genre)
  end 
 
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    if Artist.find_by_name(artist_name)
      artist = Artist.find_by_name(artist_name)
      artist_songs = artist.songs.sort_by{|song|song.name}
      artist_songs.collect! {|song| "#{song.name} - #{song.genre.name}"}
      artist_songs.each_with_index {|song, index| puts "#{index + 1}. " + song}
    else
      false
    end
  end
  
   def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.chomp
    if Genre.find_by_name(genre_name)
      genre = Genre.find_by_name(genre_name)
      genre_songs = genre.songs.sort_by{|song|song.name}
      genre_songs.collect! {|song| "#{song.artist.name} - #{song.name}"}
      genre_songs.each_with_index {|song, index| puts "#{index + 1}. " + song}
    else
      false
    end
  end
    

  def play_song 
    puts "Which song number would you like to play?"
    song_choice = gets.chomp
    index_choice = song_choice.to_i - 1
    if index_choice.between?(0, Song.all.length - 1)
      alphabetize(Song).each_with_index do |song, index|
        if index == index_choice 
          puts "Playing #{song.name} by #{song.artist.name}"
        end 
      end 
    end
  end  
    
  
  def alphabetize(input) 
    input.all.sort_by{|sorted|sorted.name}
  end 
  
  def formatter(class_name)
    alphabetize(class_name).each_with_index do |title, index|
      if class_name != Song
        puts "#{index +1}. #{title.name}"
      else
        puts "#{index + 1}. #{title.artist.name} - #{title.name} - #{title.genre.name}"
      end 
    end 
 end 
 
 
end 

  


