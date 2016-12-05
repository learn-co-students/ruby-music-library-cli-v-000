require 'pry'

class MusicLibraryController

  def initialize(path =  "./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    input = " "
    while input != "exit"
    puts "Welcome to Your Music Library!"
    puts "What would you like to do?"
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
   Artist.all.each_with_index do |a, i|
     puts "#{i+1}. #{a.name}"
   end
 end

 def genres
   Genre.all.each_with_index do |g, i|
     puts "#{i+1}. #{g.name}"
   end
 end

 def list_artist
  puts "What's the artist you want to see?"
  artist_input = gets.strip
  if artist = Artist.find_by_name(artist_input)
    artist.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
 end
end


 def list_genre
    puts "What genre by name would you like to list songs for?"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip.to_i
    my_song = Song.all[song_input - 1]
    puts "Playing #{my_song.artist.name} - #{my_song.name} - #{my_song.genre.name}"
  end

 def list_genres_songs
   puts "What genre would you like to see?"
   genre_input = gets.strip
   genre = Genre.find_by_name(genre_input)
   genre.songs.each do |song|
     puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
 end


  def songs
    Song.all.each_with_index do |s, i|
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

end
