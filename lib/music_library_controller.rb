require 'pry'
class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(@path)
    importer.import
  end
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts"To play a song, enter 'play song'."
    puts"To quit, type 'exit'."
    puts "What would you like to do?"

    user_input = ""

    while user_input != "exit"
      user_input = gets.chomp     

      case user_input
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


    def list_songs
      sorted_list = Song.all.sort {|a, b| a.name <=> b.name}
      i = 1
      sorted_list.each do |song|
        puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        i += 1
      end
    end

    def list_artists
      sorted_artists = Artist.all.sort {|a, b| a.name <=> b.name}
      sorted_artists.each_with_index {|artist, i| puts "#{i + 1}. #{artist.name}"}
    end

    def list_genres
      sorted_genres = Genre.all.sort  {|a, b| a.name <=> b.name}
      sorted_genres.each_with_index {|genre, i| puts "#{i + 1}. #{genre.name}"}
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist = gets.chomp
      artist_songs = Artist.find_or_create_by_name(artist).songs
      artist_songs_sorted = artist_songs.sort {|a, b| a.name <=> b.name}
      artist_songs_sorted.each_with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre = gets.chomp
      genre_songs = Genre.find_or_create_by_name(genre).songs
      genre_songs_sorted = genre_songs.sort {|a, b| a.name <=> b.name}
      genre_songs_sorted.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"        
      end      
    end

    def play_song
      puts "Which song number would you like to play?"
      sorted = Song.all.sort {|a, b| a.name <=> b.name}
      song_number = gets.chomp.to_i - 1
        if sorted[song_number] != nil && song_number >= 1 && song_number < sorted.length
          puts "Playing #{sorted[song_number].name} by #{sorted[song_number].artist.name}"
        end

    end

  end

end
