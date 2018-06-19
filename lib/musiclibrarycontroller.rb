class MusicLibraryController

attr_accessor :path

def initialize(path = './db/mp3s')
  @path = path
  import_object = MusicImporter.new(path)
  import_object.import
end



def call
  response = ""
  while response != "exit"
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
  puts "To list all of the genres in your library, enter 'list genres'."
  puts "To list all of the songs by a particular artist, enter 'list artist'."
  puts "To list all of the songs of a particular genre, enter 'list genre'."
  puts "To play a song, enter 'play song'."
  puts "To quit, type 'exit'."
  puts "What would you like to do?"
  response = gets.strip
  case response
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
  end
  end
end

def list_songs
sorted_songs = Song.all.sort{|a,b| a.name <=> b.name}
counter = 0
sorted_songs.each do |song|
  puts "#{counter += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
end
end

def list_artists
  sorted_artist = Artist.all.sort{|a,b| a.name <=> b.name}
  counter = 0
  sorted_artist.each do |artists|
     puts "#{counter += 1}. #{artists.name}"
  end
end

def list_genres
  sorted_genres = Genre.all.sort{|a,b| a.name <=> b.name}
  counter = 0
  sorted_genres.each do |genres|
    puts "#{counter += 1}. #{genres.name}"
  end
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  response = gets.strip
  located_artist = Artist.find_by_name(response)
    if located_artist
      songs_array = located_artist.songs
      songs_array.sort {|a,b| a.name <=> b.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
    end
  end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  response = gets.strip
  located_genre = Genre.find_by_name(response)
    if located_genre
      songs_array = located_genre.songs
      songs_array.sort {|a,b| a.name <=> b.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
    end
  end

def play_song
  puts "Which song number would you like to play?"
  response = gets.strip.to_i
  if (1..Song.all.length).include?(response)
    song = Song.all.sort{|a,b| a.name <=> b.name}[response-1]
  end
  #.each do |song|
  #  if response == song.name
  if song
     puts "Playing #{song.name} by #{song.artist.name}"

  end
  # end
end

end
