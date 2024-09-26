class MusicLibraryController
attr_accessor :path

  def initialize(path = ("./db/mp3s"))
    @path = path
    new = MusicImporter.new(@path)
    new.import
  end

  def call #adapted from OO Tic Tac Toe
    @user_input = ""
    while @user_input != "exit"
      puts "Welcome to your music library!" #copy from spec
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      @user_input = gets.strip
      if @user_input == "list songs"
        list_songs
      elsif @user_input == "list artists"
        list_artists
      elsif @user_input == "list genres"
        list_genres
      elsif @user_input == "list artist"
        list_songs_by_artist
      elsif @user_input == "list genre"
        list_songs_by_genre
      elsif @user_input == "play song"
        play_song
      end
    end
  end
#in order, from spec
  def list_songs
    temp = Song.all.sort{|songA, songB| songA.name <=> songB.name} #sorting lab, refactor with .with_index(offset=1)?
    counter = 1
    temp.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_artists
    temp = Artist.all.sort{|artistA, artistB| artistA.name <=> artistB.name}
    counter = 1
    temp.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_genres
    temp = Genre.all.sort{|genreA, genreB| genreA.name <=> genreB.name}
    counter = 1
    temp.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist #oops, name genre not artist name
    puts "Please enter the name of an artist:"
    artist_input = gets.strip
    counter = 1
    Artist.all.each do |artist|
      if artist.name == artist_input
        temp = artist.songs.sort{|songA, songB| songA.name <=> songB.name}
        temp.each do |song|
          puts "#{counter}. #{song.name} - #{song.genre.name}"
          counter += 1
        end
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    counter = 1
    Genre.all.each do |genre|
      if genre.name == genre_input
        temp = genre.songs.sort{|genreA, genreB| genreA.name <=> genreB.name}
        temp.each do |song|
          puts "#{counter}. #{song.artist.name} - #{song.name}"
          counter += 1
        end
      end
    end
  end

  def play_song #how does the user know which number?
    puts "Which song number would you like to play?"
    song_input = gets.strip.to_i
    temp = Song.all.sort{|songA, songB| songA.name <=> songB.name}
    counter = 1
    while counter <= Song.all.size
      temp.each do |song|
        if counter == song_input
          puts "Playing #{song.name} by #{song.artist.name}"
        end
        counter += 1
      end
    end
  end

end
