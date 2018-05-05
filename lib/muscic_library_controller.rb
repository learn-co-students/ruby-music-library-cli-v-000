require 'pry'

class MusicLibraryController

  def initialize(file_path = './db/mp3s')
    @path = file_path
    music_importer_instance = MusicImporter.new(@path)
    music_importer_instance.import
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
    puts "What would you like to do?"

    input = gets.strip

    if  input == 'list songs'
      self.list_songs
    elsif input == 'list artists'
      self.list_artists
    elsif input == 'list genres'
      self.list_genres
    elsif input == 'list artist'
      self.list_songs_by_artist
    elsif input == 'list genre'
      self.list_songs_by_genre
    elsif input == 'play song'
      self.play_song
    else
      input
    end

    until gets.strip == 'exit'
      input
    end

  end

  def list_songs
    i = 0
    alphabetized_song_instances = Song.all.sort {|a, b| a.name <=> b.name}
    alphabetized_song_instances.each do |song_instance|
      puts "#{i+=1}. #{song_instance.artist.name} - #{song_instance.name} - #{song_instance.genre.name}"
    end
  end

  def list_artists
    i = 0
    alphabetized_artist_instances = Artist.all.sort {|a, b| a.name <=> b.name}
    alphabetized_artist_instances.each do |artist_instance|
      puts "#{i+=1}. #{artist_instance.name}"
    end
  end

  def list_genres
    i = 0
    alphabetized_genre_instances = Genre.all.sort {|a, b| a.name <=> b.name}
    alphabetized_genre_instances.each do |genre_instance|
      puts "#{i+=1}. #{genre_instance.name}"
    end
  end

  def list_songs_by_artist
    i = 0
    puts "Please enter the name of an artist:"
    artist = gets
    artist_instance = Artist.find_or_create_by_name(artist)
    alphabetized_song_instances = artist_instance.songs.sort {|a, b| a.name <=> b.name}
    alphabetized_song_instances.each do |song_instance|
      puts "#{i+=1}. #{song_instance.name} - #{song_instance.genre.name}"
    end
  end

  def list_songs_by_genre
    i = 0
    puts "Please enter the name of a genre:"
    genre = gets
    genre_instance = Genre.find_or_create_by_name(genre)
    alphabetized_genre_instances = genre_instance.songs.sort {|a, b| a.name <=> b.name}
    alphabetized_genre_instances.each do |song_instance|
      puts "#{i+=1}. #{song_instance.artist.name} - #{song_instance.name}"
    end
  end




  def play_song

    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i

    if song_number < Song.all.sort {|a, b| a.name <=> b.name}.length and song_number > 0
      song_instance = Song.all.sort {|a, b| a.name <=> b.name}[song_number-1]
    end
    if song_instance
      puts "Playing #{song_instance.name} by #{song_instance.artist.name}"
    end
  end



end
