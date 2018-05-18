class MusicLibraryController 
  attr_accessor :input
  
  def initialize(path = './db/mp3s')
    new_import = MusicImporter.new(path) 
    new_import.import
  end
  
  def call 
    input = nil 
    until input == "exit" 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets
    end
  end
  
  def list_songs
    count = 1
    az = Song.all.sort_by {|s| s.name}
    az.each {|obj| puts "#{count}. #{obj.artist.name} - #{obj.name} - #{obj.genre.name}"
      count += 1}
  end 
  
  def list_artists
    count = 1
    az = Artist.all.sort_by {|obj| obj.name}
    az.each {|obj| 
      a = obj.name
      puts "#{count}. #{a}"
      count += 1}
  end
  
  def list_genres
    count = 1
    az = Genre.all.sort_by {|obj| obj.name}
    az.each {|obj| 
      g = obj.name
      puts "#{count}. #{g}"
      count += 1}
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    if Artist.find_by_name(input) 
      a = Artist.find_by_name(input)
      count = 1
      az = a.songs.sort_by {|obj| obj.name}
      az.each {|obj| puts "#{count}. #{obj.name} - #{obj.genre.name}"
        count += 1}
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    if Genre.find_by_name(input) 
      g = Genre.find_by_name(input)
      count = 1
      az = g.songs.sort_by {|obj| obj.name}
      az.each {|obj| puts "#{count}. #{obj.artist.name} - #{obj.name}"
        count += 1}
    end 
  end
  
  def play_song 
    puts "Which song number would you like to play?"
    list_songs
    input = gets
    num = input.to_i
    i = num - 1 
    array = Song.all.sort_by {|s| s.name}
    title = array[i].name
    song = Song.find_by_name(title)
      puts "Playing #{song.name} by #{song.artist.name}"
  end
end

#  learn --fail-fast

# PASSING
#    rspec spec/001_song_basics_spec.rb
#    rspec spec/002_artist_basics_spec.rb
#    rspec spec/003_genre_basics_spec.rb
#    rspec spec/004_songs_and_artists_spec.rb
#    rspec spec/005_songs_and_genres_spec.rb
#    rspec spec/006_artists_and_genres_spec.rb
#    rspec spec/007_findable_songs_spec.rb
#    rspec spec/008_findable_module_spec.rb
#    rspec spec/009_music_importer_spec.rb
#    rspec spec/010_music_library_controller_spec.rb

# IN PROGRESS
# 3 #    rspec spec/011_music_library_cli_methods_spec.rb

# AHEAD
#    rspec spec/012_music_library_cli_spec.rb
