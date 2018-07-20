class MusicLibraryController

  def initialize(file_path = './db/mp3s')
    @path = file_path
    music_importer = MusicImporter.new(@path)
    music_importer.import
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
    reply = gets.chomp

    case reply
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
    when 'exit'
    else
      call
    end
    # unless reply == "exit"
    #   call
    # end
  end

  def list_songs
    sorted_songs = Song.all.sort_by {|song| song.name}
    sorted_songs.each_with_index {|song, idx| puts "#{idx+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    sorted_artists = Artist.all.sort_by {|artist| artist.name}
    sorted_artists.each_with_index {|artist, idx| puts "#{idx+1}. #{artist.name}"}
  end

  def list_genres
    sorted_genres = Genre.all.sort_by {|genre| genre.name}
    sorted_genres.each_with_index {|genre, idx| puts "#{idx+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if artist
      sorted_songs = artist.songs.sort_by {|song| song.name}
      sorted_songs.each_with_index {|song, idx| puts "#{idx+1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre
      sorted_songs = genre.songs.sort_by {|song| song.name}
      sorted_songs.each_with_index {|song, idx| puts "#{idx+1}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    sorted_songs = Song.all.sort_by {|song| song.name}
    puts "Which song number would you like to play?"
    #list_songs
    input = gets.chomp.to_i
    if input.between?(1,sorted_songs.count)
      song = sorted_songs[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
