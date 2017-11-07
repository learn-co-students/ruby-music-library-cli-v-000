require "pry"

class MusicLibraryController


  def initialize(path = "./db/mp3s")
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
    puts "What would you like to do?"
    input = nil
    while input != "exit"
      input = gets.strip
      if input == "list songs"
        self.list_songs
      end
      if input == "list artists"
        self.list_artists
      end
      if input == "list genres"
        self.list_genres
      end
      if input == "list artist"
        self.list_songs_by_artist
      end
      if input == "list genre"
        self.list_songs_by_genre
      end
      if input == "play song"
        self.play_song
      end
    end
  end

  def list_songs
    Song.all.sort{|a,b|a.name <=> b.name}.each_with_index {|song, index|
    puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.sort{|a,b|a.name <=> b.name}.each_with_index {|artist, index|
    puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort{|a,b|a.name <=> b.name}.each_with_index {|genre, index|
    puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.strip

    if found_artist = Artist.find_by_name(artist_input)
    found_artist.songs.sort{|a,b|a.name <=> b.name}.each_with_index do |song, index|
      puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    if found_genre = Genre.find_by_name(genre_input)
    found_genre.songs.sort{|a,b|a.name <=> b.name}.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_input = gets.strip.to_i
    if (1..Song.all.length).include?(song_input)
    song = Song.all.sort{|a,b|a.name <=> b.name}[song_input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
