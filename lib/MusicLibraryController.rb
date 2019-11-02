class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
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
    counter = 0
    array = Song.all.sort_by{|a| a.name}
    array.each do |song|
      puts "#{counter+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    counter = 0
    array = Artist.all.sort_by{|a| a.name}
    array.each do |artist|
      puts "#{counter+=1}. #{artist.name}"
    end
  end

  def list_genres
    counter = 0
    array = Genre.all.sort_by{|a| a.name}
    array.each do |genre|
      puts "#{counter+=1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    counter = 0
    puts "Please enter the name of an artist:"
    input = gets.strip
    if artist = Artist.find_by_name(input)
      artist.songs.sort_by{|a| a.name}.each do |song|
        puts "#{counter+=1}. #{song.name} - #{song.genre.name}"
       end
     end
  end

  def list_songs_by_genre
    counter = 0
    puts "Please enter the name of a genre:"
    input = gets.strip
    if genre = Genre.find_by_name(input)
      genre.songs.sort_by{|a| a.name}.each do |song|
        puts "#{counter+=1}. #{song.artist.name} - #{song.name}"
       end
     end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort_by{|a| a.name} [input-1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
   end
end
