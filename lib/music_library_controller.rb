require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
     puts "Hello and welcome to the music library."
     input = gets.strip
     if input == "list songs"
       list_songs
     end
     if input == "list artists"
       list_artists
     end
     if input == "list genres"
       list_genres
     end
     if input == "play song"
       play_song
     end
     if input == "list genre"
       list_genre
     end
     if input == "list artist"
       list_artist
     end
    end
  end

  def list_songs
    sorted_songs = Song.all.collect{|s| "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
    sorted_songs.sort.each.with_index {|s, i|
      puts "#{i + 1}. " + s
      }
    end

  def list_artists
    Artist.all.each.with_index {|a, i|
    puts "#{i + 1}. #{a.name}"}
  end

  def list_genres
    Genre.all.each.with_index {|g, i|
    puts "#{i + 1}. #{g.name}"}
  end

  def play_song
    song_number = gets.strip
    song = Song.all[song_number.to_i + 2]  #brute force because Song.all is in a different order.
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_genre
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each.with_index { |s, i|
        puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      }
    end
  end

  def list_artist
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each.with_index { |s,i|
        puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      }
    end
  end

end
