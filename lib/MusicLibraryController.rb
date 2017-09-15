class MusicLibraryController

  def initialize(filepath = "./db/mp3s")
    MusicImporter.new(filepath).import
  end

  def call
    input =""
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    until input == "exit"
      input = gets.chomp

      if input == "list songs"
        list_songs
      elsif input == "list genres"
        list_genres
      elsif input == "list artists"
        list_artists
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end

    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by{|song| song.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genres
    sorted_genres = Genre.all.sort_by{|genre| genre.name}
    sorted_genres.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort_by{|artist| artist.name}
    sorted_artists.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp

    artist_results = Artist.all.detect do |artist|
      artist.name == input
    end

    unless artist_results == (nil)
      sorted_results = artist_results.songs.sort_by{|song| song.name}

      sorted_results.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end

  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp

    genre_results = Genre.all.detect do |genre|
      genre.name == input
    end

    unless genre_results == (nil)
      sorted_results = genre_results.songs.sort_by{|song| song.name}

      sorted_results.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end

    def play_song

      songs = Song.all.sort_by{|song| song.name}
      puts "Which song number would you like to play?"

      input = gets.chomp.to_s
      if input <= songs.count.to_s && input > "0"

        songs.each_with_index do |song, index|
          if input == (index+1).to_s
            puts "Playing #{song.name} by #{song.artist.name}"
          end
        end
      end
    end


  end


end
