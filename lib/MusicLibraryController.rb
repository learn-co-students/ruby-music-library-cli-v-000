require 'pry'
class MusicLibraryController
  
  def initialize(path="./db/mp3s")
    importing = MusicImporter.new(path)
    importing.import
  end
  
  def call
    print_choices
    input = gets.strip
    
    while input != "exit" do
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
      
      input = gets.strip
    end
    
  end
  
  def print_choices
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
  
  def list_songs
    list = Song.all.sort {|x, y| x.name <=> y.name}
    list.each_with_index do |song, number|
      puts "#{number+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    list = Artist.all.sort {|x, y| x.name <=> y.name}
    list.each_with_index do |artist, number|
      puts "#{number+1}. #{artist.name}"
    end 
  end
  
  def list_genres
    list = Genre.all.sort {|x, y| x.name <=> y.name}
    list.each_with_index do |genre, number|
      puts "#{number+1}. #{genre.name}"
    end     
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    
    if artist = Artist.find_by_name(input)
      #can combine the dots, but maybe a little harder to understand?
      artist.songs.sort{ |x, y| x.name <=> y.name }.each.with_index do |song, number|
        puts "#{number+1}. #{song.name} - #{song.genre.name}"
      end
    end
    
    #artist = Artist.find_by_name(input) #for some reason artist is nil?!
    #artist.songs.each_with_index do |song, number|
     # puts "#{number+1}. #{song.number}"
    #end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    
    if genre = Genre.find_by_name(input)
      list = genre.songs.sort {|x, y| x.name <=> y.name}
      list.each_with_index do |item, number|
        puts "#{number+1}. #{item.artist.name} - #{item.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    
    #if input <=Song.all.length && input >= 1
    #  song = Song.all.sort {|x, y| x.name <=> y.name}[input-1]    
    #end
    
    if input <=Song.all.length && input >=1
      songs = Song.all.sort {|x, y| x.name <=> y.name}
      song = songs[input-1]
    end

    #puts "Playing #{song[index+1]} by #{song[index+1].artist.name}" if song
    puts "Playing #{song.name} by #{song.artist.name}" if song
    
  end
  
end