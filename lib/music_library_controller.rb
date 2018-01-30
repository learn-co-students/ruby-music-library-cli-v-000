class MusicLibraryController


def initialize(path="./db/mp3s")
  importer = MusicImporter.new(path)
  importer.import
  
end

def call
  input = "" 
  while input != "exit"
    puts "Welcome to your Music Vault!"
    puts "How would you like to do?"
    input = gets.strip
    case input
    when "list songs"
      songs  
    when "list artists" 
      artists 
    when "list genres"
      genres
    when "list artist"
      list_artist
    when "list genre"
      list_genre
    when "play song"
      play_song
    end
  end
end

def artists
  Artist.all.each.with_index(1) do |i, a| 
  print "#{i}. #{a}"
 end
end

def genres
  Genre.all.each.with_index(1) do |i, g| 
 print "#{i}. #{g} "
 end
end

# def songs
#   Songs.all.each_with_index(1) do |s, i|
#     puts "#{i}. #{s}"
#   end 
# end

def list_artist
  puts "What artist by name do you want to list songs for?"
  artist_input = gets.strip
  if artist = Artist.find_by_name(artist_input)
    artist.songs.each do |s,i|
      puts "#{i}. #{s}"
    end
  end
end

def list_genre
  puts "What genre by name do you want to list songs for?"
  genre_input = gets.strip
  if genre = Genre.find_by_name(genre_input)
    genre.songs.each do |s,i|
      puts "#{i}. #{s}"
    end
  end
end

def play_song
  puts "What song number would you like to play?"
  song_input = gets.strip
  puts "Playing #{Song.all[song_input.to_i-1]}"
  
end 


def songs
  Song.all.each.with_index(1) do |s,i|
    puts "#{i}. #{s}"
  end 
end


end#class