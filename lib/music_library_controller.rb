class MusicLibraryController

  extend Concerns::Findable

  def initialize (path="./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
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
    sorted_by_name = Song.all.sort_by { |song| song.name }
    sorted = sorted_by_name.uniq
    sorted.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
   end

   def list_artists
    sorted_by_name = Artist.all.sort_by { |artist| artist.name }
    sorted_by_name.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    sorted_by_name = Genre.all.sort_by { |genre| genre.name }
    sorted_by_name.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
      if artist != nil
      sorted_by_name = artist.songs.sort_by { |songs|songs.name }
      sorted_by_name.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre != nil
      sorted_by_name = genre.songs.sort_by { |genre| genre.name }
      sorted_by_name.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

   def play_song
    puts "Which song number would you like to play?"
    sorted_by_name = Song.all.sort_by { |song| song.name }
    sorted = sorted_by_name.uniq
    list_songs = sorted.each.with_index(1){ |song,index| }
    input = gets.strip.to_i
    if (1..list_songs.length).include?(input)
      song = list_songs[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end
