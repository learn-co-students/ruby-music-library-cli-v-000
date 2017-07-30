class MusicLibraryController

  attr_reader :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
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
    input = gets.chomp
    while input != "exit"
      input = gets.chomp
    end
  end

  def list_songs
    songs_a_to_z = Song.all.sort_by {|song| song.name}
    songs_a_to_z = songs_a_to_z.uniq
    songs_a_to_z.each_with_index { |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    }
    #binding.pry
  end

  def list_artists
    artists_a_to_z = Artist.all.sort_by {|artist| artist.name}
    artists_a_to_z.each_with_index { |artist, index|
      puts "#{index + 1}. #{artist.name}"
    }
    #binding.pry
  end

  def list_genres
    genres_a_to_z = Genre.all.sort_by {|genre| genre.name}
    genres_a_to_z.each_with_index { |genre, index|
      puts "#{index + 1}. #{genre.name}"
    }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist_to_list_songs_object = Artist.all.find {|artist| artist.name == input}
    unless artist_to_list_songs_object == nil
        artist_song_array = artist_to_list_songs_object.songs.sort_by {|song| song.name}
        artist_song_array.each_with_index { |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre_to_list_songs_object = Genre.all.find {|genre| genre.name == input}
      unless genre_to_list_songs_object == nil
        genre_song_array = genre_to_list_songs_object.songs.sort_by {|song| song.name}
        genre_song_array.each_with_index { |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        }
      end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp
    songs_a_to_z = Song.all.sort_by {|song| song.name}
    songs_a_to_z = songs_a_to_z.uniq
    song_to_play = songs_a_to_z[input.to_i - 1]
      unless input.to_i < 1 || input.to_i > songs_a_to_z.length
    #binding.pry
      puts "Playing #{song_to_play.name} by #{song_to_play.artist.name}"
      end
  end

end
