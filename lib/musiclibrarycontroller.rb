require 'pry'
class MusicLibraryController 

def initialize(path = "./db/mp3s")
  MusicImporter.new(path).import
end

def call
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter \'list songs\'\."
  puts "To list all of the artists in your library, enter \'list artists\'\."
  puts "To list all of the genres in your library, enter \'list genres\'\."
  puts "To list all of the songs by a particular artist, enter \'list artist\'\."
   puts "To list all of the songs of a particular genre, enter \'list genre\'\."
  puts "To play a song, enter \'play song\'\."
  puts "To quit, type \'exit\'\."
  puts   "What would you like to do?"
  choice = gets
 while choice != "exit"
   if choice == "list songs"
      self.list_songs
    elsif choice == "list artists"
      self.list_artists 
    elsif choice == "list genres"
      self.list_genres
    elsif choice == "play song"
      self.play_song
    elsif choice == "list artist"
      self.list_songs_by_artist
    elsif choice == "list genre"
      self.list_songs_by_genre
    end 
   choice = gets
   end 
end
  
  
  def list_songs
    alphabetized_songs = []
    Song.all.sort_by {|song| song.name}.each {|song| alphabetized_songs << song} 
    alphabetized_songs.map.with_index do |song, index|
     puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
   alphabetized_songs
  end 
  
  def list_artists
    alphabetized_artists = []
    Artist.all.sort_by {|artist| artist.name}.each {|artist| alphabetized_artists << artist} 
    alphabetized_artists.map.with_index do |artist, index|
     puts "#{index + 1}. #{artist.name}"
   end
  end
    
    def list_genres
    alphabetized_genres = []
    Genre.all.sort_by {|genre| genre.name}.each {|genre| alphabetized_genres << genre} 
    alphabetized_genres.map.with_index do |genre, index|
     puts "#{index + 1}. #{genre.name}"
   end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist\:"
    user_entry = gets
    artists_songs = []
  user_artist = Artist.find_by_name(user_entry)
   if user_artist != nil
    user_artist.songs.sort_by{|song| song.name}.each {|song| artists_songs << song}
    artists_songs.map.with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end 
  end

def list_songs_by_genre
    puts "Please enter the name of a genre\:"
    user_entry = gets
    genre_songs = []
  user_genre = Genre.find_by_name(user_entry)
   if user_genre != nil
    user_genre.songs.sort_by{|song| song.name}.each {|song| genre_songs << song}
    genre_songs.map.with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end 
  end 
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_index = gets.strip.to_i - 1
    if song_index >= 0 && song_index <= Song.all.size - 1
      song_name = Song.all.sort_by {|song| song.name}[song_index].name
      artist_name = Song.all.sort_by {|song| song.name}[song_index].artist.name
      puts "Playing #{song_name} by #{artist_name}"
    end 
    end
  end 
  
  def cli_commands
    choice = gets 
    if choice == "list songs"
      self.list_songs 
    end 
  end 

end