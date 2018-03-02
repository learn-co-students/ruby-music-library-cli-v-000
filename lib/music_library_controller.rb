require 'pry'
class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import

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

    user_input = gets.chomp
    if user_input == "list songs"
      self.list_songs
    elsif user_input == "list artists"
      self.list_artists
    elsif user_input == "list genres"
      self.list_genres
    elsif user_input == "list artist"
      self.list_songs_by_artist
    elsif user_input == "list genre"
      self.list_songs_by_genre
    elsif user_input == "play song"
      self.play_song
    elsif user_input == "exit"
      nil
    else 
      3.times do
        user_input = gets.chomp
      end
    
    end
    
   
  end
    
    
  def list_songs
    sorted_songs = Song.all.sort do |a, b|
      a.name <=> b.name
    end

    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort do |a, b|
      a.name <=> b.name
    end

    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end

  end

  def list_genres
    sorted_genres = Genre.all.sort do |a, b|
      a.name <=> b.name
    end

    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    sorted_songs = Song.all.sort do |a, b|
      a.name <=> b.name
    end
    number = 1
    sorted_songs.each do |song|
      if song.artist.name == user_input
        puts "#{number}. #{song.name} - #{song.genre.name}"
        number +=1
      else
        nil
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    sorted_songs = Song.all.sort do |a, b|
      a.name <=> b.name
    end
    number = 1
    sorted_songs.each do |song|
      if song.genre.name == user_input
        puts "#{number}. #{song.artist.name} - #{song.name}"
        number +=1
      else
        nil
      end
    end
  end

  def play_song
    sorted_songs = Song.all.sort do |a, b|
      a.name <=> b.name
    end
    puts "Which song number would you like to play?"
    user_input = gets.chomp
    input = user_input.to_i

    if input > 0 && input < sorted_songs.size
      index = input - 1
      song_object = sorted_songs[index]
          puts "Playing #{song_object.name} by #{song_object.artist.name}"
    else
      nil
    end
  end
   
   
  
end
