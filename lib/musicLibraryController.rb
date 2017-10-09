class MusicLibraryController

  #attr_accessor :alphabetized_songs

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
    #@alphabetized_songs = []
  end

  def call
    user_input = ""
    until user_input == "exit" do
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
    end
  end

  def list_songs
    alphabetized_songs = Song.all.sort_by { |obj| obj.name }
    i = 1
    alphabetized_songs.each do |s|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      i += 1
    end
  end

  def list_artists
    alphabetized_artists = Artist.all.sort_by { |obj| obj.name }
    i = 1
    alphabetized_artists.each do |a|
        puts "#{i}. #{a.name}"
      i += 1
    end
  end

  def list_genres
    alphabetized_genres = Genre.all.sort_by { |obj| obj.name }
    i = 1
    alphabetized_genres.each do |a|
        puts "#{i}. #{a.name}"
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.all.detect { |a| a.name == input } #this drove me nuts for a while, all b/c I forgot to use == instead of =
      artist_obj = Artist.all.detect { |a| a.name == input }
      new_array = artist_obj.songs.sort_by { |obj| obj.name }
      i = 1
      new_array.each do |s|
        puts "#{i}. #{s.name} - #{s.genre.name}"
        i += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.all.detect { |a| a.name == input }
      genre_obj = Genre.all.detect { |a| a.name == input }
      new_array = genre_obj.songs.sort_by { |obj| obj.name }
      i = 1
      new_array.each do |s|
        puts "#{i}. #{s.artist.name} - #{s.name}"
        i += 1
      end
    end
  end

  def play_song
    alphabetized_songs = Song.all.sort_by { |obj| obj.name }
    puts "Which song number would you like to play?"
    song_number = gets.chomp.to_i
    if song_number > 0 && song_number <= alphabetized_songs.count
      puts "Playing #{alphabetized_songs[song_number-1].name} by #{alphabetized_songs[song_number-1].artist.name}"
    end
  end

end
