class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end
  
  def call 
     puts "Welcome to your music library!"
     puts "To list all of your songs, enter 'list songs'."
     puts "To list all of the artists in your library, enter 'list artists'."
     puts "To list all of the genres in your library, enter 'list genres'."
     puts "To list all of the songs by a particular artist, enter 'list artist'."
     puts "To list all of the songs of a particular genre, enter 'list genre'."
     puts "To play a song, enter 'play song'."
     puts "To quit, type 'exit'."
     input = nil 
     until input == 'exit'
      puts "What would you like to do?"
      input = gets.strip
      case input
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
    unsorted_songs = Song.all 
    sorted_songs = unsorted_songs.sort_by{ |song| song.name}
    number = 1 
    sorted_songs.each do |song|
      puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      number += 1
    end
    sorted_songs 
  end
  
  def list_artists
    unsorted_artists = Artist.all
    sorted_artists = unsorted_artists.sort_by{ |artist| artist.name}
    number = 1 
    sorted_artists.uniq.each do |artist|
      puts "#{number}. #{artist.name}" 
      number += 1
    end 
  end
  
  def list_genres
    unsorted_genres = Genre.all
    sorted_genres = unsorted_genres.sort_by{ |genre| genre.name}
    number = 1 
    sorted_genres.uniq.each do |genre|
      puts "#{number}. #{genre.name}" 
      number += 1
    end 
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_string = gets
    artist = Artist.find_by_name(artist_string)
    if artist != nil 
      artist_songs = artist.songs.sort_by{|song| song.name}
      number = 1
      artist_songs.each do |song|
        puts "#{number}. #{song.name} - #{song.genre.name}"
        number += 1 
      end 
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_string = gets
    genre = Genre.find_by_name(genre_string)
    if genre != nil 
      genre_songs = genre.songs.sort_by{|song| song.name}
      number = 1 
      genre_songs.each do |song|
        puts "#{number}. #{song.artist.name} - #{song.name}"
        number += 1 
      end
    end 
  end
  
  def play_song
    puts "Which song number would you like to play?"
    unsorted_songs = Song.all 
    sorted_songs = unsorted_songs.sort_by{ |song| song.name}
    song_number = gets
    song_number = song_number.to_i
    if song_number.is_a? Integer 
      if song_number > 0 && song_number <= sorted_songs.length
        puts "Playing #{sorted_songs[song_number - 1].name} by #{sorted_songs[song_number - 1].artist.name}"
      end 
    end 
  end
  
end 