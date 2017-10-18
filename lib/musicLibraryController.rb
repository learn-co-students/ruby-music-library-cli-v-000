class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
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
    until input == "exit"
      input = gets.chomp
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
    x = 0
    alphabetized = Song.all.sort_by{|song| song.name} #alphabetize songs
    alphabetized.collect {|song| x += 1 #number songs
      puts "#{x}. #{song.artist.name} - #{song.name} - #{song.genre.name}"} #print songs from music library
  end

  def list_artists
    x = 0
    alphabetized = Artist.all.sort_by{|artist| artist.name} #alphabetize artists
    alphabetized.collect {|artist| x += 1 #number artists
      puts "#{x}. #{artist.name}"} #print artists from music library
  end

  def list_genres
    x = 0
    alphabetized = Genre.all.sort_by{|genre| genre.name} #alphabetize genres
    alphabetized.collect {|genre| x += 1 #number genres
      puts "#{x}. #{genre.name}"} #print genres from music library
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      x = 0
      alphabetized = artist.songs.sort_by{|song| song.name} #alphabetize songs
      alphabetized.collect {|song| x += 1 #number songs
        puts "#{x}. #{song.name} - #{song.genre.name}"} #print songs from music library
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      x = 0
      alphabetized = genre.songs.sort_by{|song| song.name} #alphabetize songs
      alphabetized.collect {|song| x += 1 #number songs
        puts "#{x}. #{song.artist.name} - #{song.name}"} #print songs from music library
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    alphabetized = Song.all.sort_by{|song| song.name}
    if (1...alphabetized.length).include?(input) #check if input is valid
      puts "Playing #{alphabetized[input-1].name} by #{alphabetized[input-1].artist.name}"
    end
  end




end
