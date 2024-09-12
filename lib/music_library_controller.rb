require 'pry'
class MusicLibraryController
  attr_reader :music_library
  
  def initialize(path = "./db/mp3s")
    @music_libary = MusicImporter.new(path).import # Somehow, this doesn't need to be an instance variable for the program to work, but I'll save it anyway.
  end
  
  def call
    loop do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      
      case gets.strip
      when "exit"
        break 
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist 
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      else
        puts "Sorry. That is not a valid command."
      end
    end
  end
  
  def list_songs 
    # They want these songs printed off in alphabetical order by song name...
    
    i = 0
    self.sort_music_files_by_song_name.each do |song|
      i += 1
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    i = 0 
    
    self.get_all_names_of(Artist).each do |artist_name|
      i += 1 
      puts "#{i}. #{artist_name}"
    end
  end
  
  def list_genres
    i = 0 
    
    self.get_all_names_of(Genre).each do |genre_name|
      i += 1 
      puts "#{i}. #{genre_name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_by_name(gets.strip)
    
    unless artist.nil?
      i = 0
      
      self.get_and_sort_songs_by_song_name(artist).each do |song|
        i += 1 
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets.strip)
    
    unless genre.nil?
      i = 0
      
      self.get_and_sort_songs_by_song_name(genre).each do |song|
        i += 1 
        puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i 
    
    if song_number.between?(1, Song.all.size)
      chosen_song = self.sort_music_files_by_song_name[song_number - 1]
      puts "Playing #{chosen_song.name} by #{chosen_song.artist.name}"
    end
  end
  
  # Helper methods -------------------------------------------------------------------
  
  def sort_music_files_by_song_name
    Song.all.sort_by{|song| song.name}
    
    #self.split_files_at(/\s\-\s|.mp3/).sort_by{|file| file[1]}.collect{|file| file.join(" - ")}
  end
  
  def get_all_names_of(klass)
    klass.all.collect{|instance| instance.name}.sort
  end
  
  def get_and_sort_songs_by_song_name(object)
    object.songs.sort_by{|song| song.name}
  end
  
  #def get_genre_names
  #  Genre.all.collect{|genre| genre.name}.sort 
  #end 
  
  #def get_and_sort_songs_by_genre(genre)
  #  genre.songs.sort_by{|song| song.name}
  #end
  
  #def split_files_at(reg_exp)
  #  # Split the song files at the given reg_exp, then return a collection of them.
  #  self.music_files.collect{|file| file.split(reg_exp)}
  #end
  
  #def collect_song_names
  #  Song.all.collect{|song| song.name}.sort
  #  self.music_library.collect{|song| song.name}.sort
  #end 
end