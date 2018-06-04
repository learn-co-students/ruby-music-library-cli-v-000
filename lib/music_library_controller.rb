class MusicLibraryController 
  attr_accessor :song_array
  
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
    @song_array = []
    Song.all.each do |song| 
    @song_array << [song.artist.name, song.name, song.genre.name]
    end
    @song_array.sort_by!{|s| s[1]}
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
    
    until input == "exit"
    input
    if input == "list songs"
      list_songs
      input = gets.strip
    elsif input == "list artists"
      list_artists
      input = gets.strip
    elsif input == "list genres"
      list_genres
      input = gets.strip
    elsif input == "list artist"
      list_songs_by_artist
      input = gets.strip
    elsif input == "list genre"
      list_songs_by_genre
      input = gets.strip
    elsif input == "play song"
      play_song
      input = gets.strip
    else
      puts "What would you like to do?"
      input = gets.strip
    end 
  end
end 
  
  
  def list_songs
    @song_array.each_with_index do |s,i|
      puts "#{i+1}. #{s[0]} - #{s[1]} - #{s[2]}"
    end 
  end 
  
  def list_artists
    array = Artist.all.collect{|a| a.name}
    array.sort! 
    array.each_with_index{|a, i| puts "#{i+1}. #{a}"}
  end 
  
  def list_genres
    array = Genre.all.collect{|a| a.name}
    array.sort! 
    array.each_with_index{|a, i| puts "#{i+1}. #{a}"}
  end 
    
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    song_array = []
    Song.all.each do |song|
     if song.artist.name == input
        song_array << "#{song.name} - #{song.genre.name}"
      end 
    end 
    song_array.sort!
    song_array.each_with_index do |a, i| 
      puts "#{i+1}. #{a}"
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
     song_array = []
    Song.all.each do |song|
      if song.genre.name == input
        song_array << [song.name, song.artist.name]
      end 
    end 
    song_array.sort_by!{|s| s[0]}
    song_array.each_with_index do |a, i| 
      puts "#{i+1}. #{a[1]} - #{a[0]}"
    end 
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    if (1..@song_array.length).include?(input.to_i) 
      puts "Playing #{@song_array[(input.to_i-1)][1]} by #{@song_array[input.to_i-1][0]}"
    else 
      nil
  end
  end 
  
  
end 
