class MusicLibraryController
  #attr_accessor :path

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

    choice = gets.strip
    until choice == "exit"
      if choice == "list songs"
        self.list_songs
      elsif choice == "list artists"
        self.list_artists
      elsif choice == "list genres"
        self.list_genres
      elsif choice == "list artist"
        self.list_songs_by_artist
      elsif choice == "list genre"
        self.list_songs_by_genre
      elsif choice == "play song"
        self.play_song
      end
      choice = gets.strip
    end
  end

  def list_songs
    sorted = Song.all.sort_by{ |song| song.name }
    sorted.each_with_index{|song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sorted = Artist.all.sort_by{ |artist| artist.name }
    sorted.each_with_index{|artist, i|
      puts "#{i + 1}. #{artist.name}"}
  end

  def list_genres
    sorted = Genre.all.sort_by{ |genre| genre.name }
    sorted.each_with_index{|genre, i|
      puts "#{i + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    choice = gets.strip
    artist = Artist.find_by_name(choice)
    artist
    if artist
      sort_songs = artist.songs.sort_by{|song| song.name}
      sort_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    choice = gets.strip
    genre = Genre.find_by_name(choice)
    genre
    if genre
      sort_genre = genre.songs.sort_by{|genre| genre.name}
      sort_genre.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    index = input.to_i - 1
    return_song = Song.all.sort_by { |song| song.name}[index]

    if return_song != nil && index >= 0 && index < Song.all.length
      puts "Playing #{return_song.name} by #{return_song.artist.name}"
    end
  end
end
