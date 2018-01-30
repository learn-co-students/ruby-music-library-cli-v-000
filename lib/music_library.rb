class MusicLibraryController

  attr_accessor :path

def initialize(path = "./db/mp3s")
  @path = path
  MusicImporter.new(path).import
end 

def call
  puts "Welcome to music Library"
  input = ""
  while input != "exit"
    puts "input?"
    input = gets.chomp
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists 
      elsif input == "list genres"
        list_genres
      elsif input == "play song"
        play_song
      elsif input == "list artist"
        list_artist_songs
      elsif input == "list genre"
        list_genres_songs
      end     
  end 
end 

def list_songs
  Song.all.each.with_index(1) { |song, idx| puts "#{idx}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
end

def list_artists
   Artist.all.each.with_index(1) do |a, i|
     puts "#{i}. #{a.name}"
   end
end

def list_genres
  Genre.all.each.with_index(1) do |g, i|
    puts "#{i}. #{g.name}"
  end
end

def play_song
  puts "What song would you like to play?"
  input = gets.chomp
  song = Song.all[input.to_i-1]
  puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
end 

def list_artist_songs
   puts "What artist by name you like to list songs for?"
   input = gets.chomp
   artist = Artist.find_by_name(input)
     artist.songs.each do |song|
       puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
 end

 def list_genres_songs
    puts "What genres you like to list songs for?"
    input = gets.chomp
    genre = Genre.find_by_name(input)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
 
end