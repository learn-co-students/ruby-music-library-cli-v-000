class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
    self.alphabetize
  end

  def alphabetize
    @alphabetized_songs = Song.all.sort_by { |song| song.name }
    @alphabetized_artists = Artist.all.sort_by { |artist| artist.name }
    @alphabetized_genres = Genre.all.sort_by { |genre| genre.name }
  end

  def call

    input = ""

    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip

      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      end
    end
  end

  def list_songs
    @alphabetized_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    @alphabetized_artists.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    @alphabetized_genres.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"

    input = gets.strip

    count = 0
    @alphabetized_songs.select do |song|
      if song.artist.name == input
        puts "#{count+=1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"

    input = gets.strip

    count = 0
    @alphabetized_songs.select do |song|
      if song.genre.name == input
        puts "#{count+=1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i

    @alphabetized_songs.each_with_index do |song, index|
      if input > 0 && input - 1 == index
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
end
