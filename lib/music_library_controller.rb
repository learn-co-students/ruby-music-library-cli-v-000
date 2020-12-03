class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
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
    input = gets.chomp
    case input
    when "list songs"
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
    call unless input == "exit"
  end

  def list_songs
    song_list = Song.all.sort_by {|song| song.name}
    count = 1
    song_list.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count += 1
    end
  end

  def list_artists
    artist_list = Artist.all.sort_by {|artist| artist.name}
    count = 1
    artist_list.each do |artist|
      puts "#{count}. #{artist.name}"
      count += 1
    end
  end

  def list_genres
    genre_list = Genre.all.sort_by {|genre| genre.name}
    count = 1
    genre_list.each do |genre|
      puts "#{count}. #{genre.name}"
      count += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_by_name(gets.strip)
    count = 1
    if artist
      songs = artist.songs.sort_by {|song| song.name}
      songs.each do |song|
        puts "#{count}. #{song.name} - #{song.genre.name}"
        count += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets.strip)
    if genre
      songs = genre.songs.sort_by {|song| song.name}
      count = 1
      songs.each do |song|
        puts "#{count}. #{song.artist.name} - #{song.name}"
        count += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    if input.to_i.between?(1, Song.all.size)
      song_list = Song.all.sort_by {|song| song.name}
      song = song_list[input.to_i - 1]
      puts "Playing #{song.name} by #{song.artist.name}" if song
    end
  end



end
