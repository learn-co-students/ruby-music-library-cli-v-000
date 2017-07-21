class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    new_import = MusicImporter.new(path).import
  end

  def call
      user_input = nil
    while user_input != 'exit'
      user_input = gets.chomp


    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    case user_input

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
  end #ends call method

  def list_songs
    sort = Song.all.sort_by {|song| song.name}
    sort.each_with_index {|song,index|
    puts "#{1+index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sort_name = Artist.all.sort_by {|artist| artist.name}
    sort_name.each_with_index {|artist,index|
    puts "#{1+index}. #{artist.name}"}
  end

  def list_genres
    sort_genre = Genre.all.sort_by {|genre| genre.name}
    sort_genre.each_with_index {|genre,index|
    puts "#{1+index}. #{genre.name}"}
  end

  def list_songs_by_artist

    puts "Please enter the name of an artist:"
    user_input = gets.strip
      if artist = Artist.find_by_name(user_input)
      artist_song = artist.songs.sort_by {|artist| artist.name}
      artist_song.each_with_index {|song,index|
      puts "#{1+index}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre

    puts "Please enter the name of a genre:"
    user_input = gets.strip
    if genre = Genre.find_by_name(user_input)
      genre_song = genre.songs.sort_by {|song| song.name}
      genre_song.each_with_index {|song,index|
      puts "#{1+index}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song

    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i

    if user_input.between?(1,Song.all.size)
      songs = Song.all.sort_by{|song| song.name}
      song = songs[user_input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end #ends class MusicLibraryController
