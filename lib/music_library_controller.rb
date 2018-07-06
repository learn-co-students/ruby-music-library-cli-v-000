class MusicLibraryController
  attr_reader :path

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
        puts "What would you like to do?"
        4.times do
          input = gets.strip
          case
          when input == 'list songs'
            list_songs
          when input == 'list artists'
            list_artists
          when input == 'list genres'
            list_genres
          when input == 'list artist'
            list_songs_by_artist
          when input == 'list genre'
            list_songs_by_genre
          when input == 'play song'
            play_song
          when input == 'exit'
            break
          else
            puts 'invalid option, please try again'
          end
        end
  end

  def list_songs
    counter = 1
    alphabetized_songs = []
    Song.all.sort{|a, b| a.name <=> b.name}.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    counter = 1
    Artist.all.sort{|a, b| a.name <=> b.name}.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    Genre.all.sort{|a, b| a.name <=> b.name}.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.strip
    artist = Artist.find_or_create_by_name(artist_input)
    counter = 1
    artist.songs.sort{|a, b| a.name <=> b.name}.each do |artist|
      puts "#{counter}. #{artist.name} - #{artist.genre.name}"
      counter += 1
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    genre = Genre.find_or_create_by_name(genre_input)
    counter = 1
    genre.songs.sort{|a, b| a.name <=> b.name}.each do |genre|
      puts "#{counter}. #{genre.artist.name} - #{genre.name}"
      counter += 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i - 1
    alphabetized_songs = Song.all.sort{|a, b| a.name <=> b.name}
    if song_number > 0 && song_number < Song.all.size
      puts "Playing #{alphabetized_songs[song_number].name} by #{alphabetized_songs[song_number].artist.name}"
    end
  end
end
