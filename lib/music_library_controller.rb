class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = " "

    until input == "exit"
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
<<<<<<< HEAD
        list_artists
      when "list genres"
        list_genres
=======
        Artist.all.each {|artist| puts "#{artist.name}"}
      when "list genres"
        Genre.all.each {|genre| puts "#{genre.name}"}
>>>>>>> 88c0132065f246fe5cb99042211c8fc95db4523e
      when "list artist"
      when "list genre"
      end
    end
  end

  def list_songs
<<<<<<< HEAD
    Song.all.sort {|x, y| x.name <=> y.name}.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort{|x, y| x.name <=> y.name}.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort{|x, y| x.name <=> y.name}.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
=======
    Song.all.sort {|x, y| x.name <=> y.name}.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
>>>>>>> 88c0132065f246fe5cb99042211c8fc95db4523e
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.strip
    if artist = Artist.find_by_name(name)
      artist.songs.sort{|x, y| x.name <=> y.name}.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets.strip
    if genre = Genre.find_by_name(name)
      genre.songs.sort{|x, y| x.name <=> y.name}.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.strip.to_i
    if number.between?(1, Song.all.count)
      song = Song.all.sort {|x, y| x.name <=> y.name}[number - 1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end

end
