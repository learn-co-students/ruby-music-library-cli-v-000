require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

 def call
    input = ""
  while input != "exit"
      input = gets.strip
    case input

      when "list songs"
       list_songs
      when "list artists"
       list_artists
      when "list genres"
      list_genres
      when "play song"
      play_song
      when "list artist"
      list_artist_songs
      when "list genre"
      list_genre_songs
    end
  end
end


  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end


  def list_artists

    Artist.all.each.with_index do |a, i|
      puts "#{i+1}. #{a.name}"
      end
  end

  def list_genres
     Genre.all.each.with_index do |g, i|
      puts "#{i+1}. #{g.name}"
      end
  end



  def play_song
    puts "Enter the song number:"
    inp_song = gets.strip
    request = Song.all[inp_song.to_i-1]
    puts "Playing #{request.artist.name} - #{request.name} - #{request.genre.name}"
  end

  def list_artist_songs
    puts "Enter the artist's name to list their song:"
    artist_inp = gets.strip

    if artist = Artist.find_by_name(artist_inp)
      artist.songs.each do |s|
         artist_song = s.name

       artist.genres.each do |g|
         genre_name = g.name

        puts "#{artist.name} - #{artist_song} - #{genre_name}"
      end
    end
  end
  end


  def list_genre_songs
    puts "Enter the genre to list their song:"
    genre_inp = gets.strip

     if genre = Genre.find_by_name(genre_inp)
      genre.songs.each do |s|
         genre_song = s.name

       genre.artists.each do |a|
         artist_name = a.name

        puts "#{artist_name} - #{genre_song} - #{genre.name}"
      end
    end
  end
  end



end